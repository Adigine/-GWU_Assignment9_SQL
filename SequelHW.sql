USE sakila;
SET SQL_SAFE_UPDATES = 0;

# Part 1____________________________________

#1a.
SELECT * FROM actor;
#SELECT * FROM actor WHERE last_name = 'CHASE';

#1b
ALTER TABLE actor
ADD COLUMN Actor_Name VARCHAR(100);
UPDATE actor SET Actor_Name = CONCAT(first_name, ' ', last_name);
SELECT Actor_Name FROM actor;

# Part 2____________________________________

# 2a
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = "Joe";

# 2b
SELECT * FROM actor 
WHERE last_name LIKE '%GEN%';

# 2c
SELECT * FROM actor 
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

#2d
SELECT country_id, country 
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');


# Part 3____________________________________

#3a. Inserting Blob Column
ALTER TABLE actor
ADD COLUMN description BLOB(100);

#3b drop a column in actor
ALTER TABLE actor DROP description;


# Part 4____________________________________

# 4a
Select last_name from actor;
SELECT last_name, COUNT(*)
    FROM actor
    GROUP BY last_name
    ORDER BY last_name;
    
# 4b
SELECT last_name, COUNT(*)
    FROM actor
    GROUP BY last_name
    HAVING COUNT(*) >= 2
    ORDER BY last_name;


# 4c 
UPDATE actor
SET first_name = 'HARPO'
WHERE actor_id = 172;
Select * from actor;

# 4d
UPDATE actor
SET first_name = 'GROUCHO'
WHERE actor_id = 172;
Select * from actor;

# Part 5____________________________________

SHOW CREATE TABLE actor;
CREATE TABLE `actor` (
  `actor_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`),
  KEY `idx_actor_last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

# Part 6____________________________________

#6a
SELECT staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address ON staff.address_id = address.address_id;

#6b
SELECT staff_id, first_name, last_name SUM(amount) FROM payment WHERE payment_date LIKE '2005-08%'
	GROUP BY staff_id IN (
    

SELECT * FROM STAFF;
#INNER JOIN staff ON payment.staff_id = staff.staff_id;

#6c
SELECT film_actor.film_id, film_actor.actor_id, film.title
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id;

#6d
Select * FROM film;

# Part 7____________________________________

# 7a
SELECT title FROM film
WHERE title LIKE 'K%' OR 'Q%' IN
 (
	SELECT language_id FROM Language
	WHERE name = 'English'
    );
    
# 7b    


Select * from film;
Select * from actor;
Select * from film_actor;
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
 SELECT actor_id
 FROM film_actor
 WHERE film_id = 17
);

# 7c
SELECT first_name, last_name, email FROM customer WHERE address_id IN
	(SELECT address_id FROM address WHERE city_id IN
		(SELECT city_id FROM city WHERE country_id IN
			(SELECT country_id FROM country WHERE country = 'Canada')));
            
#7d
#sales lagging young families - target all family movies
#all movies categorized as _family_films
Select * from film;
Select * from film_category;
Select * from category;
SELECT title
FROM film
WHERE film_id IN
(
 SELECT film_id
 FROM film_category
 WHERE category_id =  8
);

# Part 8____________________________________