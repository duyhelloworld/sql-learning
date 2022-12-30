-- Active: 1665826483095@@127.0.0.1@3306@DEMO
CREATE TABLE person_distinct (
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    age int,
    city VARCHAR(10)
);

INSERT INTO person_distinct VALUES (default, "Pham Duy", 19, "Ha Noi");
INSERT INTO person_distinct VALUES (default, "Pham Duy", 19, "Ha Nam");
INSERT INTO person_distinct VALUES (default, "Pham Duy", 19, "Ha Noi");

INSERT INTO person_distinct VALUES (default, "PHAM DUY", 19, "Ha Noi");
INSERT INTO person_distinct VALUES (default, "...", 20, "Ha Nam");

SELECT * FROM person_distinct;
SELECT DISTINCT * FROM person_distinct;
SELECT DISTINCT name, age, city FROM person_distinct;

SELECT DISTINCT name FROM person_distinct;
-- DATA Tên viết hoa cũng như viết thường
SELECT DISTINCT name, age, city FROM person_distinct;