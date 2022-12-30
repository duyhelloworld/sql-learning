-- Active: 1665826483095@@127.0.0.1@3306@DEMO
USE `DEMO`;

-- - CONSTRAINT : (ràng buộc) dùng để ràng buộc DATA của 1 TABLE
-- - Syntax : đặt sau dataType khi tạo bảng / thê dòng = ALTER

-- > Trong SQL có 6 cái constraint
-- NOT NULL
-- UNIQUE
-- KEY -- PRIMARY / FOREIGN
-- CHECK
-- DEFAULT
-- CREATE INDEX

-- + NOT NULL

-- - Cú pháp khi tạo NOT NULL thì :
CREATE TABLE Persons_notnull (
    id int NOT NULL,
    lastName varchar(100) NULL,
    firstName varchar(100)
); 

-- xài change, modify chuyển firstName thành NOT NULL đc
ALTER TABLE Persons_notnull
CHANGE FirstName FIRSTNAME VARCHAR(200) NOT NULL;
-- MODIFY COLUMN FIRSTNAME VARCHAR(100) NOT NULL;






-- + UNIQUE
-- - all value in this column is distinct
-- - Syntax : 
-- > 1 UNIQUE : CREATE ... ( ID int, ... , UNIQUE(ID));
-- > multi    : CREATE ... (ID int, soDT char(10) ... CONSTRAINT 'someSpecName' UNIQUE (ID, soDT));         
-- - Example UNIQUE :
CREATE TABLE Persons_unique (
    ID int UNIQUE,
    lastName varchar(100),
    firstName varchar(100)
);

-- Or 

CREATE TABLE Persons_unique (
    ID int,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    UNIQUE (ID)
); 

-- Or

-- ALTER TABLE `Persons_unique`
-- ADD UNIQUE (ID);

-- Or
ALTER TABLE `Persons_unique`
ADD CONSTRAINT SpecHuman UNIQUE(soDT, maSoGV, name);
-- Đây là cú pháp hơi đặc biệt, kết quả thay vì ném vào bảng thì thuộc phần indexes (mở ra xem, MySQL có sp đó)
-- Theo tớ, cú pháp này dùng khi cần setup nhiều cái KEY hơn là NOT NULL / UNIQUE

-- DELETE ONLY UNIQUE COLUMN
ALTER TABLE `Persons_unique`
DROP INDEX ID;



-- + PRIMARY KEY 
-- PK = NOT NULL + UNIQUE

-- - Tạo PK : nhiều cách
-- CREATE TABLE Persons (
    -- ID int PRIMARY KEY,
    -- LastName varchar(255) NOT NULL,
    -- FirstName varchar(255),
-- ); 
-- * Trực tiếp tạo PK

CREATE TABLE Persons_pk (
    ID int,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    PRIMARY KEY(id)
); 
-- * Chỉ định trong scope

ALTER TABLE Persons_pk
ADD PRIMARY KEY (ID);
-- * Lệnh ngoài. trước đó, hãy drop pk (nếu có) của bảng

-- - 1 table = 1 PK
-- - 1 PK có thể gồm 1 -> nhiều column
ALTER TABLE `Persons_pk`
ADD CONSTRAINT cacConstraint PRIMARY KEY(ID);
-- ! Nếu có 1 cái chỉ định PK r thì nên xóa đi trc khi đặt nhóm PK khác
--- Cái add constaint bên MSSQL nó giống kiểu đặt tên khác cho cột PK ấy

CREATE TABLE Persons_del_pk(
    id int,
    phone_number VARCHAR(10),
    name VARCHAR(100),
    CONSTRAINT PK_phone_id PRIMARY KEY (id)
    -- nếu trong constraint có 2 cột thì ở dạng NOTNULL chứ ko phải PK
    -- CONSTRAINT PK_phone_id PRIMARY KEY (id, phone_number)
    -- ! Nhớ, lệnh trên là tạo 1 , chỉ 1 PK tên là PK_phone_id cho bảng, key này gồm 2 cột phone và id
    -- Để đặt tên đúng (naming convention), nên đặt theo kiểu PK_<table-name>
);
ALTER TABLE `Persons_del_pk`
DROP PRIMARY KEY;

-- --> các bước Bỏ Pkey lẻ trong bộ constraint :
-- 1. Gắn PK = constraint
-- 2. Drop PK

-- - Từ đây, rút ra : CONSTRAINT có vẻ chỉ xài link các bảng cho dex hơn thui. 
-- - VS mySQL ếu sp cho hiện tên PKconstraint ==> tìm tên khá cực.

-- * Xóa 1 PKey của bảng
ALTER TABLE `Persons_pk`
DROP PRIMARY KEY;

-- Nếu tạo = CONSTRAINT
-- DROP CONSTRAINT cacConstraint;
-- SELECT * FROM `Persons_pk`;