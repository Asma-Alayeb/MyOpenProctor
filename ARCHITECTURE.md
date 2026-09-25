# MyOpenProctor — Production Architecture

MyOpenProctor is an independent proctoring platform built as an instructor web application plus an installed student exam client.

## Instructor web application
- Instructor authentication
- Courses and multiple exams
- Exam access codes
- MyOpenMath / LMS assessment launch URL
- Allowed websites and permitted applications such as Excel
- Exam documents/resources
- Proctoring policy configuration
- Student session list
- Objective event flags and recording review

## Student desktop exam client
- Course/exam code entry
- Student session initialization
- Explicit recording disclosure and consent
- Camera/microphone system check
- Screen capture
- Controlled exam window
- Instructor-configured allowed domains/resources
- Session timer
- Explicit End Exam control
- Event capture for review (capture interruption, window/app exit attempts, connectivity events)

## Backend
- Authenticated instructor/student sessions
- PostgreSQL database
- Object storage for recordings/documents
- Signed upload/download URLs
- Audit/event records
- Course/exam/access-code APIs
- Session review APIs
- Retention/deletion jobs

## Integrations
- Canvas LTI 1.3 / LTI Advantage
- D2L Brightspace LTI 1.3 / LTI Advantage
- MyOpenMath remains the assessment/grading system unless a supported MOM API/integration is available for deeper synchronization.

## Review model
Events are evidence for instructor review, not automatic determinations of misconduct. The system records objective events and timestamps; instructors make academic-integrity decisions under institutional policy.

## Privacy/security
- Explicit disclosure before recording
- Least-privilege access
- Encryption in transit and at rest
- Configurable retention
- Instructor-only review authorization
- Accommodation / alternate-testing workflow
- Institutional privacy, accessibility, and security approval before real-student deployment
