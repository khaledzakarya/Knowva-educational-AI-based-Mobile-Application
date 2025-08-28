import { Module } from '@nestjs/common';
import { SubjectService } from './subject.service';
import { SubjectController } from './subject.controller';
import { PrismaService } from 'src/database/prisma.service';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  controllers: [SubjectController],
  providers: [SubjectService , PrismaService],
  imports: [
    AuthModule
  ],
})
export class SubjectModule {}
