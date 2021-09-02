CREATE VIEW v_1
AS  SELECT `no`, name, school
FROM student 
WHERE school ='CMP'
WITH CHECK OPTION;

INSERT INTO v_1
VALUES (1001, 'Aine', 'ENG');