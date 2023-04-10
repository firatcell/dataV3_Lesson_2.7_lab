USE sakila;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name AS category, COUNT(*) AS film_count
FROM sakila.category c
JOIN sakila.film_category fc 
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY film_count DESC;


-- Display the total amount rung up by each staff member in August of 2005.

SELECT staff.staff_id, staff.first_name, staff.last_name, SUM(payment.amount) AS total_amount
FROM staff, payment
WHERE staff.staff_id = payment.staff_id
AND payment.payment_date >= '2005-08-01'
AND payment.payment_date < '2005-09-01'
GROUP BY staff.staff_id;



-- Which actor has appeared in the most films?

SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) as actor_name, COUNT(*) AS film_count
FROM actor AS a
JOIN film_actor AS fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC;



-- Most active customer (the customer that has rented the most number of films)

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) as customer_name, COUNT(*) AS rental_count
FROM customer AS c
JOIN rental AS r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rental_count DESC;



-- Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM sakila.staff as s
JOIN sakila.address as a 
ON s.address_id = a.address_id;



-- List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(*) AS num_actors
FROM film as f
JOIN film_actor as fa 
ON f.film_id = fa.film_id
GROUP BY f.title;



-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT customer.last_name, customer.first_name, SUM(payment.amount) AS total_paid
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY customer.last_name;



-- List number of films per category.



/*SELECT c.name AS category, COUNT(*) AS film_count
FROM sakila.category c
JOIN sakila.film_category fc 
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY film_count DESC;
*/

SELECT c.name AS category, COUNT(*) AS film_count
FROM sakila.category c
JOIN sakila.film_category fc 
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY category Asc;

