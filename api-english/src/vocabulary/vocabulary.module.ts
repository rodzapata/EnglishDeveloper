import { Module } from '@nestjs/common';
import { VocabularyService } from './vocabulary.service';
import { VocabularyController } from './vocabulary.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  controllers: [VocabularyController],
  providers: [VocabularyService],
  imports: [PrismaModule]
})
export class VocabularyModule { }
