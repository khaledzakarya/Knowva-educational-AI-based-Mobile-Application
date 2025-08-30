import { Module } from '@nestjs/common';
import { NotificationService } from './notification.service';
import { NotificationGateway } from './notification.gateway';
import { PrismaService } from 'src/database/prisma.service';

@Module({
  providers: [NotificationGateway, NotificationService , PrismaService],
  exports: [NotificationService, NotificationGateway],
})
export class NotificationModule {}
