CREATE DATABASE exp;
USE exp;

CREATE USER 'Mohit'@'localhost' IDENTIFIED BY 'Mohit@123';
GRANT ALL PRIVILEGES ON exp.* TO 'Mohit'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE Student(
    PRN INT PRIMARY KEY,
    Name VARCHAR(50)
);

