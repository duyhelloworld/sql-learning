-- Active: 1665826483095@@127.0.0.1@3306@DEMO
CREATE TABLE person_is_null (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) not null,
    age int,
    location VARCHAR(50)
);

INSERT INTO person_is_null (name, age) VALUES ("Duy", 19);

INSERT INTO person_is_null (name, location) VALUES ("Ha", "");
INSERT INTO person_is_null (name, age) VALUES ("Hoang", 20);

SELECT * FROM person_is_null WHERE name IS NULL;
SELECT * FROM person_is_null WHERE location IS NULL;
SELECT * FROM person_is_null WHERE location IS NOT NULL;
