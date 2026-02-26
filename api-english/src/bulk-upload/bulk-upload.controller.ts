import { Controller, Post, UseInterceptors, UploadedFile } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { BulkUploadService } from './bulk-upload.service';
import { diskStorage } from 'multer';

@Controller('bulk-upload')
export class BulkUploadController {
  constructor(private readonly bulkUploadService: BulkUploadService) { }

  @Post()
  @UseInterceptors(FileInterceptor('file', {
    storage: diskStorage({
      destination: './uploads', filename: (req, file, cb) => { cb(null, Date.now() + '-' + file.originalname); },
    }),
  }))


  async upload(@UploadedFile() file: Express.Multer.File) {
    //console.log(file); // revisa qué propiedades trae
    await this.bulkUploadService.loadCsv(file.path);
    return { message: 'Carga masiva completada exitosamente' };
  }

}
