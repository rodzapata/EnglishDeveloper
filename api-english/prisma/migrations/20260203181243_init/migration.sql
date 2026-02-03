-- CreateTable
CREATE TABLE "vocabulary" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item" INTEGER,
    "description" TEXT NOT NULL,
    "pronunciation" TEXT,
    "translate" TEXT,
    "type" INTEGER DEFAULT 2,
    "day" INTEGER
);
