import { PartialType } from '@nestjs/mapped-types';
import { CreateGroupDto } from './create-group.dto';
import { IsOptional } from 'class-validator';

export class UpdateGroupDto  {
    @IsOptional()
    name?: string;
}
