import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateSubjectDto } from './dto/create-subject.dto';
import { UpdateSubjectDto } from './dto/update-subject.dto';
import { PrismaService } from 'src/database/prisma.service';
import { Subject } from 'generated/prisma';

@Injectable()
export class SubjectService {
  constructor( private prisma: PrismaService,
  ) {}
   async  create(createSubjectDto: CreateSubjectDto , userId : number) :Promise<Subject>{
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
        teacherId : userId,
      },
    });
    return subject;
    
    
  }

  

  async findOne(id: number) {
    let subject = await this.prisma.subject.findUnique({
      where: {
        id: id,
      },
    });
    return subject;
  }

  async update(id: number, updateSubjectDto: UpdateSubjectDto) : Promise<Subject> {
    let subject = await this.prisma.subject.update({
      where: {
        id: id,
      },
      data: {
        title: updateSubjectDto.title,
        description: updateSubjectDto.description,
      },
    });
    return subject;
    
  }

  async remove(id: number) {
    let subject = await this.prisma.subject.delete({
      where: {
        id: id,
      },
    });
    return subject;
    
  }
}
