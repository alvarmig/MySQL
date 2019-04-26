-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format

-- CHAR and VARCHAR
-- CHAR has a fixed length
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
INSERT INTO dogs(name, breed) VALUES('bob', 'beagle');

-- DECIMAL for more precision
CREATE TABLE items(price DECIMAL(5,2));
INSERT INTO items(price) VALUES(7);
INSERT INTO items(price) VALUES(7987654);
INSERT INTO items(price) VALUES(34.88);
INSERT INTO items(price) VALUES(298.9999);
INSERT INTO items(price) VALUES(1.9999);

-- FLOAT and DOUBLE less precision but less space
INSERT INTO thingies(price) VALUES (88.45);
INSERT INTO thingies(price) VALUES (8877.45);
INSERT INTO thingies(price) VALUES (8877665544.45);

-- DATE, TIME, DATETIME
CREATE TABLE people(name VARCHAR(100), birthday DATE, birthtime TIME, birthdt DATETIME);
INSERT INTO people(name, birthday, birthtime, birthdt) VALUES('Padma', '1983-11-11','10:07:35', '1983-11-11 10:07:35' );
INSERT INTO people(name, birthday, birthtime, birthdt) VALUES('Larry', '1943-12-25','04:10:42', '1943-12-25 04:10:42' );

-- CURDATE CURTIME NOW
INSERT INTO people VALUES('Microwave', CURDATE(), CURTIME(), NOW());

-- FORMATTING DATES
SELECT name, birthday, DAY(birthday), DAYNAME(birthday), DAYOFWEEK(birthday), DAYOFYEAR(birthday), MONTH(birthdt), MONTHNAME(birthday), HOUR(birthtime) FROM people;
SELECT DATE_FORMAT(birthdt, '%W %M %Y') FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%m/%Y at %h:%m') FROM people;

-- DATE MATH
SELECT name, birthday, DATEDIFF(NOW(),birthday) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

-- TIMESTAMPS
CREATE TABLE comments(content VARCHAR(100), created_at TIMESTAMP DEFAULT NOW());
INSERT INTO comments(content) VALUES('lol what a funny article');
CREATE TABLE comments2(content VARCHAR(100), changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP);
UPDATE comments2 SET content='This is not gibberish' WHERE content ='ghgjhghghjhgghj';

-- EXERCISES
-- Used for text that we know has a fixed length, e.g., State abbreviations, 
-- abbreviated company names, sex M/F, etc.

SELECT CURTIME();
SELECT CURDATE();
SELECT DAYOFWEEK(NOW());
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(),'%m/%d/%Y');
SELECT DATE_FORMAT(NOW(),'%M %D at %h:%i');
CREATE TABLE tweets(content VARCHAR(140), username VARCHAR(20), created_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW());