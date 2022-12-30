-- Active: 1665826483095@@127.0.0.1@3306@DEMO
CREATE DATABASE LibraryHuce;
CREATE DATABASE LibraryHuce1;
--Tạo xong nếu muốn compile cả file, nhớ comment lệnh CREATE để giảm Error DataBaseExisted

--> Đặt tên DB theo quy tắc đặt tên biến. khác biệt của MySQL và MSSQL : MySQL coi all biến là chữ thường hết -> chữ hoa chữ thg ko có ý nghĩa

--> Tạo xong LIbraryHuce thì dùng thôi - mặc định nó sẽ thực hiện các câu lệnh bên dưới vào DB mysql / master.
USE LIBRARYHUCE;

CREATE DATABASE LibraryHuce2;
DROP DATABASE LibraryHuce1;
DROP DATABASE LibraryHuce2;
-- - Nên GO sau mỗi lệnh bên MSSQL hoặc đặt ; cuối lệnh MySQL nếu k có công cụ hỗ trợ chạy từng dòng (Visual, Dbeaver, workbench)
-- - Đặc biệt, cả MySQL và MSSQL khi xóa sẽ ko phân biệt chữ hoa thường




USE LibraryHuce;

-- + tạo bảng : 
-- C1 :
CREATE TABLE GiaoVien (name NVARCHAR(30), identities VARCHAR(8));
-- C2 :
CREATE TABLE LibraryHuce.HocSinh (	name NVARCHAR(10),ID VARCHAR(8));
-- - Làm thế thì dễ hơn, đỡ 1 bước USE

DROP TABLE `LibraryHuce`.`HocSinh`;
-- + Bọc ngoặc `` để giảm lỗi trong MySQL  --- cho phép chữ hoa chữ thường :-) 


CREATE TABLE LibraryHuce.HocSinh(	name NVARCHAR(10),ID VARCHAR(8));
-- -Xóa dòng tren là ví dụ thôi , tạo lại mà dùng chứ

-- -Chỉnh sửa DB (+ cột, - cột)

-- + Copy trong table
CREATE TABLE `LibraryHuce`.`HocSinh2` AS 
SELECT ID, name FROM `LibraryHuce`.`HocSinh`;
-- - Copy 2 trường ID, name từ bảng HocSinh vô bảng mới tạo HocSinh2 -- cả 2 ở chung DB LibraryHuce hết

-- - Thử xuyên DATABASE
CREATE DATABASE coptulibhuce;
CREATE TABLE `DEMO`.`CopTuLibHuce` AS 
SELECT * FROM `LibraryHuce`.`HocSinh`;
-- - Run Được luôn


-- - đồ MSSQL
-- SELECT * INTO HocSinh4 FROM HocSinh; GO; 
--! cái này cần bỏ tên DB trước bảng mới chạy 



-- - Từ giờ, các lệnh dứoi chỉ thao tác ở DB GiaoVien & HocSinh
DROP TABLE `LibraryHuce`.`HocSinh2`;
-- ---> Cút bảng thừa đi, bảng HocSinh2 có rảnh thì dùng cũng đc :))


--+ Dùng ALTER TABLE
-- - Theo W3 : có thể dùng trong ADD, DROP, MODIFY, UPDATE column trong 1 table


-- > ADD Column DiaChi
ALTER TABLE `LibraryHuce`.`GiaoVien` ADD DiaChi nvarchar(10);

-- -ADD nhiều hơn 1 column
ALTER TABLE `LibraryHuce`.`GiaoVien` 
ADD NgayBatDauCT DATE, ADD soDT char(10);
-- - (để 2 dòng cho ez nhìn)


-- > Drop 1 -> more columns
ALTER TABLE `LibraryHuce`.`GiaoVien` 
DROP COLUMN DiaChi, DROP COLUMN NgayBatDauCT;

-- > MSSQL : ALTER TABLE LibraryHuce.GiaoVien DROP COLUMN DiaChi, NgayBatDauCT;


-- + Sửả tên cột + sửa cột
-- > MODIFY COLUMN column_name datatype;

-- - Xem lại datatype đã, quên r
SELECT * FROM `LibraryHuce`.`GiaoVien`;  
ALTER TABLE `LibraryHuce`.`GiaoVien`
MODIFY COLUMN identities INT(7);
-- Chuyển đc, nhưng mất hẳn 1s chạy code, kiểu này nên hạn chế
-- ! Chỉ nên chuyển data cùng kiểu, ko nên kiểu kiểu TEXT sang NUMBER hay DATE, VARCHAR -> FLOAT --> Dễ gãy data

-- > RENAME : CHANGE firstName  targetName dataType;
ALTER TABLE `LibraryHuce`.`GiaoVien`
CHANGE maSoSinhVien maSoGV INT(7);
-- Mạnh hơn Modify nhá

-- ! Change cho phép đổi cả kiểu dữ liệu
-- ALTER TABLE `LibraryHuce`.`GiaoVien`
-- CHANGE identities maSoSinhVien FLOAT;



-- ******** OK Lesson1 **********