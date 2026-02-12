-- CreateTable
CREATE TABLE "part_of_speech" (
    "id" SERIAL NOT NULL,
    "word" TEXT NOT NULL,
    "translation" TEXT,

    CONSTRAINT "pk_part_of_speech" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dictionary" (
    "id" SERIAL NOT NULL,
    "word" TEXT NOT NULL,
    "pronunciation" TEXT NOT NULL,
    "period_type" INTEGER NOT NULL,

    CONSTRAINT "pk_dictionary" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dictionary_translation" (
    "id" SERIAL NOT NULL,
    "translation" TEXT NOT NULL,
    "dictionary_id" INTEGER NOT NULL,
    "part_of_speech_id" INTEGER NOT NULL,

    CONSTRAINT "pk_dictionary_translation" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "learned_vocabulary" (
    "id" SERIAL NOT NULL,
    "sentence" TEXT NOT NULL,
    "translation" TEXT NOT NULL,
    "vocabulary_source_id" INTEGER NOT NULL,
    "dictionary_translation_id" INTEGER NOT NULL,

    CONSTRAINT "pk_learned_vocabulary" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vocabulary_source" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "pk_vocabulary_source" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "uq_part_of_speech_word" ON "part_of_speech"("word");

-- CreateIndex
CREATE UNIQUE INDEX "uq_dictionary_word" ON "dictionary"("word");

-- CreateIndex
CREATE INDEX "idx_dictionary_translation_dictionary_id" ON "dictionary_translation"("dictionary_id");

-- CreateIndex
CREATE INDEX "idx_dictionary_translation_part_of_speech_id" ON "dictionary_translation"("part_of_speech_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_dictionary_translation_unique" ON "dictionary_translation"("dictionary_id", "part_of_speech_id", "translation");

-- CreateIndex
CREATE INDEX "idx_learned_vocabulary_dictionary_translation_id" ON "learned_vocabulary"("dictionary_translation_id");

-- CreateIndex
CREATE INDEX "idx_learned_vocabulary_vocabulary_source_id" ON "learned_vocabulary"("vocabulary_source_id");

-- AddForeignKey
ALTER TABLE "dictionary_translation" ADD CONSTRAINT "fk_dictionary_translation_dictionary" FOREIGN KEY ("dictionary_id") REFERENCES "dictionary"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dictionary_translation" ADD CONSTRAINT "fk_dictionary_translation_part_of_speech" FOREIGN KEY ("part_of_speech_id") REFERENCES "part_of_speech"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "learned_vocabulary" ADD CONSTRAINT "fk_learned_vocabulary_dictionary_translation" FOREIGN KEY ("dictionary_translation_id") REFERENCES "dictionary_translation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "learned_vocabulary" ADD CONSTRAINT "fk_learned_vocabulary_vocabulary_source" FOREIGN KEY ("vocabulary_source_id") REFERENCES "vocabulary_source"("id") ON DELETE CASCADE ON UPDATE CASCADE;
