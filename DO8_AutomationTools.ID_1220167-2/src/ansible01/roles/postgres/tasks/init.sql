CREATE TABLE IF NOT EXISTS test_db (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    value INTEGER
);

INSERT INTO test_db (name, value) VALUES
    ('Item 1', 100),
    ('Item 2', 200),
    ('Item 3', 300);