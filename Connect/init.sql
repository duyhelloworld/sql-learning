-- Active: 1665826483095@@127.0.0.1@3306@ConnectDBs
CREATE DATABASE ConnectDBs;
USE ConnectDBs;
CREATE TABLE t_SinhVien (
    maSinhVien INT,
    maMonHoc TINYINT,
    ten NVARCHAR(20) NOT NULL,
    ngayThi DATE NOT NULL,
    diem FLOAT CHECK (Mark > 0 AND Mark <= 10)
);

CREATE TABLE t_MonHoc (
    maMonHoc TINYINT,
    maSinhVien INT,
    tenMon NVARCHAR(15),
    soTin TINYINT NOT NULL,
    ngayThi DATE NOT NULL
);
CREATE TABLE t_Lop (
    maLop INT,

);
ALTER TABLE t_Student ADD CONSTRAINT Student_pk PRIMARY KEY (idStudent, idSubject), ADD
CONSTRAINT Student_fk FOREIGN KEY (idSubject) REFERENCES t_Subject(idSubject), ADD
CONSTRAINT Student_fk FOREIGN KEY (idStudent) REFERENCES t_Subject(idStudent);



-- + Lấy SV ở 66IT5
SELECT * FROM t_SV, t_Lop; -- Decartes 1 dòng t_SV với 1 dòng t_Lop
-- ! Kết nôi với điều kiện

SELECT * 
FROM t_SV INNER JOIN t_Lop ON `t_SV`.`maLop` = `t_Lop`.`maLop`; 

-- - Full command
SELECT * 
FROM t_SV INNER JOIN t_Lop ON `t_SV`.`maLop` = `t_Lop`.`maLop`
WHERE `t_Lop`.`maLop` = "66IT5";


-- + KO phải IT5
SELECT *
FROM t_SV
    INNER JOIN t_Lop ON `t_SV`.`maLop` = `t_Lop`.`maLop`;
EXCEPT 
(SELECT *
FROM t_SV
    INNER JOIN t_Lop ON `t_SV`.`maLop` = `t_Lop`.`maLop`
WHERE `t_Lop`.`maLop` = "66IT5");
-- - Bắt buộc phải khả hợp




-- + Đưa ra sinh viên  qua môn (có tên trong bảng KQ)
SELECT t_SV.maSV, hoTen, tenMH, Diem, ngayThi
FROM ((t_SV INNER JOIN t_Lop ON t_SV.maLop = Lop.maLop)
    INNER JOIN t_KQ ON t_SV.maSV = t_KQ.maSV)
    INNER JOIN t_MonHoc ON t_KQ.MaMH = t_MonHoc.maMH;


-- + Sinh viên chưa thi môn nào
SELECT maSV FROM t_SV
EXCEPT
(SELECT DISTINCT maSV FROM t_SV);

-- - Nếu đòi in ra thêm họ tên, dob... -> EXCEPT ko dùng đc vì vướng dữ liệu ở 2 SELECT gọi ra ko trùng

SELECT * FROM t_KQ INNER JOIN t_SV ON t_SV.maSV  = t_KQ.maSV;
-- --> Sinh viên đi thi
SELECT * FROM t_KQ RIGHT JOIN t_SV ON t_KQ.maSV = t_SV.maSV;
-- --> Sinh viên đi thi + Sinh viên 0 thi
SELECT * FROM t_KQ RIGHT JOIN t_SV ON t_KQ.maSV = t_SV.maSV
WHERE MaMH IS NULL;
-- --> Ra đc các SV ko thi, nhưng maSV, ... bị NULL
SELECT t_SV.maSV, hoTen, queQuan
FROM t_KQ
    RIGHT JOIN t_SV ON t_KQ.maSV = t_SV.maSV
WHERE MaMH IS NULL;
-- < OK >



