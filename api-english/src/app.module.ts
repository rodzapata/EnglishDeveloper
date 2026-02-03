import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { VocabularyModule } from './vocabulary/vocabulary.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [VocabularyModule, PrismaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
