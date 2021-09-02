INSERT INTO book (isbn, title, author)
  VALUES ('111-2-33-444444-5', 'Pro JavaFX', 'Dave Smith');
INSERT INTO book (isbn, title, author)
  VALUES ('222-3-44-555555-6', 'Oracle Systems', 'Kate Roberts');
INSERT INTO book (isbn, title, author)
  VALUES ('333-4-55-666666-7', 'Expert jQuery', 'Mike Smith');

INSERT INTO copy (`code`, isbn, duration)
  VALUES (1011, '111-2-33-444444-5', 21);
INSERT INTO copy (`code`, isbn, duration)
  VALUES (1012, '111-2-33-444444-5', 14);
INSERT INTO copy (`code`, isbn, duration)
  VALUES (1013, '111-2-33-444444-5', 7);
INSERT INTO copy (`code`, isbn, duration)
  VALUES (2011, '222-3-44-555555-6', 21);
INSERT INTO copy (`code`, isbn, duration)
  VALUES (3011, '333-4-55-666666-7', 7);
INSERT INTO copy (`code`, isbn, duration)
  VALUES (3012, '333-4-55-666666-7', 14);
  
INSERT INTO student (`no`, name, school, embargo)
  VALUES (2001, 'Mike', 'CMP', 0);
INSERT INTO student (`no`, name, school, embargo)
  VALUES (2002, 'Andy', 'CMP', 1);
INSERT INTO student (`no`, name, school, embargo)
  VALUES (2003, 'Sarah', 'ENG', 0);
INSERT INTO student (`no`, name, school, embargo)
  VALUES (2004, 'Karen', 'ENG', 1);
INSERT INTO student (`no`, name, school, embargo)
  VALUES (2005, 'Lucy', 'BUE', 0);

INSERT INTO loan (taken, `code`, `no`, due, `return`)
  VALUES ('2018.01.10', 1011, 2002, '2018.01.31', '2018.01.31');
INSERT INTO loan (taken, `code`, `no`, due, `return`)
  VALUES ('2018.02.05', 1011, 2002, '2018.02.26', '2018.02.23');
INSERT INTO loan (taken, `code`, `no`, due, `return`)
  VALUES ('2018.05.10', 1011, 2003, '2018.05.31', NULL);
INSERT INTO loan (taken, `code`, `no`, due, `return`)
  VALUES ('2017.03.02', 1013, 2003, '2017.03.16', '2017.03.10');
INSERT INTO loan (taken, `code`, `no`, due, `return`)
  VALUES ('2017.08.02', 1013, 2002, '2017.08.16', '2017.08.16');
INSERT INTO loan (taken, `code`, `no`, due, `return`)
  VALUES ('2016.02.01', 2011, 2004, '2016.02.22', '2016.02.20');
INSERT INTO loan (taken, `code`, `no`, due, `return`)
  VALUES ('2018.07.03', 3011, 2002, '2018.07.10', NULL);
INSERT INTO loan (taken, `code`, `no`, due, `return`)
VALUES ('2017.10.10', 3011, 2005, '2017.10.17', '2017.10.20');
  