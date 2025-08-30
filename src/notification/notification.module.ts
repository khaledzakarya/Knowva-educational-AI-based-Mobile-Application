import { Module } from '@nestjs/common';
import { NotificationService } from './notification.service';
import { NotificationGateway } from './notification.gateway';
import { PrismaService } from 'src/database/prisma.service';
import { NotificationController } from './notification.controller';

@Module({
  providers: [NotificationGateway, NotificationService , PrismaService],
  exports: [NotificationService, NotificationGateway],
  controllers: [NotificationController],
})
export class NotificationModule {}
