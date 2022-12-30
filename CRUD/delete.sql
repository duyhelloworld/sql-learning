-- Active: 1665826483095@@127.0.0.1@3306@DEMO
USE DEMO;

-- Xóa hàng
DELETE FROM `TEST`;
-- Ko có DELETE * FROM trong MySQL đâu
-- Đồ chơi của MSSQL :
    -- DELETE * FROM `CopTuLibHuce`;

DELETE FROM person_where WHERE age = 10;
-- Xóa khôn tí, lọc đk ko bay cả bảng

-- Xóa cột AUTO_INCREMENT sẽ làm số thứ tự ko tự đánh lại đc

-- In ra
SELECT * FROM person_where;
DELETE FROM person_where WHERE id = 3;
-- bảng kiểu đứt đoạn 3 luôn ấy, cái 4 ko update lên 3
-- chỉ có cách là chèn 1 cái khác có id cũ thôi
INSERT INTO person_where (id, fullName, age)
VALUES (3, "Duy Dep Trai", 19);