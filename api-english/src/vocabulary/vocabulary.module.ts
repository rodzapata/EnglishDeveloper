import { Module } from '@nestjs/common';
import { VocabularyService } from './vocabulary.service';
import { VocabularyController } from './vocabulary.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  imports:[VocabularyModule, PrismaModule],
  controllers: [VocabularyController],
  providers: [VocabularyService],
})
export class VocabularyModule { }
