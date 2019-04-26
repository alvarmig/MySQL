/* CREATE DATABASE trigger_demo;
USE trigger_demo;

CREATE TABLE users(
     username VARCHAR(100),
     age INT
);

INSERT users(username, age) VALUES ("bobby", 23); */

DELIMITER $$

CREATE TRIGGER must_be_adult
	BEFORE INSERT ON users FOR EACH ROW
    BEGIN
		IF NEW.age < 18
        THEN 
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Must be an adult!';
		END IF;
    END;
$$

DELIMITER ;

/*DROP TRIGGER must_be_adult;

INSERT users(username, age) VALUES ("Juan", 14);*/

-- Preventing Self-Follows
USE ig_clone;

DELIMITER $$ 

CREATE TRIGGER prevent_self_follows
	BEFORE INSERT ON follows FOR EACH ROW
	BEGIN 
		IF NEW.follower_id = NEW.followee_id
			THEN 
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'You cannot follow yourself!';
        END IF;
    END;

DELIMITER ;

INSERT INTO follows(follower_id, followee_id) VALUES(5,5);

-- Loggin Unfollows INSERT INTO

DELIMITER $$

CREATE TRIGGER capture_unfollow
	AFTER DELETE ON unfollows FOR EACH ROW
		BEGIN 
			INSERT INTO unfollows
            SET follower_id = OLD.follower_id,
				followee_id = OLD.followee_id;
        END;

DELIMITER ;

DELETE FROM follows WHERE follower_id=2 AND followee_id =1;

SHOW TRIGGERS;

