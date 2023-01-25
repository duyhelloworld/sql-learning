-- Active: 1665826483095@@127.0.0.1@3306@DEMO
-- New

CREATE TABLE
    supply (
        sid int,
        sname VARCHAR(10),
        status int,
        city VARCHAR(10)
    );

CREATE TABLE sup_prod (
    sid int,
    pid int,
    quantity int    
);
CREATE TABLE product (
    pid INT PRIMARY KEY,
    pname VARCHAR(10),
    color VARCHAR(10),
    weight FLOAT,
    city VARCHAR(10)
);

INSERT INTO supply VALUES(1, "smith", 20, "london");
INSERT INTO supply VALUES(2, "jones", 10, "paris");
INSERT INTO supply VALUES(3, "black", 30, "paris ");

INSERT INTO sup_prod VALUES(1, 1, 300);
INSERT INTO sup_prod VALUES(1, 2, 200);
INSERT INTO sup_prod VALUES(1, 3, 400);

INSERT INTO sup_prod VALUES(2, 1, 300);
INSERT INTO sup_prod VALUES(2, 2, 300);
INSERT INTO sup_prod VALUES(3, 2, 400);

INSERT INTO product VALUES(1, "nut", "red", 12, "london");
INSERT INTO product VALUES(2, "bolt", "green", 17, "paris");
INSERT INTO product VALUES(3, "screw", "blue", 17, "roma");

INSERT INTO product VALUES(4, "screw", "red", 14, "london");

-- Danh Sach Mat Hang RED
SELECT * FROM product WHERE color = "red";

-- sid hang cung ung p1 hoac p2
SELECT sid FROM supply WHERE sid in (SELECT supply.sid FROM supply INNER JOIN sup_prod ON supply.sid = sup_prod.sid WHERE pid = 1 OR pid = 2);

SELECT sname FROM supply s, sup_prod sp WHERE s.sid = sp.sid AND (sp.pid = 1 OR sp.pid = 2);
-- sid ca p1, p2

    select sid from sup_prod
    where pid = 2
    INTERSECT
    select sid from sup_prod where pid = 1;
    