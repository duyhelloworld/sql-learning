-- Active: 1665826483095@@127.0.0.1@3306@LibraryHuce

USE `LibraryHuce`;

-- ADD COLUMN :
SHOW DATABASES;
SHOW TABLES;
SELECT * FROM `GiaoVien`;



-- DB có nhiều cột quá, làm mới thôi
CREATE TABLE learn_alter (
    id int,
    fullname NVARCHAR(100),
    age int,
    birth DATE
);
ALTER TABLE learn_alter
-- ADD COLUMN class VARCHAR(5); -- SQL 92
ADD class VARCHAR(5); -- SQL newer
-- Nên viết xuống dòng cho dễ nhìn

-- ! Ko tạo DB mới hay bảng mới = alter đc nhá (tự test)

-- ADD 2->more columns
ALTER TABLE learn_alter
ADD COLUMN locate TEXT, ADD COLUMN sex BIT;

SELECT * FROM learn_alter;

-- DROP tương tự ADD