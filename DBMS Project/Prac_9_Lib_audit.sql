CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Main Table
CREATE TABLE Library (
    roll_no INT,
    stud_name VARCHAR(30),
    date_of_issue DATE,
    book_name VARCHAR(30)
);

-- Audit Table (to store old deleted or updated records)
CREATE TABLE Library_Audit (
    roll_no INT,
    stud_name VARCHAR(30),
    date_of_issue DATE,
    book_name VARCHAR(30)
);


INSERT INTO Library VALUES
(101,'Mohit','2024-02-14','DBMS'),
(102,'Komal','2024-02-15','SPOS'),
(103,'Aman','2024-02-16','OS');


DELIMITER $$

CREATE TRIGGER trg_library_update
BEFORE UPDATE ON Library
FOR EACH ROW 
BEGIN
    INSERT INTO Library_Audit
    VALUES (OLD.roll_no, OLD.stud_name, OLD.date_of_issue, OLD.book_name);
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_library_delete
BEFORE DELETE ON Library
FOR EACH ROW 
BEGIN
    INSERT INTO Library_Audit
    VALUES (OLD.roll_no, OLD.stud_name, OLD.date_of_issue, OLD.book_name);
END $$

DELIMITER ;


UPDATE Library
SET book_name = 'CN'
WHERE roll_no = 102;


DELETE FROM Library
WHERE roll_no = 103;


SELECT * FROM Library_Audit;


