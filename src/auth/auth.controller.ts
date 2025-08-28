import { Controller, Get, Post, Body, Patch, Param, Delete, Req, UseGuards, Query, Logger } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateAuthDto } from './dto/create-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { LoginDto } from './dto/login.dto';
import { AuthenticationGuard } from 'src/guards/authentication.guard';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  create(@Body() createAuthDto: CreateAuthDto) {
    return this.authService.create(createAuthDto);
  }

  @Post('login')
  login(@Body() loginDto: LoginDto) {
    return this.authService.login(loginDto);
  }

  @Get('forget-password')
  findOne(@Query('email') email: string) {
    Logger.log(email, 'email');
    return this.authService.forgetPassword(email);
  }

  @Post('verify-otp')
   verifyOtp(@Body() body: { email: string; otp: string }) {
    return this.authService.verifyOtp(body.email, body.otp);
  }

  @Get('profile')
  @UseGuards(AuthenticationGuard)
  getProfile(@Req() req: any) {

    return this.authService.getProfile(+req.user.id);
  }

  @Patch('update-profile')
  @UseGuards(AuthenticationGuard)
  update(@Req() req: any, @Body() updateAuthDto: UpdateAuthDto) {
    return this.authService.update(+req.user.id, updateAuthDto);
  }

  @Delete('delete-account')
  @UseGuards(AuthenticationGuard)
  remove(@Req() req: any) {
    return this.authService.remove(+req.user.id);
  }
}
