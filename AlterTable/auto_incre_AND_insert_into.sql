-- Active: 1665826483095@@127.0.0.1@3306@DEMO
USE DEMO;
CREATE TABLE id_auto (
    id int AUTO_INCREMENT,
    lastName VARCHAR(10) NOT NULL,
    age int NOT NULL,
    PRIMARY KEY (id)
);

--  AUTO_INCREMENT : 
--          * tự sinh ra khi chèn vào bảng 1 bản ghi mới 
--          * thường set ở ô PK, như Số thứ tự / id 

-- Mặc định tăng từ 1
-- - Set lại qua alter TABLE

ALTER TABLE id_auto AUTO_INCREMENT=10;


-- Chèn data lúc này ếu cần truyền vào cột ID / truyền mặc định
-- - Cách chèn học cụ thể ở dưới, bh biết là chèn như vậy thui

INSERT INTO `DEMO`.id_auto (lastName, age)
VALUES ("Duy", 19);

-- OR

INSERT INTO `DEMO`.id_auto (id, lastName, age)
VALUES (default, "Duy 2", 19);

SELECT * FROM id_auto;

-- Chèn full hàng nhanh:
INSERT INTO `DEMO`.id_auto
VALUES (default, "Duy 3", 100);

ALTER TABLE id_auto AUTO_INCREMENT=0;
SELECT * FROM id_auto;



-- INSERT INTO

-- - Cú pháp bắt buộc : INSERT INTO + bảng + cột (thường xuong dòng cho đẹp) VALUES (giá trị tương ứng ở trên)
-- Lưu ý NOT NULL phải luôn chèn giá trị

-- ! Các lỗi
-- Chèn nhanh ko chỉ định
INSERT INTO id_auto
VALUES ("Duy", 10);
-- Chèn mà ko có ngoặc 
INSERT INTO id_auto age VALUES 10;
-- Chèn thiếu giá trị
INSERT INTO id_auto (age, lastName) VALUES (18);
INSERT INTO id_auto (age, lastName) VALUES ( , "Duy");
-- Chèn sai kiểu DATA
-- - SQL nó ép kiểu nên error


-- + Những cách chèn chấp nhận đc :
-- Chèn sai kiểu DATA mà đủ cột
INSERT INTO id_auto (age, lastName) VALUES ("19", "duy");
INSERT INTO id_auto (age, lastName) VALUES (10, 102);

INSERT INTO id_auto (age, lastName) VALUES (19.2, "duy");
SELECT * FROM id_auto;

-- Chèn thiếu chữ INTO --> có thể là cải tiến
INSERT id_auto (age, lastName) VALUES (10, "duy");
-- - Nhưng cứ nên chèn INTO vào, nó rõ ràng hơn

-- Chèn xâu rỗng
INSERT id_auto (age, lastName) VALUES (1000, "");
