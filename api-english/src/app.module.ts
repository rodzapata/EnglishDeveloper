import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { VocabularyModule } from './vocabulary/vocabulary.module';
import { PrismaModule } from './prisma/prisma.module';
import { BulkUploadModule } from './bulk-upload/bulk-upload.module';

@Module({
  imports: [VocabularyModule, PrismaModule, BulkUploadModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
