import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateNotificationDto } from './dto/create-notification.dto';
import { UpdateNotificationDto } from './dto/update-notification.dto';
import { PrismaService } from 'src/database/prisma.service';
import { Notification } from 'generated/prisma';

@Injectable()
export class NotificationService {
  constructor(private prisma: PrismaService) { }
  async create(useId: number, message: string) : Promise<Notification> {
    let notification = await this.prisma.notification.create({
      data: {
        userId: useId,
        message: message
      }
    });
    return notification;
  }

  async markAsRead(id: number) : Promise<Notification> {
    let notification = await this.prisma.notification.findUnique({
      where: { id: id }
    });
    if (!notification) {
      throw new BadRequestException('Notification not found');
    }
    if (notification.read === true) {
      return notification;
    }
    let undatednotification = await this.prisma.notification.update({
      where: {
        id: id
      },
      data: {
        read: true
      }
    });
    return {
      ...undatednotification
    };
  }

  async getUserNotifications(userId: number) : Promise<Notification[]> {
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

  async getUnreadCount(userId: number) : Promise<{ count: number }> {
    let count = await this.prisma.notification.count({
      where: {
        userId: userId,
        read: false
      },
    });
    return {
      count: count
    };
  }
}




