-- CreateTable
CREATE TABLE "dictionary" (
    "id" SERIAL NOT NULL,
    "word" TEXT NOT NULL,
    "pronunciation" TEXT,
    "translate" TEXT,
    "part_of_speech_id" INTEGER NOT NULL,
    "week" INTEGER,

    CONSTRAINT "dictionary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "part_of_speech" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "part_of_speech_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vocabulary" (
    "id" SERIAL NOT NULL,
    "item" INTEGER,
    "description" TEXT NOT NULL,
    "pronunciation" TEXT,
    "translate" TEXT,

    CONSTRAINT "vocabulary_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "dictionary_word_key" ON "dictionary"("word");

-- CreateIndex
CREATE UNIQUE INDEX "part_of_speech_name_key" ON "part_of_speech"("name");
