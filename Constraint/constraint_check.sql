-- Active: 1665826483095@@127.0.0.1@3306@DEMO
CREATE TABLE person_check (
    id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    age int,
    CHECK (age >= 0 AND age <= 100)
);

INSERT INTO person_check VALUES (default, "Duy" , -10);
-- constraint 'person_check_chk_1' is violated. 

-- < SET CHECK 
-- CONSTRAINT chk_person CHECK (age ...);

-- < OR
ALTER TABLE person_check
ADD CHECK (age >= 10 AND age <= 100);

ALTER TABLE person_check 
ADD CONSTRAINT chk_personAge CHECK (age >= 10 AND age <= 100);

-- DEL (only via constraint)
ALTER TABLE person_check
-- DROP CHECK age <= 100; -- Error
DROP CHECK chk_personAge;