CREATE TABLE IF NOT EXISTS subject (
    subject_id VARCHAR(50) PRIMARY KEY,
    age INT,
    gender VARCHAR(20),
    weight_lbs FLOAT,
    weight_kg FLOAT,
    height_in FLOAT,
    height_cm FLOAT,
    knee_injury VARCHAR(255),
    dom_limb VARCHAR(20),
    surgery_limb VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS test_session (
    session_id SERIAL PRIMARY KEY,
    subject_id VARCHAR(50) NOT NULL,
    session_date DATE,
    time_since_sx NUMERIC(6,2),

    CONSTRAINT test_session_subject_id_fkey
        FOREIGN KEY (subject_id)
        REFERENCES subject(subject_id)
);

CREATE INDEX IF NOT EXISTS idx_test_session_subject
ON test_session(subject_id);

CREATE TABLE IF NOT EXISTS measurement (
    measurement_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS session_measurement (
    session_id INT NOT NULL,
    measurement_id INT NOT NULL,
    value FLOAT,

    PRIMARY KEY (session_id, measurement_id),

    CONSTRAINT session_measurement_session_fkey
        FOREIGN KEY (session_id)
        REFERENCES test_session(session_id),

    CONSTRAINT session_measurement_measurement_fkey
        FOREIGN KEY (measurement_id)
        REFERENCES measurement(measurement_id)
);

CREATE TABLE IF NOT EXISTS loaded_files (
    file_name VARCHAR(255) PRIMARY KEY,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS data_load_log (
    log_id SERIAL PRIMARY KEY,
    file_name VARCHAR(255),
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    subjects_loaded INT DEFAULT 0,
    sessions_loaded INT DEFAULT 0,
    measurements_loaded INT DEFAULT 0,
    error_message TEXT,
    status VARCHAR(20)
);
