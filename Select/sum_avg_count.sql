-- Active: 1665826483095@@127.0.0.1@3306@DEMOct
CREATE TABLE person_count_avg_sum  (
    id INT PRIMARY KEY AUTO_INCREMENT,
    age INT NOT NULL,
    name VARCHAR(30),
    city VARCHAR(20),
    university VARCHAR(4),
    CONSTRAINT chk_person CHECK (age > 0 && age < 100)    
);

INSERT INTO `DEMO`.person_count_avg_sum 
VALUES (default, 19, "Duy", "Ha Nam", "HUCE");
INSERT INTO `DEMO`.person_count_avg_sum 
VALUES (default, 20, "DuyP", "Ha Noi", "NEU");
INSERT INTO `DEMO`.person_count_avg_sum 
VALUES (default, 19, "Long", "Hung Yen", "HUST");
INSERT INTO `DEMO`.person_count_avg_sum 
VALUES (default, 20, "Long", "Nam Dinh", "PTIT" );
INSERT INTO `DEMO`.person_count_avg_sum 
VALUES (default, 21, "Jackie", "Australia", "HUCE");

SELECT * FROM `DEMO`.person_count_avg_sum;
-- - COUNT
SELECT count(*) FROM `DEMO`.person_count_avg_sum;
SELECT count(*) FROM `DEMO`.person_count_avg_sum WHERE age = 19;
SELECT count(*) FROM `DEMO`.person_count_avg_sum WHERE (age = 19 AND city = "Ha Nam");

SELECT count(*) FROM `DEMO`.person_count_avg_sum WHERE city LIKE "%Ha%";

-- - SUM
SELECT SUM(age) FROM `DEMO`.person_count_avg_sum;
SELECT SUM(age) FROM `DEMO`.person_count_avg_sum WHERE age = 19;


-- - AVG
SELECT AVG(age) FROM `DEMO`.person_count_avg_sum;
SELECT AVG(age) FROM `DEMO`.person_count_avg_sum WHERE age > 19;


-- Nghịch : tính avg qua hàm count với sum
SELECT (SELECT SUM(age) FROM `DEMO`.person_count_avg_sum) / (SELECT count(*) FROM person_count_avg_sum ) AS "AVG age";