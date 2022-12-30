-- Active: 1665826483095@@127.0.0.1@3306@DEMO
USE DEMO;


-- WHERE như kiểu if thôi
-- Hay dùng chèn, chọn, xóa hàng chứ ko hay tạo data
CREATE TABLE person_where (
    id int NOT NULL AUTO_INCREMENT,
    fullName NVARCHAR(100) NOT NULL,
    age int NOT NULL,
    PRIMARY KEY (id) 
);

INSERT INTO person_where (fullName, age) VALUES ("Pham Duy", 19);
INSERT INTO person_where (fullName, age) VALUES ("Ha Tran", 20);
INSERT INTO person_where (fullName, age) VALUES ("Le Nam", 14);
INSERT INTO person_where (fullName, age) VALUES ("Shukichi", 18);
INSERT INTO person_where (fullName, age) VALUES ("Le Hoai", 19);
INSERT INTO person_where (fullName, age) VALUES ("Nguyen A", 22);
INSERT INTO person_where (fullName, age) VALUES ("Hoang Viet", 49);

-- Check data đã chèn
SELECT * FROM person_where;


-- DÙng where chọn ra để in
SELECT * FROM person_where WHERE age = 19;




-- Có 3 mệnh đề logic là AND, OR, NOT
SELECT * FROM person_where WHERE age = 19 AND fullName = "Pham Duy";
SELECT * FROM person_where WHERE NOT age = 19;

-- SQL cho cả lệnh &&, || và !, nhưng hơn hết hãy hạn chế dùng. Chữ dù sao đọc cũng thuận hơn
SELECT * FROM person_where WHERE !(age = 19);
SELECT * FROM person_where WHERE age = 19 && fullName = "Pham Duy";

-- Dấu khác là <> hoặc !=, nhưng quốc tế đã thống nhất chung là <>
SELECT * FROM person_where WHERE NOT age <> 19;




-- 1 số syntax nhanh của SQL


--                  BETWEEN


SELECT * FROM person_where WHERE age BETWEEN 10 AND 20;
-- có lệnh thay thế đc nhá, dùng between cho gọn thôi
-- age >= 10 AND age <= 20


--                  LIKE

--https://www.tutorialspoint.com/sql/sql-like-clause.htm
SELECT * FROM person_where WHERE fullName LIKE "Pham Duy";
-- UNICODE thì thêm N' vào trước. EX: fullName LIKE N'Phạm Duy';

-- % :
SELECT * FROM person_where WHERE fullName LIKE "Pham%";
SELECT * FROM person_where WHERE fullName LIKE "%m%";

SELECT * FROM person_where WHERE fullName LIKE "%";
-- Ếu có gì, vì có cái gì mà % đâu :/

-- _ : chỉ tìm theo index
SELECT * FROM person_where WHERE fullName LIKE "_";
-- Ếu có gì in ra, vì cái _ là chỉ số

SELECT * FROM person_where WHERE age LIKE "_9";
-- Ra đc các zai 19, 29, ..9 tuổi. 
-- Cách này tìm đc mấy ông có tiền tỉ trong bảng nè : money LIKE "_000000000"
SELECT * FROM person_where WHERE fullName LIKE "_h";
-- muốn tìm Pham Duy = _ham Duy mà ếu ra. Muốn ra lại phải _h______

--  Sửa : code chuẩn nhất là
SELECT * FROM person_where WHERE fullName LIKE "_h%";

-- Hãy xài _  và % khôn khéo ! Tìm các ông sinh năm đuôi 3 chẳng hạn "___3" / "%3" 



--                      IN

-- Kiểu tìm trong 1 array ấy. viết lệnh ngắn hơn chút
SELECT * FROM person_where WHERE age IN (14, 19, 22);


-- hại não xíu nào
-- Lệnh này chạy nổi k
SELECT * FROM (SELECT * FROM person_where AS newTB WHERE age = 19) WHERE fullName = "Pham Duy";
SELECT * FROM (SELECT * FROM person_where AS newTB WHERE age = 19) WHERE fullName IN newTB;

-- Lệnh này chạy được ko
SELECT * FROM (SELECT * FROM person_where WHERE age = 19) WHERE fullName = "Pham Duy";
