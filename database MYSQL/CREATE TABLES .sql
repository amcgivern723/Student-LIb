CREATE TABLE book (
  isbn CHAR(17) NOT NULL UNIQUE,
  title VARCHAR(30) NOT NULL UNIQUE,
  author VARCHAR(30) NOT NULL UNIQUE,
  CONSTRAINT pri_book PRIMARY KEY (isbn));

CREATE TABLE copy (
  `code` INTEGER NOT NULL UNIQUE,
  isbn CHAR(17) NOT NULL,
  duration TINYINT NOT NULL,
  CONSTRAINT pri_copy PRIMARY KEY (`code`),
CHECK(duration IN( '7', '14', '21')),
  CONSTRAINT for_copy FOREIGN KEY (isbn)
    REFERENCES book (isbn) ON UPDATE CASCADE ON DELETE CASCADE);
    
CREATE TABLE student (
    `no` INTEGER NOT NULL UNIQUE,
    name VARCHAR(30) NOT NULL,
    school CHAR(3) NOT NULL,
    embargo BIT NOT NULL,
    CONSTRAINT pri_student PRIMARY KEY (`no`));
    
  CREATE TABLE loan (
  taken DATE NOT NULL,
  `code` INTEGER NOT NULL,
  `no` INTEGER NOT NULL ,
  due DATE NOT NULL,
  `return` DATE NULL,
  CONSTRAINT pri_loan PRIMARY KEY (taken,`code`, `no`),
  CONSTRAINT for1_loan FOREIGN KEY (`code`)   
  REFERENCES copy (`code`) ON UPDATE CASCADE ON DELETE CASCADE, 
  CONSTRAINT for2_loan FOREIGN KEY (`no`)   
  REFERENCES student (`no`) ON UPDATE CASCADE ON DELETE CASCADE);
  
CREATE TABLE audit (
audit_no INT NOT NULL AUTO_INCREMENT,       
no INT NOT NULL,
taken DATE NOT NULL,
due_ DATE NOT NULL,
`return` DATE NOT NULL,
CONSTRAINT pri_audit PRIMARY KEY (audit_no));



