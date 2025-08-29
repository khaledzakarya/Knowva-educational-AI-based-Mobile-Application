import { Controller, Get, Post, Body, Patch, Param, Delete, UseInterceptors, UploadedFile, BadRequestException, Query, ParseIntPipe, UseGuards } from '@nestjs/common';
import { LessonService } from './lesson.service';
import { CreateLessonDto } from './dto/create-lesson.dto';
import { UpdateLessonDto } from './dto/update-lesson.dto';
import * as multer from 'multer';
import { diskStorage, memoryStorage } from 'multer';

import { FileInterceptor } from '@nestjs/platform-express'
import { AuthenticationGuard } from 'src/guards/authentication.guard';
import { AuthorizationGuard } from 'src/guards/authorization.guard';
import { Roles } from 'src/decorator/decorator/roles.decorator';
import { Role } from 'src/decorator/enums/roles';
@Controller('lesson')
export class LessonController {
  constructor(private readonly lessonService: LessonService) {}

  @Post('create')
  @Roles(Role.TEACHER)
  @UseGuards(AuthenticationGuard,AuthorizationGuard)
  @UseInterceptors(
    FileInterceptor('file'  , {
      storage: memoryStorage(),

      fileFilter: (req, file, cb) => {
        if (!file) {
          return cb(new BadRequestException('File is required'), false);
        }
        cb(null, true);
      }
    }),
  )
  /**
   * Creates a new lesson
   * @param file the file to upload. Must be a valid file
   * @param CreateLessonDto the lesson data
   * @param subjectId the id of the subject this lesson belongs to
   * @returns the created lesson object
   */
  create(@UploadedFile() file: Express.Multer.File, @Query('subjectId') subjectId: string ,@Body() CreateLessonDto : CreateLessonDto ) {
    return this.lessonService.create(file , CreateLessonDto , +subjectId);
  }

  @Get('for-subject/:subjectId')
  /**
   * Retrieves all lessons for the given subject id
   * @param subjectId the id of the subject to find lessons for
   * @returns an array of lesson objects
   */
  findAllForSubject(@Param('subjectId', ParseIntPipe) subjectId: number) {
    return this.lessonService.findAllForSubject(subjectId);
  }

  @Get(':id')
  /**
   * Retrieves a single lesson by its id
   * @param id the id of the lesson to retrieve
   * @returns the lesson object
   */
  findOne(@Param('id') id: string) {
    return this.lessonService.findOne(+id);
  }

  @Delete(':id')
  @Roles(Role.TEACHER)
  @UseGuards(AuthenticationGuard,AuthorizationGuard)
  /**
   * Deletes a lesson by its id
   * @param id the id of the lesson to delete
   * @returns a message indicating the lesson was deleted successfully
   */
  remove(@Param('id') id: string) {
    return this.lessonService.remove(+id);
  }
}
