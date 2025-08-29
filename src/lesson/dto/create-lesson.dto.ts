import { IsEnum, IsNotEmpty, IsString } from "class-validator";
import { LessonType } from "generated/prisma";

export class CreateLessonDto {
    @IsString()
    @IsNotEmpty({message : "Title should not be empty"})
    title: string;
    
}
