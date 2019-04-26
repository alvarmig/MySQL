/* source file_name.sql */
CREATE DATABASE book_shop;
USE book_shop;
SELECT * FROM books;

-- CONCAT
SELECT CONCAT(author_fname, ', ', author_lname) as Full_Name FROM books; 

SELECT author_fname as first, author_lname as last, CONCAT(author_fname, ', ', author_lname) as Full_Name FROM books; 

SELECT CONCAT_WS(' - ', title, author_fname, author_lname) as Full_Name FROM books; 

-- SUBSTRING

SELECT SUBSTRING('Hello World', 1, 4);

SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', -3);

SELECT CONCAT(SUBSTRING(title, 1,10),'...' ) as short_title FROM books;

-- REPLACE

SELECT REPLACE('Hello World', 'Hell', '%$#@');

SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');

SELECT REPLACE(title, 'e','3') FROM books;

SELECT SUBSTRING(REPLACE(title, 'e', '3'),1,10) as Example FROM books;

-- REVERSE

SELECT REVERSE('Hello World');

SELECT CONCAT(author_lname, REVERSE(author_fname)) FROM books;

-- CHAR_LENGTH

SELECT CHAR_LENGTH('Hello World');

SELECT author_lname, CHAR_LENGTH(author_lname) as 'length' FROM books;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

-- UPPER and LOWER

SELECT UPPER('Hello World');

SELECT LOWER('Hello World');

SELECT CONCAT('My Favorite book is ', UPPER(title)) FROM books;

-- EXERCISES

SELECT UPPER(REVERSE('Why does my cat look at me with such hatred?'));

SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'), ' ', '-');
-- 'I-like-cats '

SELECT title FROM books;
SELECT REPLACE(title, ' ', '->') FROM books;

SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;

SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;

SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;

SELECT CONCAT(SUBSTRING(title, 1,10),'...' ) as 'short title', CONCAT(author_lname, ',', author_fname) AS author, CONCAT(stock_quantity, ' in stock') AS quantity FROM books;



