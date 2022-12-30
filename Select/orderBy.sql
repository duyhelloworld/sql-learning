-- Active: 1665826483095@@127.0.0.1@3306@DEMO
SELECT * FROM person_update;
-- Mặc định, SQL sắp xếp các bản ghi theo thứ tự tăng dần (ascending)
SELECT * FROM person_update ORDER BY name;
-- Có thể thêm vào ASC (ascending) là tăng dần cũng đc
SELECT * FROM person_update ORDER BY name ASC;
-- - Để truy vấn theo chiều ngược lại, dùng ORDER BY + DESC
SELECT * FROM person_update ORDER BY name DESC;

-- * Khi muốn sắp theo nhiều cột: 
SELECT * FROM person_update ORDER BY name, id;
-- --> Ý là sắp theo name, khi nào có name trùng sẽ sắp theo id

-- Kết hơp ASC và DESC
SELECT * FROM `person_update` ORDER BY name ASC, id DESC;
