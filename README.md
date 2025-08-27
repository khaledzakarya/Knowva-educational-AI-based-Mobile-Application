

# 🟦 **Complete Backend Database Schema (with Conversations)**

---

## **1. Users**

* `id` (PK)
* `name` (string)
* `email` (string, unique)
* `password` (hashed)
* `role` (ENUM: `teacher`, `student`)
* `created_at` (timestamp)
* `updated_at` (timestamp)

---

## **2. Subjects**

* `id` (PK)
* `name` (string)
* `description` (text)
* `teacher_id` (FK → Users.id, only teacher)
* `created_at`

---

## **3. Groups**

* `id` (PK)
* `name` (string)
* `subject_id` (FK → Subjects.id)
* `teacher_id` (FK → Users.id, subject owner)
* `created_at`

---

## **4. GroupMemberships**

* `id` (PK)
* `student_id` (FK → Users.id)
* `group_id` (FK → Groups.id)
* `status` (ENUM: `pending`, `approved`, `rejected`)
* `created_at`

---

## **5. Notifications**

* `id` (PK)
* `sender_id` (FK → Users.id, e.g., student)
* `receiver_id` (FK → Users.id, e.g., teacher)
* `group_id` (FK → Groups.id, nullable)
* `type` (ENUM: `join_request`, `join_response`, `quiz_result`, `general`)
* `message` (text)
* `status` (ENUM: `unread`, `read`)
* `created_at`

---

## **6. Lessons**

* `id` (PK)
* `title` (string)
* `content` (text, nullable)
* `file_url` (string, nullable → PDF/Image)
* `video_url` (string, nullable → YouTube/Vimeo)
* `subject_id` (FK → Subjects.id)
* `teacher_id` (FK → Users.id)
* `created_at`

---

## **7. Quizzes**

* `id` (PK)
* `title` (string)
* `subject_id` (FK → Subjects.id)
* `group_id` (FK → Groups.id, nullable)
* `created_by` (FK → Users.id – teacher)
* `source` (ENUM: `manual`, `ai_generated`)
* `created_at`

---

## **8. Questions**

* `id` (PK)
* `quiz_id` (FK → Quizzes.id)
* `text` (text)
* `options` (jsonb → \[“A”, “B”, “C”, “D”])
* `correct_answer` (string)

---

## **9. StudentAnswers**

* `id` (PK)
* `student_id` (FK → Users.id)
* `question_id` (FK → Questions.id)
* `selected_answer` (string)
* `is_correct` (boolean)
* `created_at`

---

## **10. DashboardData**

* `id` (PK)
* `student_id` (FK → Users.id)
* `quiz_id` (FK → Quizzes.id)
* `score` (float)
* `weak_areas` (jsonb → misunderstood questions/topics)

---

## **11. Conversations**

* `id` (PK)
* `subject_id` (FK → Subjects.id)
* `teacher_id` (FK → Users.id)
* `student_id` (FK → Users.id)
* `created_at`
* `updated_at`

---

## **12. Messages**

* `id` (PK)
* `conversation_id` (FK → Conversations.id)
* `sender_id` (FK → Users.id)
* `content` (text)
* `message_type` (ENUM: `text`, `image`, `file`) → default `text`
* `created_at`

---

## **13. Environment Tokens (for Registration Role Validation)**

⚡ **Not a table → Stored in `.env` file**

* `TEACHER_REGISTER_TOKEN`
* `STUDENT_REGISTER_TOKEN`

👉 On registration: user must provide the correct token to register as **teacher** or **student**.

---

# 🔗 **Flow Highlights**

* **Join Requests**

  * Student requests → `GroupMembership (pending)` + Notification to teacher.
  * Teacher approves/rejects → update membership + Notification back to student.

* **AI Interaction**

  * Quizzes can be `manual` or `ai_generated`.
  * AI analyzes answers → fills `DashboardData.weak_areas`.

* **Dashboard**

  * Student sees quiz scores & weak points.
  * Teacher sees student/group performance & most-missed questions.

* **Lessons**

  * Teacher uploads PDFs, videos, images, or plain content for each subject.

* **Chat**

  * `Conversation` links a **student + teacher + subject**.
  * `Messages` belong to a conversation with support for text, image, or file.

---


# 📌 **API Endpoints with Dummy Data**

