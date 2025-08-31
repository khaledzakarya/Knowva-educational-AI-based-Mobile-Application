import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateAuthDto } from './dto/create-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { PrismaService } from 'src/database/prisma.service';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { Role, User } from 'generated/prisma';
import { LoginDto } from './dto/login.dto';
const otpGenerator = require('otp-generator')
import { MailService } from 'src/mail/mail.service';
import { LoginResponse, RegisterResponse, UpdateProfileResponse } from 'src/helper/interfaces/interfaces.response';
@Injectable()
export class AuthService {

  constructor(private prisma: PrismaService, private jwtService: JwtService, private configService: ConfigService,
    private readonly mailService: MailService
  ) { }

  /**
   * @description Create a new user
   * @method create
   * @param createAuthDto 
   * @returns RegisterResponse
   */
  async create(createAuthDto: CreateAuthDto): Promise<RegisterResponse> {
    const useremail = await this.prisma.user.findUnique({
      where: {
        email: createAuthDto.email
      }
    });
    if (useremail) {
      throw new BadRequestException('Email already exists');
    }
    if (createAuthDto.password !== createAuthDto.confirmPassword) {
      throw new BadRequestException('Password does not match');
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

  /**
   * @description Login a user
   * @method get
   * @param loginDto 
   * @returns LoginResponse
   */
  async login(loginDto: LoginDto): Promise<LoginResponse> {
    const user = await this.prisma.user.findUnique({
      where: {
        email: loginDto.email
      }
    });
    if (!user) {
      throw new NotFoundException('User not found');
    }
    const isMatch = await this.comparePassword(loginDto.password, user.password);
    if (!isMatch) {
      throw new BadRequestException('Invalid password');
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

  /**
   * @description Forget password - generate OTP and send to email
   * @param email 
   * @returns { message: string }
   */
  async forgetPassword(email: string): Promise<{ message: string }> {
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

  /**
   * 
   * @param email 
   * @description Verify OTP
   * @param otp 
   * @returns { message: string }
   */
  async verifyOtp(email: string, otp: string): Promise<{ message: string }> {
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
    if (!otpToken) throw new BadRequestException('Invalid OTP');
    await this.prisma.otpToken.deleteMany({
      where: {
        userId: user.id
      }
    });
    return { message: 'OTP verified successfully' };
  }

  /**
   * 
   * @param id 
   * @description Get user profile
   * @returns { id, name, email, role }
   */
  async getProfile(id: number) {
    const user = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    });
    if (!user) {
      throw new NotFoundException('User not found');
    }
    return {
      id: user.id,
      name: user.name,
      email: user.email,
      role: user.role
    };
  }

  /**
   * 
   * @param id 
   * @description Update user profile
   * @param updateAuthDto 
   * @returns UpdateProfileResponse
   */

  async update(id: number, updateAuthDto: UpdateAuthDto): Promise<UpdateProfileResponse> {
    const user = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    });
    if (!user) {
      throw new NotFoundException('User not found');
    }
    let updatedData: Partial<User> = { ...updateAuthDto };
    if (updateAuthDto.password) {
      updatedData.password = await this.hashPassword(updateAuthDto.password);
    }
    const updatedUser = await this.prisma.user.update({
      where: {
        id: id
      },
      data: updatedData
    });
    const token = await this.generateJwt({ id: updatedUser.id, role: updatedUser.role });
    return {
      id: updatedUser.id,
      name: updatedUser.name,
      email: updatedUser.email,
      role: updatedUser.role,
      token
    };
  }

  /**
   * 
   * @param id 
   * @description Delete user
   * @param updateAuthDto
   * @returns { message: string }
   *  
   */

  async remove(id: number) {
    const user = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    });
    if (!user) {
      throw new NotFoundException('User not found');
    }
    await this.prisma.user.delete({
      where: {
        id: id
      }
    });
    return { message: 'User deleted successfully' };
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
    const otp = Math.floor(1000 + Math.random() * 9000).toString();
    console.log(otp); // e.g., "5732"
    return otp;
  }
}
