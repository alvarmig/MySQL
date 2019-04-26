-- NOT EQUAL !=
SELECT title FROM books WHERE year != 2017;

-- NOT LIKE
SELECT title FROM books WHERE title NOT LIKE 'W%';

-- Greater Than > >=
SELECT * FROM books WHERE released_year > 2000;
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

-- Less Than <
SELECT * FROM books WHERE released_year < 2000;

-- AND
SELECT * FROM books WHERE CONCAT(author_lname,' ', author_fname) = 'Eggers Dave' AND released_year > 2010;
SELECT * FROM books WHERE author_lname='Eggers' AND released_year > 2010 AND title LIKE '%novel%';

-- OR ||
SELECT * FROM books WHERE author_lname='Eggers' || released_year > 2010 OR stock_quantity > 100;

-- BETWEEN

SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;
SELECT CAST('2017-05-05' as DATETIME);
SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1980-01-01' as DATETIME) AND CAST('2000-01-01' as DATETIME);

-- IN NOT IN
SELECT title, author_lname FROM books WHERE author_lname IN('Carver', 'Lahiri', 'Smith');
SELECT title, released_year FROM books WHERE released_year NOT IN('2000','2001','2004','2006');
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016) ORDER BY released_year;
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;

-- Case Statements
SELECT title, released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END as GENRE
FROM books;

SELECT title, stock_quantity, 
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        WHEN stock_quantity <= 150 THEN '***'
        ELSE '****'
    END as STOCK
FROM books;

-- CASE from a different database join_us db
SELECT 
    CASE
        WHEN  email LIKE '%yahoo.com' THEN  'yahoo'
        WHEN  email LIKE '%hotmail.com' THEN  'hotmail'
        WHEN  email LIKE '%gmail.com' THEN  'gmail'
        ELSE 'other'
    END as provider,
    COUNT(email) as total_users 
FROM users
GROUP BY provider
ORDER BY total_users DESC;

-- EXERCISES
SELECT 10 != 10; -- RESULT 0
SELECT 15 > 14 && 99 - 5 <= 94; -- 1 && 1 = 1
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- 0 || 1 = 1

SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books WHERE author_lname IN('Eggers','Chabon');
SELECT * FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';

SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

SELECT title, author_lname FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%'; 
SELECT title, author_lname FROM books WHERE SUBSTRING(author_lname,1,1) = 'C' OR SUBSTRING(author_lname,1,1) = 'S';
SELECT title , author_lname FROM books WHERE SUBSTRING(author_lname, 1,1) IN ('C' , 'S');

SELECT title, author_lname, 
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title LIKE 'Just Kids' OR title LIKE 'A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'Novel'
    END AS 'TYPE'
FROM books;

SELECT title, author_lname, COUNT(*) AS num_books FROM books GROUP BY author_lname, author_fname ORDER BY author_lname;

SELECT title, author_lname, 
	CASE 
		WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book')
        ELSE CONCAT(COUNT(*), ' books')
	END AS 'COUNT'
FROM books 
GROUP BY author_lname, author_fname 
ORDER BY author_lname;

