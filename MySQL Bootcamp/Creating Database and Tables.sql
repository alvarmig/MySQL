-- Create Databases
SHOW DATABASES;

CREATE DATABASE hello_world_db;
CREATE DATABASE testing_db;

-- Dropping Databases

DROP DATABASE hello_world_db;
DROP DATABASE testing_db;

-- Using Databases

CREATE DATABASE dog_walking_app;
USE dog_walking_app;
SELECT DATABASE();

-- Introduction to Tables 
-- CREATE TABLE & DESC 

CREATE SCHEMA cat_app; 
USE cat_app;

CREATE TABLE cats (
	name VARCHAR(100), 
    age INT);
    
SHOW TABLES;
SHOW COLUMNS FROM cats;
DESC cats;

-- DROP TABLES
DROP TABLE cats;


-- EXERCISE

CREATE TABLE pastries (
	name VARCHAR(50), 
    quantity INT);
    
DESC pastries;
DROP TABLE pastries;


