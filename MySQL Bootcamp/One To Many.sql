-- FOREIGN KEYS
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL (8,2),
    customer_id INT, 
    FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE
    
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

-- Cross Join
SELECT * FROM customers, orders;

-- IMPLICIT INNER JOIN
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;

-- EXPLICIT INNER JOIN
SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders
    ON customers.id = orders.customer_id
ORDER BY amount;

SELECT first_name, last_name, SUM(amount) as total_spent FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;
    
-- LEFT JOIN  //Display customers with no orders
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT first_name, last_name, IFNULL(SUM(amount),0) as total_spent FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent DESC;

-- JOIN with a CASE
SELECT first_name, last_name, 
    CASE
        WHEN SUM(amount) = NULL THEN '0'
        ELSE SUM(amount)
    END AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent DESC;

-- RIGHT JOIN // Used to find order without customers
SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT 
    IFNULL(first_name,'MISSING') AS first, 
    IFNULL(last_name,'USER') as last, 
    order_date, 
    amount, 
    SUM(amount)
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY first_name, last_name;
    
DELETE FROM customers WHERE first_name='Boy';

-- ON DELETE CASCADE
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
        ON DELETE CASCADE
);

-- EXERCISES
CREATE TABLE students(
	id INT AUTO_INCREMENT, 
    first_name VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE papers(
	title VARCHAR(100), 
    grade INT, 
    student_id  INT, 
    FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT s.first_name, p.title, p.grade 
FROM students s
JOIN papers p 
	ON s.id = p.student_id
ORDER BY grade DESC;

SELECT s.first_name, p.title, p.grade 
FROM students s
LEFT JOIN papers p 
	ON s.id = p.student_id;

-- 1. SAME SOLUTION     
SELECT s.first_name, 
	   IFNULL(p.title, 'MISSING') AS title, 
       IFNULL(p.grade, 0) AS grade 
FROM students s
LEFT JOIN papers p 
	ON s.id = p.student_id;

-- 1. SAME SOLUTION     
SELECT s.first_name, 
	CASE 
		WHEN p.title IS NULL THEN 'MISSING'
        ELSE p.title
    END AS title, 
    CASE 
		WHEN p.grade IS NULL THEN 0
		ELSE p.grade
    END AS grade
FROM students s
LEFT JOIN papers p 
	ON s.id = p.student_id;
    
SELECT s.first_name, 
	IFNULL(AVG(p.grade), 0)  AS average
FROM students s
LEFT JOIN papers p 
	ON s.id = p.student_id
GROUP BY s.first_name
ORDER BY average DESC;

SELECT 
	s.first_name, 
	IFNULL(AVG(p.grade), 0)  AS average, 
    CASE 
		WHEN AVG(p.grade) IS NULL THEN 'FAILING'
		WHEN AVG(p.grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM students s
LEFT JOIN papers p 
	ON s.id = p.student_id
GROUP BY s.first_name
ORDER BY average DESC;


