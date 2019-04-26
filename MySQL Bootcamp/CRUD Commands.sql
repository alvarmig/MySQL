-- CREATE, READ, UPDATE, DELETE 

DROP TABLE cats;

CREATE TABLE cats(
	cat_id INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(100), 
    breed VARCHAR(100), 
    age INT, 
    PRIMARY KEY(cat_id));
    
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- SELECT STATEMENT (READ)

SELECT * FROM cats; 
SELECT name FROM cats; 
SELECT age FROM cats; 
SELECT cat_id FROM cats; 
SELECT name, age FROM cats; 
SELECT cat_id, name, age FROM cats; 
SELECT age, breed, name, cat_id FROM cats; 
SELECT cat_id, name, age, breed FROM cats;

-- WHERE 

SELECT * FROM cats WHERE age=4; 
SELECT * FROM cats WHERE name='Egg'; 
SELECT * FROM cats WHERE name='egG';

-- Exercises SELECT 

SELECT cat_id FROM cats; 
SELECT name, breed FROM cats; 
SELECT name, age FROM cats WHERE breed='Tabby'; 
SELECT cat_id, age FROM cats WHERE cat_id=age; 
SELECT * FROM cats WHERE cat_id=age;

-- Aliases 

SELECT cat_id AS id, name FROM cats; 
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;

-- UPDATE 
SELECT * FROM cats;
UPDATE cats SET breed='Shorthair' WHERE breed= 'Tabby';
UPDATE cats SET age=14 WHERE name='Misty';
 
 -- UPDATE EXERCISE 
 UPDATE cats SET name='Jack' WHERE name='Jackson';
 UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
 UPDATE cats SET age=12 WHERE breed='Maine Coon';
 
-- DELETE 

DELETE FROM cats WHERE name ='Egg';
DELETE FROM cats;

-- DELETE EXERCISE 
DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;




