DELIMITER $$
CREATE PROCEDURE new_loan(IN book_isbn CHAR(17), IN `no` INT)
BEGIN
	DECLARE complete BOOLEAN DEFAULT FALSE;
    DECLARE `code`, duration INT;
    DECLARE due DATE; 
    
    DECLARE c_cursor CURSOR FOR 
		SELECT `code`, duration FROM copy
        WHERE isbn = book_isbn;
        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET complete = TRUE;
        IF  ((SELECT embargo FROM student WHERE no = `no`) = 1) THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This book is unavailable' ;
	END IF;

	OPEN c_cursor;
	l_loop : LOOP
    FETCH  c_cursor INTO `code`;
    IF complete THEN 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'error' ; 
        LEAVE l_loop;
        END IF;
        
        IF ((SELECT COUNT(*) FROM loan
        WHERE `code` = `code` AND `return` IS NULL) = 0) THEN
        SET due = DATE_ADD(CURRENT_DATE(), INTERVAL duration DAY);
        INSERT INTO loan (`code`, `no`, taken, due, `return`)
        VALUES (`code`, `no`, CURRENT_DATE(), due, NULL);
        
        LEAVE l_loop;
        
        END IF;
        
        END LOOP;
        
        CLOSE c_cursor;
        
        END $$
        
        DELIMITER ; 
        
        
        
        
        
         
        
    
	
        