| Method   | Endpoint                      | Request Example                                                                                               | Response Example                                                                                                                                                                                                                          |
| -------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **POST** | `/auth/register`              | `json { "name": "Karim", "email": "karim@student.com", "password": "123456", "token": "STUDENT_REG_TOKEN" } ` | `json { "id": 12, "role": "STUDENT", "name": "Karim", "email": "karim@student.com" } `                                                                                                                                                    |
| **POST** | `/auth/login`                 | `json { "email": "karim@student.com", "password": "123456" } `                                                | `json { "accessToken": "jwt.token.here", "refreshToken": "refresh.token.here" } `                                                                                                                                                         |
| **POST** | `/subjects`                   | `json { "title": "Mathematics", "description": "Algebra basics" } `                                           | `json { "id": 5, "title": "Mathematics", "teacherId": 3 } `                                                                                                                                                                               |
| **POST** | `/subjects/5/groups`          | `json { "name": "Group A", "capacity": 30 } `                                                                 | `json { "id": 8, "name": "Group A", "subjectId": 5, "capacity": 30 } `                                                                                                                                                                    |
| **POST** | `/groups/8/join`              | `json { "studentId": 12 } `                                                                                   | `json { "requestId": 21, "status": "PENDING" } `                                                                                                                                                                                          |
| **GET**  | `/groups/8/memberships`       | *(teacher token required)*                                                                                    | `json [ { "id": 21, "student": { "id": 12, "name": "Karim" }, "status": "PENDING" } ] `                                                                                                                                                   |
| **PUT**  | `/memberships/21/approve`     | *(no body)*                                                                                                   | `json { "id": 21, "status": "APPROVED", "studentId": 12, "groupId": 8 } `                                                                                                                                                                 |
| **GET**  | `/notifications`              | *(student token)*                                                                                             | `json [ { "id": 45, "message": "Your request to join Group A is approved", "read": false } ] `                                                                                                                                            |
| **POST** | `/subjects/5/lessons`         | `json { "type": "PDF", "title": "Lesson 1: Algebra", "url": "https://cdn.app/lessons/algebra.pdf" } `         | `json { "id": 14, "title": "Lesson 1: Algebra", "type": "PDF", "subjectId": 5 } `                                                                                                                                                         |
| **POST** | `/subjects/5/quizzes`         | `json { "title": "Algebra Quiz 1", "mode": "AI" } `                                                           | `json { "id": 31, "title": "Algebra Quiz 1", "status": "DRAFT" } `                                                                                                                                                                        |
| **POST** | `/quizzes/31/questions`       | `json { "text": "2 + 2 = ?", "type": "MCQ", "options": ["3","4","5"], "answer": "4" } `                       | `json { "id": 99, "text": "2 + 2 = ?", "quizId": 31 } `                                                                                                                                                                                   |
| **POST** | `/questions/99/answer`        | `json { "studentId": 12, "answer": "4" } `                                                                    | `json { "id": 221, "studentId": 12, "questionId": 99, "correct": true, "score": 1 } `                                                                                                                                                     |
| **GET**  | `/dashboard/student/12`       | *(no body)*                                                                                                   | `json { "studentId": 12, "averageScore": 87, "weakAreas": ["Algebra", "Geometry"], "quizHistory": [ { "quizId": 31, "score": 90 } ] } `                                                                                                   |
| **GET**  | `/dashboard/teacher/3`        | *(no body)*                                                                                                   | `json { "teacherId": 3, "classAverage": 75, "mostMissedQuestions": ["Q12: Simplify 3x+2x"], "topStudents": [{ "id": 12, "name": "Karim", "avgScore": 92 }] } `                                                                            |
| **POST** | `/subjects/5/conversations`   | `json { "studentId": 12 } `                                                                                   | `json { "id": 401, "subjectId": 5, "participants": [3,12] } `                                                                                                                                                                             |
| **POST** | `/conversations/401/messages` | `json { "senderId": 12, "content": "Sir, I don’t understand question 3." } `                                  | `json { "id": 501, "conversationId": 401, "senderId": 12, "content": "Sir, I don’t understand question 3.", "timestamp": "2025-08-27T10:00:00Z" } `                                                                                       |
| **GET**  | `/conversations/401/messages` | *(no body)*                                                                                                   | `json [ { "id": 501, "senderId": 12, "content": "Sir, I don’t understand question 3.", "timestamp": "2025-08-27T10:00:00Z" }, { "id": 502, "senderId": 3, "content": "Focus on factorization.", "timestamp": "2025-08-27T10:05:00Z" } ] ` |

---

## ⚡ Tricks & Ideas I added

1. **Status flags** like `"PENDING"`, `"APPROVED"`, `"DRAFT"` make workflows more realistic.
2. **Pagination idea** → in `GET /notifications?limit=10&page=2` or `GET /conversations/:id/messages?cursor=501`.
3. **AI involvement** → when quiz is `"mode": "AI"`, backend calls AI service to auto-generate questions.
4. **Dashboard metrics** → keep raw data in `StudentAnswers`, but pre-compute summaries nightly for performance.
5. **Notifications table** → flexible enough for join requests, quiz results, or teacher reminders.

