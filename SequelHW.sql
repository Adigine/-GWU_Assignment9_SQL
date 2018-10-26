USE sakila;

# Part 1____________________________________

#1a.
SELECT * FROM actor WHERE last_name = 'CHASE';

#1b
ALTER TABLE actor
ADD COLUMN Actor_Name VARCHAR(100);
UPDATE actor SET Actor_Name = CONCAT(first_name, ' ', last_name);

# Part 2____________________________________

#2a. Inserting Blob Column
ALTER TABLE actor
ADD COLUMN description BLOB(100);

#2b drop a column in actor
ALTER TABLE actor DROP description;

# Part 3____________________________________

# 3a
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = "Joe";

# 3b
SELECT * FROM actor 
WHERE last_name LIKE '%GEN%';

# 3c
SELECT * FROM actor 
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

#3d
SELECT country_id, country 
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

# Part 4____________________________________


# Part 5____________________________________


# Part 6____________________________________

#6a
SELECT staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address ON staff.address_id = address.address_id;

#6b

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
SELECT first_name, last_name, email FROM customer WHERE address_id IN
	(SELECT address_id FROM address WHERE city_id IN
		(SELECT city_id FROM city WHERE country_id IN
			(SELECT country_id FROM country WHERE country = 'Canada')));

# 7c

# Part 8____________________________________