import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateSubjectDto } from './dto/create-subject.dto';
import { UpdateSubjectDto } from './dto/update-subject.dto';
import { PrismaService } from 'src/database/prisma.service';
import { Subject } from 'generated/prisma';

@Injectable()
export class SubjectService {
  constructor(private prisma: PrismaService,
  ) { }
  async create(createSubjectDto: CreateSubjectDto, userId: number): Promise<Subject> {
    let user = await this.prisma.user.findUnique({
      where: {
        id: userId,
      },
    });

    let verify = await this.prisma.subject.findFirst({
      where: {
        title: createSubjectDto.title,
      },
    });

    if (verify) {
      throw new BadRequestException('Subject already exists');
    }

    let subject = await this.prisma.subject.create({
      data: {
        title: createSubjectDto.title,
        description: createSubjectDto.description,
        teacherId: userId,
      },
    });
    return subject;


  }



  async findOne(id: number) {
    let subject = await this.prisma.subject.findFirst({
      where: {
        id 
      },
      include: {
        
        teacher: {
          select: {
            password: false,
            id: true,
            email: true,
            name: true,
            
          },
        },
      },
    });
    if (!subject) {
      throw new BadRequestException('Subject not found');
    }
    return subject;
  }

  async findall(){
    let subjects = await this.prisma.subject.findMany({
      include: {
        teacher: {
          select: {
            password: false,
            id: true,
            email: true,
            name: true,
            
          },
        },
      },
      
    });
    return subjects;
  }

 

  async update(id: number, updateSubjectDto: UpdateSubjectDto , userId: number): Promise<Subject> {

    let subject = await this.prisma.subject.findUnique({
      where: {
        id: id,
      },
    });
    if (!subject) {
      throw new BadRequestException('Subject not found');
    }
    if (subject.teacherId !== userId) {
      throw new BadRequestException('You are not authorized to update this subject');
    }
    let updatedSubject = await this.prisma.subject.update({
      where: {
        id: id,
      },
      data: {
        title: updateSubjectDto.title,
        description: updateSubjectDto.description,
      },
    });
    return updatedSubject;

  }

  async remove(id: number , userId: number) {
    let subject = await this.prisma.subject.findUnique({
      where: {
        id: id,
      },
    });
    if (!subject) {
      throw new BadRequestException('Subject not found');
    }
    if (subject.teacherId !== userId) {
      throw new BadRequestException('You are not authorized to delete this subject');
    }
    let deletedSubject = await this.prisma.subject.delete({
      where: {
        id: id,
      },
    });
    return { message: 'Subject deleted successfully'};
  }
}
