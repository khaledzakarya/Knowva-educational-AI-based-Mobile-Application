import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { SubjectService } from './subject.service';
import { CreateSubjectDto } from './dto/create-subject.dto';
import { UpdateSubjectDto } from './dto/update-subject.dto';
import { PrismaService } from 'src/database/prisma.service';
import { AuthenticationGuard } from 'src/guards/authentication.guard';
import { AuthorizationGuard } from 'src/guards/authorization.guard';
import { Roles, ROLES_KEY } from 'src/decorator/decorator/roles.decorator';
import { Role } from 'src/decorator/enums/roles';


@Controller('subject')
export class SubjectController {
  constructor(private readonly subjectService: SubjectService,


  ) { }

  @Post('create')
  @Roles(Role.TEACHER)
  @UseGuards(AuthenticationGuard, AuthorizationGuard)
  create(@Body() createSubjectDto: CreateSubjectDto, @Req() req: any) {
    return this.subjectService.create(createSubjectDto, +req.user.id);
  }



  @Get('subject/:id')
  findOne(@Param('id') id: string) {
    return this.subjectService.findOne(+id);
  }

  @Get('all')
  findall(){
    return this.subjectService.findall();
  }

  @Patch(':id')
  @Roles(Role.TEACHER)
  @UseGuards(AuthenticationGuard, AuthorizationGuard)
  update(@Param('id') id: string, @Body() updateSubjectDto: UpdateSubjectDto , @Req() req: any) {
    return this.subjectService.update(+id, updateSubjectDto , +req.user.id);
  }

  @Delete(':id')
  @Roles(Role.TEACHER)
  @UseGuards(AuthenticationGuard, AuthorizationGuard)
  remove(@Param('id') id: string , @Req() req: any) {
    return this.subjectService.remove(+id, +req.user.id);
  }
}
