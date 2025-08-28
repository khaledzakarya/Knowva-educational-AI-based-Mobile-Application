import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateAuthDto } from './dto/create-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { PrismaService } from 'src/database/prisma.service';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { Role, User } from 'generated/prisma';
import { LoginDto } from './dto/login.dto';
import otpGenerator from "otp-generator";
import { MailService } from 'src/mail/mail.service';
import { LoginResponse, RegisterResponse } from 'src/helper/interfaces/interfaces.response';
@Injectable()
export class AuthService {

  constructor(private prisma: PrismaService, private jwtService: JwtService, private configService: ConfigService ,
    private readonly mailService: MailService
  ) { }
  async create(createAuthDto: CreateAuthDto): Promise<RegisterResponse> {
    const useremail = await this.prisma.user.findUnique({
      where: {
        email: createAuthDto.email
      }
    });
    if (useremail) {
      throw new Error('Email already exists');
    }
    const hashedPassword = await this.hashPassword(createAuthDto.password);
    let role: Role;
    if (createAuthDto.roleToken === this.configService.get<string>('TEACHER_TOKEN')) {
      role = Role.TEACHER;
    } else {

      role = Role.STUDENT;
    }
    const user = await this.prisma.user.create({
      data: {
        role: role,
        email: createAuthDto.email,
        password: hashedPassword,
        name: createAuthDto.name
      }
    });
    const token = await this.generateJwt({ id: user.id, role: user.role });

    return {
      ...user,
      token
    }



  }

  async login(loginDto: LoginDto): Promise<LoginResponse> {
    const user = await this.prisma.user.findUnique({
      where: {
        email: loginDto.email
      }
    });
    if (!user) {
      throw new Error('User not found');
    }
    const isMatch = await this.comparePassword(loginDto.password, user.password);
    if (!isMatch) {
      throw new Error('Invalid password');
    }
    const token = await this.generateJwt({ id: user.id, role: user.role });
    return {
      token,
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role
      }
    }
  }
   

  async forgetPassword(email: string) : Promise<{ message: string }> {
    const user = await this.prisma.user.findUnique({ where: { email } });
    if (!user) throw new NotFoundException('User not found');
    const otp = this.generateOtp();
    const expiresAt = new Date(Date.now() + 15 * 60 * 1000); // 15 minutes from now
    await this.prisma.otpToken.create({
      data: {
        userId: user.id,
        otp,
        expiresAt
      }
    });

    await this.mailService.sendEmail({
      to: email,
      subject: 'Password Reset OTP',
      template: 'forgot-password', // match the template filename without .hbs
      context: {
        username: user.name ?? 'User',
        otp,
        year: new Date().getFullYear(),
      },
    });

    return { message: 'OTP sent to your email' };

  }

  async verifyOtp(email: string, otp: string) : Promise<{ message: string }> {
    const user = await this.prisma.user.findUnique({ where: { email } });
    if (!user) throw new NotFoundException('User not found');
    const otpToken = await this.prisma.otpToken.findFirst({
      where: {
        userId: user.id,
        otp,
        expiresAt: {
          gt: new Date()
        }
      }
    });
    if (!otpToken) throw new Error('Invalid OTP');
    await this.prisma.otpToken.deleteMany({
      where: {
        userId: user.id
      }
    });
    return { message: 'OTP verified successfully' };
  }

  update(id: number, updateAuthDto: UpdateAuthDto) {
    return `This action updates a #${id} auth`;
  }

  remove(id: number) {
    return `This action removes a #${id} auth`;
  }

  async hashPassword(password: string): Promise<string> {
    let saltRounds = 10;
    let hashPassword = await bcrypt.hash(password, saltRounds);
    return hashPassword;
  }

  async comparePassword(password: string, hashedPassword: string): Promise<boolean> {
    let isMatch = await bcrypt.compare(password, hashedPassword);
    return isMatch;
  }

  async generateJwt(payload: any): Promise<string> {
    let token = await this.jwtService.signAsync(payload, {
      secret: process.env.JWT_SECRET
    });
    return token;
  }

  private generateOtp(): string {
    const otp = otpGenerator.generate(5, { upperCaseAlphabets: false, specialChars: false, lowerCaseAlphabets: false });
    return otp;
  }
}
