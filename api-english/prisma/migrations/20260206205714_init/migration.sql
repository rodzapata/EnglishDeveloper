-- CreateTable
CREATE TABLE "part_of_speech" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "part_of_speech_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dictionary" (
    "id" SERIAL NOT NULL,
    "word" VARCHAR(100) NOT NULL,

    CONSTRAINT "dictionary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dictionary_part_of_speech" (
    "id" SERIAL NOT NULL,
    "translation" VARCHAR(200) NOT NULL,
    "dictionary_id" INTEGER NOT NULL,
    "part_of_speech_id" INTEGER NOT NULL,

    CONSTRAINT "dictionary_part_of_speech_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "part_of_speech_name_key" ON "part_of_speech"("name");

-- CreateIndex
CREATE UNIQUE INDEX "uq_dictionary_word" ON "dictionary"("word");

-- CreateIndex
CREATE INDEX "idx_dps_part_of_speech" ON "dictionary_part_of_speech"("part_of_speech_id");

-- CreateIndex
CREATE INDEX "idx_dps_dictionary" ON "dictionary_part_of_speech"("dictionary_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_dictionary_part_of_speech" ON "dictionary_part_of_speech"("dictionary_id", "part_of_speech_id");

-- AddForeignKey
ALTER TABLE "dictionary_part_of_speech" ADD CONSTRAINT "fk_dps_dictionary" FOREIGN KEY ("dictionary_id") REFERENCES "dictionary"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dictionary_part_of_speech" ADD CONSTRAINT "fk_dps_part_of_speech" FOREIGN KEY ("part_of_speech_id") REFERENCES "part_of_speech"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
