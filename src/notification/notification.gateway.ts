import { WebSocketGateway, SubscribeMessage, MessageBody, WebSocketServer, ConnectedSocket } from '@nestjs/websockets';
import { NotificationService } from './notification.service';
import { CreateNotificationDto } from './dto/create-notification.dto';
import { UpdateNotificationDto } from './dto/update-notification.dto';
import { Server, Socket } from 'socket.io';


@WebSocketGateway({
  cors: {
    origin: '*',
  },
})
export class NotificationGateway {
  constructor(private readonly notificationService: NotificationService) {}
  @WebSocketServer()
  server: Server;

  handleConnection(client: Socket) {
    const userId = client.handshake.query.userId as string;
    if (userId) {
      client.join(userId);
      console.log(`User ${userId} joined their room`);
    }
    console.log(`Client connected: ${client.id}`);
  }

  handleDisconnect(client: Socket) {
    console.log(`Client disconnected: ${client.id}`);
  }

  @SubscribeMessage('join')
  handleJoin(@MessageBody() userId: string, @ConnectedSocket() client: Socket) {
    client.join(userId);
    console.log(`User ${userId} joined room`);
  }

  sendNotification(userId: string, message: string) {
    console.log(`Sending notification to user ${userId}: ${message}`);
    this.server.to(userId).emit('notification', { message });
  }
}
