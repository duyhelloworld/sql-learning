-- Active: 1665826483095@@127.0.0.1@3306@LibraryHuce
CREATE TABLE learn_change(
    name VARCHAR(10),
    Email VARCHAR(15)
);
SELECT * FROM learn_change;
-- - Bảng trên đúng khi data vào là tiếng Anh tất
-- - Giả sử muốn nhập unicode (tiếng việt, làu, khựa, ...) thì sao

-- 1. Đổi data_type = dùng MODIFY
ALTER TABLE learn_change
MODIFY COLUMN name NVARCHAR(6);

-- 2. Đổi tên + data type = dùng CHANGE
ALTER TABLE learn_change
CHANGE name uni_Name NVARCHAR(10);
-- Change <tên cũ> <tên mới> data_type
-- Ko có kiểu như dòng duwosi đc
-- CHANGE COLUMN uni_Name CHAR(10);
SELECT * FROM learn_change;



-- ! Khi Bảng đang có data, hạn chế đổi kiểu dữ liệu