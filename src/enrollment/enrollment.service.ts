import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateEnrollmentDto } from './dto/create-enrollment.dto';
import { UpdateEnrollmentDto } from './dto/update-enrollment.dto';
import { PrismaService } from 'src/database/prisma.service';
import { Membership, Status } from 'generated/prisma';

@Injectable()
export class EnrollmentService {
  constructor(
    private prisma : PrismaService
  ){}
  async create(groupId: number, userId: number): Promise<Membership> {
    let group = await this.prisma.group.findUnique({
      where: {
        id: groupId
      }
    });
    if(!group) throw new BadRequestException("Group not found");
    
    let enrollment = await this.prisma.membership.create({
      data: {
        groupId: groupId,
        studentId: userId,
        status: Status.PENDING
      }
    });
    return enrollment;
  }

  async findAll(groupId: number) : Promise<Membership[]> {
    let group = await this.prisma.group.findUnique({
      where: {
        id: groupId

      },
      
    });
    if(!group) throw new BadRequestException("Group not found");
    let enrollments = await this.prisma.membership.findMany({
      where: {
        groupId: groupId
      },
      include: {
        student: {
          select: {
            id: true,
            name: true,
            email: true,
          }
        }
      }
    });
    return enrollments;
  }

  async findAllByUser(userId : number) : Promise<Membership[]>{
    let enrollments = await this.prisma.membership.findMany({
      where: {
        studentId: userId
      }
    });
    return enrollments;
    
  }

  async update(id: number) {
    let enrollment = await this.prisma.membership.findUnique({
      where: {
        id: id
      }
    });
    if(!enrollment) throw new BadRequestException("Enrollment not found");
    if(enrollment.status !== Status.PENDING) throw new BadRequestException("Enrollment already processed");
    let updatedEnrollment = await this.prisma.membership.update({
      where: {
        id: id
      },
      data: {
        status: Status.APPROVED
      }
    });
    return updatedEnrollment;
  }

  async reject(id: number) {
    let enrollment = await this.prisma.membership.findUnique({
      where: {
        id: id
      }
    });
    if(!enrollment) throw new BadRequestException("Enrollment not found");
    if(enrollment.status !== Status.PENDING) throw new BadRequestException("Enrollment already processed");
    let updatedEnrollment = await this.prisma.membership.update({
      where: {
        id: id
      },
      data: {
        status: Status.REJECTED
      }
    });
    return updatedEnrollment;
  }
}
