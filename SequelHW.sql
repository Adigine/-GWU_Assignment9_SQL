USE sakila;

# Part 1


# Part 2


# Part 3a
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

# Part 4


# Part 5


# Part 6


# Part 7

# 7a
SELECT title FROM film
WHERE title LIKE 'K%' OR 'Q%' IN
 (
	SELECT language_id FROM Language
	WHERE name = 'English'
    );
    
# 7b    
SELECT * FROM customer;
# 7c
SELECT title
FROM film
WHERE film_id IN
(
SELECT film_id
FROM film_category
WHERE category_id =  8
);
# Part 8