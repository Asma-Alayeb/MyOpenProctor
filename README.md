# MyOpenProctor MVP

A consent-based Next.js prototype for a proctoring workflow that can later be integrated with Canvas and D2L Brightspace via LTI 1.3.

## Features
- Instructor-defined allowed websites
- Microsoft Excel explicitly allowed
- Per-exam proctoring toggles
- Student camera/microphone permission check
- Entire-screen share request
- Local event timeline
- Canvas/D2L integration placeholder

## Run
1. Install Node.js 18+.
2. Run `npm install`.
3. Run `npm run dev`.
4. Open `http://localhost:3000`.

## Important limitations
This prototype does not upload or persist recordings. A normal website cannot reliably block desktop apps or identify every application receiving focus. Production use with students requires HTTPS, secure authentication/storage, explicit disclosure/consent, accessibility and alternative-testing workflows, retention/access controls, and institutional privacy/security approval.

## LTI 1.3 production work
Canvas and Brightspace deployments require institution-specific issuer/client IDs, public/private keys, authentication/login URLs, redirect URLs, and deployment IDs. Add the LTI layer only after your LMS administrator provides/approves those values.
