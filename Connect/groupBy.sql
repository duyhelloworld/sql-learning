-- Active: 1665826483095@@127.0.0.1@3306@ConnectDBs
USE DEMO;

CREATE TABLE t_SV (
        id INT PRIMARY KEY AUTO_INCREMENT,
        sex bit,
        maSV VARCHAR(20),
        name VARCHAR(20)
);
INSERT INTO DEMO.t_SV 
VALUES(DEFAULT, true, "0192323", "Hoang Hoang");

INSERT INTO DEMO.t_SV 
VALUES(DEFAULT, true, "1233243", "Long Long");

INSERT INTO DEMO.t_SV
VALUES (DEFAULT,false,"013467","Bang Bang");
INSERT INTO DEMO.t_SV 
VALUES(DEFAULT, true, "0394023", "Nam Nam");

INSERT INTO DEMO.t_SV 
VALUES(DEFAULT, FALSE, "0293483", "Le Le");

INSERT INTO DEMO.t_SV 
VALUES(DEFAULT, FALSE, "1203923", "Xinh Xinh");

INSERT INTO DEMO.t_SV 
VALUES(DEFAULT, true, "123445", "Quang Quang");

SELECT * FROM `DEMO`.`t_SV`;

-- + Gom nhóm (GROUP BY)
-- VD :
SELECT Customer, COUNT(OrderPrice) FROM Orders;
-- Lấy ra orderPrice của tất cả ngừoi --> Ko tìm đc số tiền của 1 người đc 
SELECT Customer, COUNT(OrderPrice) FROM Orders ORDER BY Customer;
-- - CHọn đc


-- Chọn những sinh viên nữ & nam
SELECT sex, `maSV` FROM DEMO.`t_SV`;

SELECT sex, maSV FROM DEMO.`t_SV` GROUP BY sex, maSV;
-- - Chọn ra nhưng sai
SELECT sex, maSV FROM DEMO.`t_SV` GROUP BY sex, maSV ORDER BY sex;
-- - Chọn đc bảng 

-- + Dếm sinh viên thoe giới
SELECT sex, COUNT(maSV) FROM DEMO.`t_SV`;
-- ! Sai rùi
SELECT sex, COUNT(maSV) FROM DEMO.`t_SV`  GROUP BY sex;
SELECT sex, COUNT(maSV) FROM DEMO.`t_SV`  GROUP BY sex;
SELECT * FROM (SELECT COUNT(maSV) FROM DEMO.`t_SV` WHERE sex = true)




SELECT QQ FROM t_SV;
-- + Lấy số sv theo quê quán
SELECT QQ, COUNT(maSV) FROM t_SV GROUP BY QQ;

-- - có thể thêm AS : SELECT QQ, COUNT(maSV) AS selQQ FROM t_SV GROUP BY QQ;


-- đếm số sinh viên / từng vùng miền
SELECT COUNT(maSV), maSV 
AS t_SV_QQ
FROM t_SV
GROUP BY QQ;


-- - Hiện SLSV theo giới tính mỗi vùng miền
-- RESULT: QQ   |    GT     |  SLSV
SELECT QQ, count(GT)
FROM (
        SELECT COUNT(maSV), QQ, GT
        FROM t_SV
        GROUP BY QQ
    )
GROUP BY GT;
-- - Cô viết
        SELECT QQ, GT, COUNT(maSV)
        FROM t_SV
        GROUP BY QQ, GT;
-- -- Hàm kết tập action trên nhóm nhỏ nhất
-- - ORDER BY QQ;

-- - In ra nhưng nơi có trên 3 sv
SELECT QQ, COUNT(maSV)
FROM t_SV
GROUP BY QQ
HAVING (COUNT(maSV) > 3)
ORDER BY QQ;