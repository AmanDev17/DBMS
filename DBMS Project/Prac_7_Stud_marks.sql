CREATE TABLE Stud_Marks(
    Roll INT PRIMARY KEY,
    Name VARCHAR(30),
    Total_Marks INT
);

CREATE TABLE Result(
    Roll INT,
    Name VARCHAR(30),
    Class VARCHAR(30)
);



INSERT INTO Stud_Marks VALUES (1,'Mohit',1200);
INSERT INTO Stud_Marks VALUES (2,'Komal',950);
INSERT INTO Stud_Marks VALUES (3,'Aman',860);
INSERT INTO Stud_Marks VALUES (4,'Shreeja',700);



DELIMITER $$

CREATE PROCEDURE proc_Grade()
BEGIN
    DECLARE r INT;
    DECLARE n VARCHAR(30);
    DECLARE m INT;
    DECLARE c VARCHAR(30);

    -- Cursor to read data from Stud_Marks
    DECLARE stud_cursor CURSOR FOR
        SELECT Roll, Name, Total_Marks FROM Stud_Marks;

    OPEN stud_cursor;

    read_loop: LOOP
        FETCH stud_cursor INTO r, n, m;
        IF ROW_COUNT() = 0 THEN
            LEAVE read_loop;
        END IF;

        IF m <= 1500 AND m >= 990 THEN
            SET c = 'Distinction';
        ELSEIF m BETWEEN 900 AND 989 THEN
            SET c = 'First Class';
        ELSEIF m BETWEEN 825 AND 899 THEN
            SET c = 'Higher Second Class';
        ELSE
            SET c = 'No Class';
        END IF;

        INSERT INTO Result VALUES (r, n, c);
    END LOOP;

    CLOSE stud_cursor;
END$$

DELIMITER ;


CALL proc_Grade();


SELECT * FROM Result;


