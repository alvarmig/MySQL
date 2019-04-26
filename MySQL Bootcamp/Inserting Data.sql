-- INSERT INTO 
CREATE TABLE cats(
	name VARCHAR(50), 
    age INT);

INSERT INTO cats(name, age) 
VALUES ('Jetson' , 7);

INSERT INTO cats VALUES('Draco', 11);

-- QUICK SELECT 

SELECT * FROM cats;

-- Multiple INSERTS

INSERT INTO cats(name, age)
VALUES ('Peanut', 2), 
	   ('Butter', 4), 
       ('Jelly', 7);
       
SELECT * FROM cats;

-- EXERCISE 

CREATE TABLE people(
	first_name VARCHAR(20), 
    last_name VARCHAR(20), 
    age INT);
    
INSERT INTO people(first_name, last_name, age) VALUES ('Tina', 'Belcher', 13);
INSERT INTO people(age, last_name, first_name) VALUES (42, 'Belcher', 'Bob');
INSERT INTO people(first_name, last_name, age)
VALUES('Linda', 'Belcher', 45)
  ,('Phillip', 'Frond', 38)
  ,('Calvin', 'Fischoeder', 70);

SELECT * FROM people;
DROP TABLE people;

-- Warnings 

SHOW WARNINGS;

-- NULL & NOT NULL

INSERT INTO cats(name) VALUES('Alabama');
INSERT INTO cats VALUES();
SELECT * FROM cats;
DESC cats;

CREATE TABLE cats2(
	name VARCHAR(100) NOT NULL, 
    age INT NOT NULL);
    
DESC cats2;

INSERT INTO cats2(name) VALUES('Alabama');
INSERT INTO cats2 VALUES();

SELECT * FROM cats2;

-- DEFAULT VALUES 
CREATE TABLE cats3(
	name VARCHAR(100) DEFAULT 'No Name Provided', 
    age INT DEFAULT 99);
    
DESC cats3;
INSERT INTO cats3(age) VALUES(13);
SELECT * FROM cats3;

CREATE TABLE cats4(
	name VARCHAR(100) NOT NULL DEFAULT 'No Name Provided', 
    age INT DEFAULT 99);
    
INSERT INTO cats4(age) VALUES(NULL);

-- PRIMARY KEY

CREATE TABLE unique_cats(
	cat_id INT NOT NULL PRIMARY KEY, 
    name VARCHAR(100), 
    age INT);
    
DESC unique_cats;

-- AUTO INCREMENT
CREATE TABLE unique_cats2(
	cat_id INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(100), 
    age INT,
    PRIMARY KEY (cat_id));
    
DESC unique_cats2;


-- EXERCISE

CREATE TABLE employees(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    last_name VARCHAR(255) NOT NULL, 
    first_name VARCHAR(255) NOT NULL, 
    middle_name VARCHAR(255), 
    age INT NOT NULL, 
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed');

CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);
