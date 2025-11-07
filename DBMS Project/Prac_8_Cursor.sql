CREATE TABLE O_RollCall(
    Roll_No NUMBER PRIMARY KEY,
    Name VARCHAR2(30)
);

CREATE TABLE N_RollCall(
    Roll_No NUMBER,
    Name VARCHAR2(30)
);


INSERT INTO O_RollCall VALUES (1,'Mohit');
INSERT INTO O_RollCall VALUES (2,'Komal');

INSERT INTO N_RollCall VALUES (2,'Komal');   -- Already exists
INSERT INTO N_RollCall VALUES (3,'Riya');    -- New record
INSERT INTO N_RollCall VALUES (4,'Aman');    -- New record


DECLARE
    -- Parameterized cursor
    CURSOR c1(rno NUMBER) IS
        SELECT Roll_No, Name FROM N_RollCall
        WHERE Roll_No = rno;

    v_roll NUMBER;
    v_name VARCHAR2(30);
BEGIN
    -- Loop through each record from N_RollCall
    FOR rec IN (SELECT Roll_No FROM N_RollCall) LOOP

        OPEN c1(rec.Roll_No);
        FETCH c1 INTO v_roll, v_name;
        CLOSE c1;

        -- Check if record already exists in O_RollCall
        IF NOT EXISTS (SELECT 1 FROM O_RollCall WHERE Roll_No = v_roll) THEN
            INSERT INTO O_RollCall VALUES(v_roll, v_name);
        END IF;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Merge Completed Successfully.');
END;


SELECT * FROM O_RollCall;



