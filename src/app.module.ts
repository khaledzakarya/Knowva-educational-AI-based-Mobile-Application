import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MailModule } from './mail/mail.module';
import config from './helper/config';
@Module({
  imports: [AuthModule,
    ConfigModule.forRoot(
      {
        isGlobal: true,
        envFilePath: '.env',
        load: [config],

      }
    ),
    JwtModule.registerAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => ({
        secret: configService.get<string>('JWT_SECRET'),
        signOptions: { expiresIn: '1h' },
        global: true, 
      }),
      inject: [ConfigService],
    }),
    MailModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
