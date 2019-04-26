-- COUNT
SELECT COUNT(*) FROM books;
SELECT COUNT(author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- GROUP BY
-- GROUP BY summarizes or aggregates identical data into single rows
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT released_year, COUNT(released_year) as number_of_movies FROM books GROUP BY released_year;
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released' ) as year FROM books GROUP BY released_year ORDER by COUNT(released_year) DESC;

-- MIN, MAX
SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;

-- SUBQUERIES //are slow as two quieries needs to be run.
SELECT * FROM books WHERE pages = (SELECT MIN(pages) FROM books);
SELECT title, released_year FROM books WHERE released_year = (SELECT MAX(released_year) FROM books);

-- ORDER BY again, can solve some questions from MIN and MAX
SELECT title, pages FROM books ORDER BY pages ASC LIMIT 1;

-- MIN, MAX with GROUP BY
SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;
SELECT author_fname, author_lname, MAX(pages) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, ' ', author_lname) as author, MAX(pages) as 'longest book' FROM books GROUP BY author_lname, author_fname;

-- SUM
SELECT SUM pages FROM books;
SELECT author_fname, author_lname, SUM(pages) FROM books GROUP BY author_lname, author_fname ORDER BY SUM(pages) DESC;

-- AVG
SELECT AVG(released_year) FROM books;
SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;
SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;

-- EXERCISE
SELECT DISTINCT COUNT(*) AS '# books' FROM books;
SELECT released_year, COUNT(*) AS num_of_books FROM books GROUP BY released_year;
SELECT SUM(stock_quantity) FROM books;
SELECT CONCAT(author_lname, ' ', author_fname) AS author ,AVG(released_year) FROM books GROUP BY author_lname, author_fname;

SELECT CONCAT(author_lname, ' ', author_fname) AS full_name, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT CONCAT(author_fname, ' ', author_lname) as full_name, pages as 'longest book' FROM books ORDER BY pages DESC LIMIT 1;

SELECT released_year AS 'year', COUNT(*) AS '# books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year ORDER BY released_year;




