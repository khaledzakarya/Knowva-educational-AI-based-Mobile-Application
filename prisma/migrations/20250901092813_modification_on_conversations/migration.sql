/*
  Warnings:

  - You are about to drop the column `subjectId` on the `Conversation` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[studentId,teacherId]` on the table `Conversation` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `studentId` to the `Conversation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `teacherId` to the `Conversation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Conversation` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "public"."Conversation" DROP CONSTRAINT "Conversation_subjectId_fkey";

-- AlterTable
ALTER TABLE "public"."Conversation" DROP COLUMN "subjectId",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "studentId" INTEGER NOT NULL,
ADD COLUMN     "teacherId" INTEGER NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- CreateTable
CREATE TABLE "public"."_ConversationToSubject" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_ConversationToSubject_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_ConversationToSubject_B_index" ON "public"."_ConversationToSubject"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Conversation_studentId_teacherId_key" ON "public"."Conversation"("studentId", "teacherId");

-- AddForeignKey
ALTER TABLE "public"."Conversation" ADD CONSTRAINT "Conversation_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Conversation" ADD CONSTRAINT "Conversation_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."_ConversationToSubject" ADD CONSTRAINT "_ConversationToSubject_A_fkey" FOREIGN KEY ("A") REFERENCES "public"."Conversation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."_ConversationToSubject" ADD CONSTRAINT "_ConversationToSubject_B_fkey" FOREIGN KEY ("B") REFERENCES "public"."Subject"("id") ON DELETE CASCADE ON UPDATE CASCADE;
