-- DISTINCT
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname, ' ',author_lname) as full_name FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

-- ORDER BY
SELECT author_lname FROM books ORDER BY author_lname;
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT released_year FROM books ORDER BY released_year;
SELECT title, author_fname, author_lname FROM books ORDER BY 2; -- author_fname
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;

-- LIMIT

SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5,2;

-- LIKE
SELECT * FROM books WHERE author_fname LIKE '%da%';
SELECT title FROM books WHERE title LIKE '%the%';
SELECT * FROM books WHERE stock_quantity LIKE '____';
SELECT title FROM books WHERE title LIKE '%\%%';
SELECT title FROM books WHERE title LIKE '%\_%';

-- EXERCISE
SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3; 

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity ASC LIMIT 3;

SELECT title, author_lname FROM books ORDER BY author_lname, title;

SELECT UPPER(CONCAT('My Favourite Author is ', author_fname, ' ', author_lname, '!')) AS yell FROM books ORDER BY author_lname;



