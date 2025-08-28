import { IsOptional, IsString } from "class-validator";
import { IsNotEmpty } from "class-validator/types/decorator/common/IsNotEmpty";

export class CreateSubjectDto {
    @IsNotEmpty({message : "Name should not be empty"})
    @IsString({message : "Name must be a string"})
    title: string;
    
    @IsOptional()
    description?: string;
}
