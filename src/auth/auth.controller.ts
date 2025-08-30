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
  /**
   * Create a new user
   * @param createAuthDto 
   * @returns RegisterResponse
   */
  create(@Body() createAuthDto: CreateAuthDto) {
    return this.authService.create(createAuthDto);
  }

  @Post('login')
  /**
   * Login a user
   * @param loginDto 
   * @returns LoginResponse
   */
  login(@Body() loginDto: LoginDto) {
    return this.authService.login(loginDto);
  }

  @Get('forget-password')
  /**
   * Forgot password - generate OTP and send to email
   * @param email 
   * @returns { message: string }
   */
  findOne(@Query('email') email: string) {
    Logger.log(email, 'email');
    return this.authService.forgetPassword(email);
  }

  @Post('verify-otp')
  /**
   * Verify OTP
   * @param email 
   * @param otp 
   * @returns { message: string }
   */
   verifyOtp(@Body() body: { email: string; otp: string }) {
    return this.authService.verifyOtp(body.email, body.otp);
  }

  @Get('profile')
  @UseGuards(AuthenticationGuard)
  /**
   * Get user profile
   * @param req the express request object
   * @returns { id, name, email, role }
   */
  getProfile(@Req() req: any) {

    return this.authService.getProfile(+req.user.id);
  }

  @Patch('update-profile')
  @UseGuards(AuthenticationGuard)
  /**
   * Update a user profile
   * @param req the express request object
   * @param updateAuthDto the user data to update
   * @returns the updated user object
   */
  update(@Req() req: any, @Body() updateAuthDto: UpdateAuthDto) {
    return this.authService.update(+req.user.id, updateAuthDto);
  }

  @Delete('delete-account')
  @UseGuards(AuthenticationGuard)
  /**
   * Delete a user account
   * @param req the express request object
   * @returns { message: string }
   */
  remove(@Req() req: any) {
    return this.authService.remove(+req.user.id);
  }
}
