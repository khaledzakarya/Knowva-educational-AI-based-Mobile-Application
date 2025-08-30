import { Controller, Get, Param, Put } from '@nestjs/common';
import { NotificationService } from './notification.service';

@Controller('notification')
export class NotificationController {
    constructor(private readonly notificationService: NotificationService) {}

    @Put('mark-as-read/:id')
    async markAllAsRead(@Param('id') id: string) {
        return await this.notificationService.markAsRead(+id);
    }

    @Get('unread-count/:userId')
    async getUnreadCount(@Param('userId') userId: string) {
        return this.notificationService.getUnreadCount(+userId);
    }

    @Get('user-notifications/:userId')
    async getUserNotifications(@Param('userId') userId: string) {
        return this.notificationService.getUserNotifications(+userId);
    }
}
