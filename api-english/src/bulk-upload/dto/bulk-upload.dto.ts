import { IsString } from 'class-validator';
export class BulkUploadDto{
    @IsString() 
    filePath: string; // Ruta temporal del archivo CSV
}