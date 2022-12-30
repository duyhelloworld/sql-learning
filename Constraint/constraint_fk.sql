-- Active: 1665826483095@@127.0.0.1@3306@DEMO
-- - Bài này mới khó biểu diễn này. nếu đc, xem video nhá
-- https://www.youtube.com/watch?v=-V97FqP5jMI&list=PLE1qPKuGSJaDkQQB5vK7t7-PRIVjtqeHB&index=16&ab_channel=th%C3%A2ntri%E1%BB%87u

-- VD thực hiện khóa ngoại cho quan hệ NhanVien_CaLam
USE `DEMO`;
CREATE TABLE NhanVien (
    nhanVien_id int,
    hoTen VARCHAR(50),
    diaChi VARCHAR(40),
    soCCCD VARCHAR(12),

    CONSTRAINT nhanVien_PK PRIMARY KEY (nhanVien_id, soCCCD)
);

-- bảng test, đọc để rõ lỗi
-- CREATE TABLE CaLam (
--     caLam_id int,
--     luongCa VARCHAR(5),

--     -- FOREIGN KEY (nhanVien_PK) REFERENCES NhanVien(nhanVien_PK)
--     -- ERROR : FK chỉ cho tạo với 1 cột, ko nhóm constraint (nhanvien id & cccd) đc
-- );
-- Kể cả có thêm dòng khai báo nhanVien_PK trước đặt FK, nó vẫn báo nhanVien_PK 0 exist --> ko thể gán cho bọn 'named' đc

-- Sửa sai : xóa PK cũ, đặt nhanVien_id là PK, gắn FK(caLam) cho nhanVien_id
ALTER TABLE `NhanVien`
-- DROP PRIMARY KEY;
ADD PRIMARY KEY (nhanVien_id);

CREATE TABLE CaLam (
    caLam_id int,
    luongCa VARCHAR(5),
    nhanVien_id int,
    FOREIGN KEY (nhanVien_id) REFERENCES NhanVien(nhanVien_id)
);
-- Cú pháp add FK ngoài tự làm nhé

-- Hoặc 1 cách khác (0 khả thi lắm) : tạo nhóm FK bên caLam gồm nhanVien_id + soCCCD
