import { PartialType } from '@nestjs/mapped-types';
import { CreateSubjectDto } from './create-subject.dto';
import { IsOptional } from 'class-validator';


export class UpdateSubjectDto {
    @IsOptional()
    title?: string;

    @IsOptional()
    description?: string;
}
