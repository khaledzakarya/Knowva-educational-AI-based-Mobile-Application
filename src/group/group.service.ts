import { BadRequestException, Injectable } from '@nestjs/common';
import { CreateGroupDto } from './dto/create-group.dto';
import { UpdateGroupDto } from './dto/update-group.dto';
import { PrismaService } from 'src/database/prisma.service';
import { Group } from 'generated/prisma';

@Injectable()
export class GroupService {
  constructor(private prisma: PrismaService) {}
  async create(createGroupDto: CreateGroupDto , subjectId: number) : Promise<Group>{
    let subject = await this.prisma.subject.findUnique({where:{ id:subjectId }});
    if(!subject) throw new BadRequestException("Subject not found");
    let group = await this.prisma.group.create({
      data: {
        name: createGroupDto.name,
        capacity: createGroupDto.capacity,
        subjectId: subjectId,
      },
    });
    return group;
  }

  async findAllBySubject(subjectId:number) : Promise<Group[]> {
    let subject = await this.prisma.subject.findUnique({where:{ id:subjectId }});
     if(!subject) throw new BadRequestException("Subject not found");
    let groups = await this.prisma.group.findMany({where:{ subjectId: subjectId }});
    return groups;
  }

  async findOne(id: number) : Promise<Group> {
    let group = await this.prisma.group.findUnique({where:{ id:id } , include: {  subject: {
      select: {
        id: true,
        title: true,
        description: true,
        teacher: {
          select: {
            id: true,
            name: true,
            email: true,
          },
        },
      },
    } }});
    if(!group) throw new BadRequestException("Group not found");
    return group; 
  }

  async update(id: number, updateGroupDto: UpdateGroupDto , userId: number) : Promise<Group> {
    
    let group = await this.prisma.group.findUnique({where:{ id:id  , subject: { teacherId: userId } }});
    if(!group) throw new BadRequestException("Group not found");
    
    let updatedGroup = await this.prisma.group.update({
      where: { id: id },
      data: {
        name: updateGroupDto.name,
      },
    });
    return updatedGroup;
    
  }

  async remove(id: number) {
    let group = await this.prisma.group.findUnique({where:{ id:id }});
    if(!group) throw new BadRequestException("Group not found");
    await this.prisma.group.delete({ where: { id: id } });
    return { message: "Group deleted successfully" };
  }
}
