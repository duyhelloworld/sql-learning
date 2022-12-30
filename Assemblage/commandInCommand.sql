-- Active: 1665826483095@@127.0.0.1@3306@ConnectDBs
-- Đưa ra những sv ko thi những môn có 3 tín

-- môn 3tc
SELECT * FROM t_Mon WHERE soTC = 3;
-- SV thi 3tc
SELECT DISTINCT MSSV
FROM t_MH
    INNER JOIN t_KQ On t_mh.maMH = t_kq.maMH
WHERE soTC = 3;

-- SV 0 thi
SELECT *
FROM t_SV
WHERE mssv NOT IN (
        SELECT DISTINCT MSSV
        FROM t_MH
            INNER JOIN t_KQ On t_mh.maMH = t_kq.maMH
        WHERE soTC = 3
    );