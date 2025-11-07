
-- For Area of Circle with radius 1 to 10

CREATE TABLE areas(
    radius INT,
    area DOUBLE
);

DELIMITER $$

CREATE PROCEDURE calc_area()
BEGIN
    DECLARE r INT DEFAULT 1;        -- to start from 5 just change default value to 5 
    DECLARE a DOUBLE;

    WHILE r <= 10 DO
        SET a = 3.14 * r * r;   -- area = πr²
        INSERT INTO areas VALUES (r, a);
        SET r = r + 1;
    END WHILE;

END$$

DELIMITER ;


CALL calc_area();


SELECT * FROM areas;





