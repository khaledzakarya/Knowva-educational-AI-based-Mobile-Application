import { Controller, Get, Post } from '@nestjs/common';
import { MailService } from './mail.service';

@Controller('mail')
export class MailController {
  constructor(private readonly mailService: MailService) {}

  @Get()
  async sendMail() {
    await this.mailService.sendEmail({
      subject: 'test mail subject',
      template: 'test',
      context: { name: 'test' },
      to: 'OoV5R@example.com',
    });
  }
}