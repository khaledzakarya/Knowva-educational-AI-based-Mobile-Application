import { Injectable } from '@nestjs/common';
import { CreateNotificationDto } from './dto/create-notification.dto';
import { UpdateNotificationDto } from './dto/update-notification.dto';
import { PrismaService } from 'src/database/prisma.service';

@Injectable()
export class NotificationService {
  constructor(private prisma: PrismaService) { }
  async create(useId: number, message: string) {
    let notification = await this.prisma.notification.create({
      data: {
        userId: useId,
        message: message
      }
    });
    return notification;
  }

  async markAsRead(id: number) {
    let notification = await this.prisma.notification.update({
      where: {
        id: id
      },
      data: {
        read: true
      }
    });
    return notification;
  }

  async getUserNotifications(userId: number) {
    let notifications = await this.prisma.notification.findMany({
      where: {
        userId: userId
      },
      orderBy: {
        createdAt: 'desc'
      }
    });
    return notifications;
  }
}




