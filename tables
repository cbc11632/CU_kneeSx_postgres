CREATE TABLE IF NOT EXISTS subject (
    subject_id VARCHAR(10) PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    weight_lbs FLOAT,
    weight_kg FLOAT,
    height_in FLOAT,
    height_cm FLOAT,
    knee_injury VARCHAR(50),
    dom_limb VARCHAR(10),
    surgery_limb VARCHAR(10)
);
CREATE TABLE IF NOT EXISTS test_session (
    session_id SERIAL PRIMARY KEY,
    subject_id VARCHAR(10) NOT NULL,
    session_date DATE,
    time_since_sx FLOAT,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

CREATE TABLE IF NOT EXISTS measurement (
    measurement_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS session_measurement (
    session_id INT NOT NULL,
    measurement_id INT NOT NULL,
    value FLOAT,
    PRIMARY KEY (session_id, measurement_id),
    FOREIGN KEY (session_id) REFERENCES test_session(session_id),
    FOREIGN KEY (measurement_id) REFERENCES measurement(measurement_id)
);

CREATE TABLE IF NOT EXISTS loaded_files (
    file_name VARCHAR(255) PRIMARY KEY,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

