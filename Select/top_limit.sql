-- Active: 1665826483095@@127.0.0.1@3306@DEMO
-- < Dùng tìm 1 số các bản ghi ĐẦU TIÊN thõa mãn đk SELECT
-- MySQL hỗ trợ chỉ có lệnh LIMIT, còn MSSQL là TOP

CREATE TABLE  person_top (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age int,
    check (age >= 0 AND age < 100)
);

INSERT INTO person_top VALUES (default, "Pham Duy", 19);
INSERT INTO person_top VALUES (default, "Pham Hoang", 22);
INSERT INTO person_top VALUES (default, "Nguyen Quang", 27);

INSERT INTO person_top VALUES (default, "Le Ha", 21);
INSERT INTO person_top VALUES (default, "Alex Nguyen", 30);

INSERT INTO person_top VALUES (default, "Ngo Nham", 19);
INSERT INTO person_top VALUES (default, "James Mathew", 34);
SELECT * FROM person_top;

SELECT * FROM person_top WHERE age > 19;
SELECT * FROM person_top WHERE age > 19 LIMIT 1; -- Nâng lên 2, 4 để xem

SELECT * FROM person_top LIMIT 3;


-- -- Đúng ra có select theo % bảng cơ, nhưng MySQL thấy chả cần lắm nên deprecated nó
-- Còn về % thì = LIMIT (COUNT(COLUMN) / 100) * (Số %)
--                  VD : bảng 20 hàng, chọn 50% thì in ra 10 hàng