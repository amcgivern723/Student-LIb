DELIMITER $$
CREATE TRIGGER audit_trig AFTER UPDATE ON loan FOR EACH ROW
BEGIN 
IF (NEW, `return` > OLD.due) THEN
INSERT INTO audit (no, taken, due, `return`)
VALUES (OLD.no, OLD, taken, OLD.due, NEW, `return`);
END IF;
END; $$
DELIMITER ;
