import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateLessonDto } from './dto/create-lesson.dto';
import { UpdateLessonDto } from './dto/update-lesson.dto';
import { CloudinaryService } from './cloudinary.service';
import { UploadApiResponse } from 'cloudinary';
import { PrismaService } from 'src/database/prisma.service';
import { Lesson, LessonType } from 'generated/prisma';
import { unlink } from 'fs';

@Injectable()
export class LessonService {
  constructor(
    private readonly cloudinaryService: CloudinaryService,
    private readonly prisma: PrismaService
  ) { }
  async create(file: Express.Multer.File, CreateLessonDto: CreateLessonDto, subjectId: number): Promise<Lesson> {
    if (!subjectId) {
      throw new BadRequestException('subjectId is required');
    }
    if (!file) {
      throw new BadRequestException('File is required');
    }
    let subject = await this.prisma.subject.findUnique({
      where: {
        id: subjectId
      }
    });
    if (!subject) {
      throw new BadRequestException('Subject not found');
    }
    const result: UploadApiResponse = await this.cloudinaryService.uploadFile(file);
    // await unlink(file.path , (err) => {
    //   console.log(file.path);
    //   if (err) {
    //     console.error('Error deleting file:', err);
    //   } else {
    //     console.log('File deleted successfully');
    //   }
    // });
    let type: string;
    switch (file.mimetype) {
      case 'video/mp4':
        type = LessonType.VIDEO as string;
        break;
      case 'application/pdf':
        type = LessonType.PDF as string;
        break;
      default:
        type = LessonType.DOC as string;
    }
    let lesson = await this.prisma.lesson.create({
      data: {
        title: CreateLessonDto.title,
        url: result.secure_url,
        type: type as LessonType,
        subjectId: subjectId,
         publicId: result.public_id
      }
    });
    return lesson;
  }

  async findAllForSubject(subjectId: number): Promise<Lesson[]> {
    let lessons = await this.prisma.lesson.findMany({
      where: {
        subjectId: subjectId
      },
      include: {
        subject: {
          select: {
            title: true,
            description: true,
            teacher: { select: { name: true, email: true } }


          }
        }
      }
    });
    return lessons;
  }

  async findOne(id: number): Promise<Lesson> {
    let lesson = await this.prisma.lesson.findUnique({
      where: {
        id: id
      },
      include: {
        subject: {
          select: {
            title: true,
            description: true,
            teacher: { select: { name: true, email: true } }
          }
        }
      }
    });
    if (!lesson) {
      throw new BadRequestException('Lesson not found');
    }
    return lesson;
  }

  update(id: number, updateLessonDto: UpdateLessonDto) {
    return `This action updates a #${id} lesson`;
  }

  async remove(id: number) {
    let lesson = await this.prisma.lesson.findUnique({
      where: {
        id: id
      }
    });
    if (!lesson) {
      throw new BadRequestException('Lesson not found');
    }
    await this.prisma.lesson.delete({
      where: {
        id: id
      }
    });
    this.cloudinaryService.deleteFile(lesson.publicId);
    return { message: 'Lesson deleted successfully' };
  }
}
