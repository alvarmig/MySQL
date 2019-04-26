-- Find the 5 oldest users.
SELECT * 
FROM users 
ORDER BY created_At 
LIMIT 5;

-- What day of the week do most users register on?
SELECT COUNT(*) AS num_users, DAYNAME(created_at) AS week_day
FROM users
GROUP BY week_day
ORDER BY num_users DESC;

SELECT
    DAYNAME(created_at) as day, 
    COUNT(*) as total
FROM users
GROUP BY day 
ORDER BY total DESC
LIMIT 2;

-- Find the users who have never posted a photo (Inactive Users)
SELECT u.username, p.id
FROM users u 
LEFT JOIN photos p 
	ON u.id = p.user_id
WHERE p.id IS NULL;

-- User with most likes in a photo. (most popular photo and user who created it)
SELECT u.username, p.image_url, COUNT(l.created_at) AS num_likes
FROM users u 
JOIN photos p 
	ON u.id = p.user_id
JOIN likes l 
	ON l.photo_id = p.id
GROUP BY p.id
ORDER BY num_likes DESC
LIMIT 1;

SELECT
    username,
    image_url,
    COUNT(*) as total
FROM photos
JOIN likes 
    ON photos.id = likes.photo_id
JOIN users
    ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- How many times does the average user post.
-- total number of photos / total number of users
SELECT COUNT(*) FROM photos;
SELECT COUNT(*) FROM users;

SELECT ((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)) AS 'avg';

-- What are the top 5 most commonly used hashtags?
SELECT t.tag_name, COUNT(p.created_at) AS num_photos
FROM tags t
JOIN photo_tags pt 
	ON t.id = pt.tag_id
JOIN photos p 
	ON p.id = pt.photo_id
GROUP BY t.id
ORDER BY num_photos DESC
LIMIT 5;

SELECT 
    tag_name, 
    COUNT(*) as total
FROM tags
JOIN photo_tags
    ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- Find the users who have liked every single photo on the site; 257 PHOTOS and 8782 likes

SELECT 
	u.username, 
    COUNT(*) AS num_likes 
FROM users u
JOIN likes l 
	ON u.id = l.user_id
GROUP BY u.id
HAVING num_likes = (SELECT COUNT(*) FROM photos);


