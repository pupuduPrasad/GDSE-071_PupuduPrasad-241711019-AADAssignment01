CREATE DATABASE IF NOT EXISTS complaint_mngs;
USE complaint_mngs;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(20) NOT NULL,
    role ENUM('Employee','Admin') NOT NULL
);

CREATE TABLE complaints (
    id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(200),
    description TEXT,
    user_id INT,
    status VARCHAR(50),
    remarks VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (username, password, role) VALUES
('prasad', '12345', 'Admin');

