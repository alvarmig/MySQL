CREATE DATABASE shirts_db;

CREATE TABLE shirts(
	shirt_id INT NOT NULL AUTO_INCREMENT, 
    article VARCHAR(100), 
    color VARCHAR(100), 
    shirt_size ENUM('S', 'M', 'L', 'XS'), 
    last_worn INT,
    PRIMARY KEY(shirt_id));
    
INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

SELECT * FROM shirts;

INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES('polo shirt', 'purple', 'M', 50);

SELECT article, color FROm shirts;

SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';

SELECT * FROM shirts WHERE article = 'polo shirt';
UPDATE shirts SET shirt_size = 'L' WHERE article = 'polo shirt';

SELECT * FROM shirts WHERE last_worn = 15;
UPDATE shirts SET last_worn = 0  WHERE last_worn = 15;

SELECT * FROM shirts WHERE color = 'white';
UPDATE shirts SET shirt_size = 'XS', color = 'off white' WHERE color = 'white';

SELECT * FROM shirts WHERE last_worn = 200;
DELETE FROM shirts WHERE last_worn = 200;

SELECT * FROM shirts WHERE article = 'tank top';
DELETE FROM shirts WHERE article = 'tanl top';

DELETE FROM shirts;
SELECT * FROM shirts;

DROP DATABASE cat_app;