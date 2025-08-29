import {  IsNotEmpty, IsOptional, IsString } from "class-validator";


export class CreateSubjectDto {
    @IsNotEmpty({message : "Name is required"})
    @IsString({message : "Name must be a string"})
    title: string;
    
    @IsOptional()
    description?: string;
}
