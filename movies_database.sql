SELECT title, release_year
FROM movies
WHERE release_year > 2015;

show tables;
select movies;

SELECT type, COUNT(*) AS total
FROM movies
GROUP BY type;

SELECT m.title, ROUND(AVG(r.rating), 2) AS avg_rating
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.movie_id, m.title
ORDER BY avg_rating DESC
LIMIT 10;

SELECT title
FROM movies
WHERE movie_id NOT IN (SELECT DISTINCT movie_id FROM ratings);

SELECT u.name, COUNT(r.movie_id) AS total_ratings
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.user_id
HAVING COUNT(r.movie_id) > 5;

SELECT country, COUNT(*) AS total_users
FROM users
GROUP BY country
ORDER BY total_users DESC;

SELECT u.name, m.title, r.rating, r.rated_at
FROM ratings r
JOIN users u ON r.user_id = u.user_id
JOIN movies m ON r.movie_id = m.movie_id
WHERE r.rated_at >= CURDATE() - INTERVAL 6 MONTH;

SELECT u.name, ROUND(AVG(r.rating), 2) AS avg_rating
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.user_id;

SELECT age_rating, COUNT(*) AS total
FROM movies
GROUP BY age_rating
ORDER BY total DESC;

SELECT title, duration
FROM movies
WHERE duration LIKE '%h%'
ORDER BY CAST(SUBSTRING_INDEX(duration, 'h', 1) AS UNSIGNED) DESC
LIMIT 10;

SELECT title, release_year
FROM movies
ORDER BY release_year DESC
LIMIT 10;

SELECT * FROM movies
WHERE title LIKE '%love%';

SELECT name, email, join_date
FROM users
WHERE YEAR(join_date) = 2023;

SELECT m.title, COUNT(r.rating) AS rating_count
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.movie_id
ORDER BY rating_count DESC
LIMIT 10;

SELECT release_year, COUNT(*) AS total_movies
FROM movies
GROUP BY release_year
ORDER BY release_year DESC;

SELECT u.name, m.title, r.rating
FROM ratings r
JOIN users u ON r.user_id = u.user_id
JOIN movies m ON r.movie_id = m.movie_id
WHERE (r.user_id, r.rating) IN (
    SELECT user_id, MAX(rating)
    FROM ratings
    GROUP BY user_id
);

SELECT u.name, ROUND(AVG(r.rating), 2) AS avg_rating
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.user_id
ORDER BY avg_rating ASC
LIMIT 5;

SELECT rating, COUNT(*) AS frequency
FROM ratings
GROUP BY rating
ORDER BY rating;

SELECT name, COUNT(*) AS total_ratings
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.user_id
ORDER BY total_ratings DESC;

SELECT title, COUNT(*) AS count
FROM movies
GROUP BY title
HAVING COUNT(*) > 1;



















