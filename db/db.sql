CREATE DATABASE IF NOT EXISTS complaint_mngs;
USE complaint_mngs;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('Employee','Admin') NOT NULL
);

CREATE TABLE complaints (
    id VARCHAR(36) PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    user_id INT,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (username, password, role) VALUES
('prasad', '12345', 'Admin');

