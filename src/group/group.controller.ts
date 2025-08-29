import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { GroupService } from './group.service';
import { CreateGroupDto } from './dto/create-group.dto';
import { UpdateGroupDto } from './dto/update-group.dto';
import { AuthenticationGuard } from 'src/guards/authentication.guard';
import { AuthorizationGuard } from 'src/guards/authorization.guard';
import { Roles } from 'src/decorator/decorator/roles.decorator';
import { Role } from 'src/decorator/enums/roles';

@Controller('group')
export class GroupController {
  constructor(private readonly groupService: GroupService) {}

  @Post('create/:subjectId')
  @Roles(Role.TEACHER)
  @UseGuards(AuthenticationGuard, AuthorizationGuard)
  create(@Param('subjectId') subjectId: string , @Body() createGroupDto: CreateGroupDto) {
    return this.groupService.create(createGroupDto , +subjectId);
  }

  @Get('all/:subjectId')
  findAllBySubject(@Param('subjectId') subjectId: string) {
    return this.groupService.findAllBySubject(+subjectId);
  }

  @Get('details/:id')
  findOne(@Param('id') id: string) {
    return this.groupService.findOne(+id);
  }

  @Patch(':id')
  @Roles(Role.TEACHER)
  @UseGuards(AuthenticationGuard, AuthorizationGuard)
  update(@Param('id') id: string, @Body() updateGroupDto: UpdateGroupDto , @Req () req: any) {
    return this.groupService.update(+id, updateGroupDto, +req.user.id);
  }

  @Delete(':id')
  @Roles(Role.TEACHER)
  @UseGuards(AuthenticationGuard, AuthorizationGuard)
  remove(@Param('id') id: string) {
    return this.groupService.remove(+id);
  }
}
