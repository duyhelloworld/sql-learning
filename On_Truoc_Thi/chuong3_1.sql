-- Active: 1665826483095@@127.0.0.1@3306@DEMO
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10),
    surburb VARCHAR(20)
);

CREATE TABLE takes (
    sid INT,
    sno INT
);
CREATE TABLE enrol (
    sid int,
    courseid int
);
CREATE TABLE Course (
    No int,
    name VARCHAR(10),
    dept VARCHAR(10)    
);

CREATE TABLE subject (
    no int,
    name VARCHAR(10),
    dept VARCHAR(10)    
);

INSERT INTO `student` VALUES(1108, "robert", "kew");
INSERT INTO `student` VALUES(2345, "clen", "bundora");
INSERT INTO `student` VALUES(8507, "norman", "bundora");

INSERT INTO `student` VALUES(1236, "mary", "baiwan");

INSERT INTO takes VALUES(1108, 21);
INSERT INTO takes VALUES(1108, 23);
INSERT INTO takes VALUES(8507, 23);

INSERT INTO takes VALUES(8507, 29);

INSERT INTO enrol VALUES(3936, 101);
INSERT INTO enrol VALUES(1108, 103);
INSERT INTO enrol VALUES(8507, 101);

INSERT INTO `Course` VALUES(113, "BCS", "CDSA");
INSERT INTO `Course` VALUES(101, "MCS", "CDSA");

INSERT INTO subject VALUES(21, "Sys", "CDSA");
INSERT INTO subject VALUES(23, "DB", "CDSA");
INSERT INTO subject VALUES(29, "VB", "CDSA");

INSERT INTO subject VALUES(18, "Algo", "MSSA");

-- Name SV in Bundora
SELECT * FROM `student` ;

-- Name Student submit course 103
SELECT * FROM student WHERE id IN (SELECT id FROM student INNER JOIN enrol ON enrol.sid = student.id AND courseid = 103);




