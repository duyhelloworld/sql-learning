-- Active: 1665826483095@@127.0.0.1@3306@DEMO
USE DEMO;

CREATE TABLE person_update (
    id int AUTO_INCREMENT,
    name VARCHAR(50),
    sex BIT,
    PRIMARY KEY (id)
);

INSERT INTO person_update (name, sex) VALUES ("Duy", 1);
INSERT INTO person_update (name, sex) VALUES ("Hiep", 1);
INSERT INTO person_update (name, sex) VALUES ("Nga", 0);
INSERT INTO person_update (name, sex) VALUES ("Nam", 1);

SELECT * FROM person_update;


-- UPDATE - SET : Thay đổi, edit data trong các record (bản ghi) trong bảng

-- > Syntax: Update <nameTable> Set column = value, ... where
-- ! Tại sao cần where ?
-- Ko where là đi tong nguyên cái bảng đấy, chung 1 giá trị ở SET tất


-- < Giả sử Hiep bị đủi : 
UPDATE person_update 
SET name = "HocSinhMoi", sex = 0 
WHERE id = 2;


-- < Hoc sinh mới tên Oanh đi thay Hiep
UPDATE person_update 
SET name = "Oanh" 
WHERE name = "HocSinhMoi";
-- < Hiep đi nên lớp có còn các bạn bên dưới :

-- - OKI

SELECT DISTINCT * FROM person_update;
-- DISTINCT Lọc các cháu trùng

-- + Lớp ta còn các bạn nữ:
SELECT * FROM person_update WHERE sex = 1;

-- + Tìm số bạn nữ : 
SELECT count(*) FROM person_update WHERE sex = 0;