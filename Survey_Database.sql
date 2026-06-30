CREATE DATABASE survey;
USE survey;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE survey (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(20),
    email VARCHAR(100),
    programming_languages VARCHAR(200),
    preferred_language VARCHAR(100),
    ide VARCHAR(100),
    satisfaction INT,
    rating INT,
    preferred_time VARCHAR(50),
    suggestions TEXT,
    feedback TEXT
);

show tables;
select * from users;
select* from survey
