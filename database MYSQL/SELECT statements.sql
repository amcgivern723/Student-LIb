/* Query 1 */
SELECT isbn, title, author
FROM book;

/* Query 2 */
SELECT `no`, name, school
FROM student
ORDER BY school DESC;

/* Query 3 */
SELECT isbn, title, author  
FROM book
WHERE author LIKE '%Smith%';

/* Query 4*/
SELECT MAX(due) AS 'Latest Due Date'
	  FROM loan;
     
     /* Query 5 */
SELECT `no` AS 'Student With Latest Due Date'
FROM loan
WHERE due = 
(SELECT MAX(due)
FROM loan);

/* Query 6 */
SELECT `no` AS 'Student Number', name AS 'Student Name'
FROM student 
WHERE `no` = 
(SELECT `no`
	FROM loan
    WHERE due = 
    (SELECT MAX(due)
    FROM loan));
      
      /* Query 7 */
SELECT `no` AS 'Student Number', `code` AS 'Code', due AS 'Due Date', `return` AS 'Loan Return'
 FROM loan
WHERE (SELECT YEAR(taken)) = (SELECT YEAR(CURRENT_DATE()))
AND `return` IS NULL;

SELECT DISTINCT student.`no` AS 'Number',book.isbn AS 'ISBN',
student.name AS 'Name',book.title As 'Title'
FROM student 
INNER JOIN loan ON student.`no` = loan.`no`
INNER JOIN copy ON loan.`code` = copy.`code`
INNER JOIN book on copy.isbn = book.isbn
WHERE duration = 7;

 
 /* Query 9 */
SELECT student.`no` AS 'Student Number', name AS 'Student Name'
	FROM loan
	INNER JOIN student ON student.`no` = loan.`no`
	WHERE due = 
	(SELECT MAX(due)
		FROM loan);
    
    /* Query 10 */
Select loan.`code` AS 'Book Code',
COUNT(loan.`code`) AS 'Loan Frequency',
book.isbn AS 'Book ISBN'
FROM loan
INNER JOIN copy ON loan.`code` = copy.`code`
INNER JOIN book ON copy.isbn = book.isbn
GROUP BY book.title;

/*Query 11*/
SELECT loan.`code` AS 'Code',
COUNT(loan.`code`) AS 'Loan Frequency',
book.isbn AS 'Book ISBN'
FROM loan
INNER JOIN copy ON loan.`code` = copy.`code`
INNER JOIN book ON copy.isbn = book.isbn
GROUP BY book.title
HAVING COUNT(loan.`code`) >=2;
