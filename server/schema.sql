CREATE TABLE instructors (
  id UUID PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE courses (
  id UUID PRIMARY KEY,
  instructor_id UUID NOT NULL REFERENCES instructors(id),
  name TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE exams (
  id UUID PRIMARY KEY,
  course_id UUID NOT NULL REFERENCES courses(id),
  name TEXT NOT NULL,
  assessment_url TEXT NOT NULL,
  duration_minutes INTEGER NOT NULL,
  require_webcam BOOLEAN DEFAULT TRUE,
  require_microphone BOOLEAN DEFAULT FALSE,
  require_screen BOOLEAN DEFAULT TRUE,
  allowed_domains JSONB DEFAULT '[]'::jsonb,
  allowed_apps JSONB DEFAULT '[]'::jsonb,
  published BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE exam_documents (
  id UUID PRIMARY KEY,
  exam_id UUID NOT NULL REFERENCES exams(id),
  filename TEXT NOT NULL,
  storage_key TEXT NOT NULL,
  mime_type TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE sessions (
  id UUID PRIMARY KEY,
  exam_id UUID NOT NULL REFERENCES exams(id),
  student_name TEXT NOT NULL,
  student_external_id TEXT,
  status TEXT NOT NULL DEFAULT 'created',
  started_at TIMESTAMPTZ,
  ended_at TIMESTAMPTZ,
  screen_recording_key TEXT,
  webcam_recording_key TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE session_events (
  id BIGSERIAL PRIMARY KEY,
  session_id UUID NOT NULL REFERENCES sessions(id),
  event_type TEXT NOT NULL,
  severity TEXT NOT NULL DEFAULT 'info',
  message TEXT NOT NULL,
  occurred_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  reviewed BOOLEAN DEFAULT FALSE
);

CREATE INDEX session_events_session_idx ON session_events(session_id, occurred_at);
