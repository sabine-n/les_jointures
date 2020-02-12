-- Q1
SELECT title, name
FROM film
INNER JOIN language 
ON film.language_id = language.language_id
LIMIT 10;

-- Q2
SELECT title, actor.first_name as 'first name', actor.last_name as 'last name', release_year as year
FROM film_actor
INNER JOIN film
ON film_actor.film_id = film.film_id
INNER JOIN actor
on film_actor.actor_id = actor.actor_id
WHERE actor.first_name = 'JENNIFER' AND actor.last_name = 'DAVIS' AND release_year = '2006';

-- Q3
USE sakila;
SELECT first_name, last_name, film.title
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
INNER JOIN inventory
ON rental.inventory_id = inventory.inventory_id
INNER JOIN film
On inventory.film_id = film.film_id
WHERE film.title = 'ALABAMA DEVIL';

-- Q4
SELECT title, city.city
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
INNER JOIN rental
ON inventory.inventory_id = rental.inventory_id
INNER JOIN customer
ON rental.customer_id = customer.customer_id
INNER JOIN address
ON customer.address_id = address.address_id  
RIGHT JOIN city 
ON address.city_id = city.city_id
WHERE film.title IS NULL
AND city = "Woodridge";

-- Q5
SELECT title, datediff(rental.return_date, rental.rental_date) as duration , return_date, rental_date
FROM film
inner JOIN inventory
ON film.film_id = inventory.film_id
inner JOIN rental 
ON inventory.inventory_id = rental.inventory_id
WHERE datediff(rental.return_date, rental.rental_date) IS NOT NULL
order by duration
LIMIT 10;

-- Q6
SELECT title, category.name
FROM film
LEFT JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON film_category.category_id = category.category_id 
WHERE category.name = "Action"
ORDER BY title;

-- Q7
SELECT title, datediff(rental.return_date, rental.rental_date) as duration
FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
INNER JOIN rental 
ON inventory.inventory_id = rental.inventory_id
WHERE datediff(rental.return_date, rental.rental_date) < 2
ORDER BY datediff(rental.return_date, rental.rental_date) ;


