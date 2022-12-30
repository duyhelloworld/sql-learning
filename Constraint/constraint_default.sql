-- Active: 1665826483095@@127.0.0.1@3306@DEMO





CREATE TABLE person_default (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    age int,
    email VARCHAR(20) NOT NULL,
    loginDate DATETIME DEFAULT NOW()
);

ALTER TABLE person_default
ALTER age SET DEFAULT 20;


-- DELETE
ALTER TABLE person_default
ALTER age DROP DEFAULT;