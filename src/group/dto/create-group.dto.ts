import { IsNotEmpty, IsNumber, IsString } from "class-validator";

export class CreateGroupDto {
    @IsString({ message: 'Name must be a string' })
    @IsNotEmpty({ message: 'Name should not be empty' })
    name: string;
    @IsNotEmpty({ message: 'Capacity should not be empty' })
    @IsNumber({}, { message: 'Capacity must be a number' })
    capacity: number = 10;
}
