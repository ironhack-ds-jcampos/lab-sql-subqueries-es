
/* 1 */
SELECT COUNT(*)
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
WHERE f.title LIKE '%El Jorobado Imposible%';

/* 2 */
SELECT *
FROM film f
WHERE f.`length` >= (
	SELECT AVG(f2.`length`)
	FROM film f2
);

/* 3 */
SELECT *
FROM actor a
INNER JOIN film_actor fa ON fa.actor_id = a.actor_id
INNER JOIN (
	SELECT *
	FROM film f2
	WHERE f2.title = 'ALONE TRIP'
) f ON f.film_id = fa.film_id;

/* 4 */
SELECT f.*
FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
WHERE c.name = 'Family';

/* 5 */
SELECT c.first_name, c.email
FROM customer c
WHERE c.address_id IN (
	SELECT a.address_id
	FROM address a
	INNER JOIN city c ON c.city_id = a.city_id
	INNER JOIN country c2 ON c2.country_id = c.country_id
	WHERE c2.country = 'Canada'
);

/* 6 */
SELECT f2.*
FROM film f2
INNER JOIN film_actor fa2 ON fa2.film_id = f2.film_id AND fa2.actor_id = (
	SELECT a.actor_id
	FROM film f
	INNER JOIN film_actor fa ON fa.film_id = f.film_id
	INNER JOIN actor a ON fa.actor_id = fa.actor_id
	INNER JOIN inventory i ON f.film_id = i.film_id
	INNER JOIN rental r ON r.inventory_id = i.inventory_id
	INNER JOIN payment p ON p.rental_id = r.rental_id
	GROUP BY a.actor_id
	ORDER BY SUM(p.amount) DESC
	LIMIT 1
);

/* 7 */
SELECT *
FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
INNER JOIN customer c ON r.customer_id = c.customer_id
WHERE c.customer_id = (
	SELECT
		c2.customer_id
	FROM
		customer c2
	INNER JOIN payment p2 ON
		p2.customer_id = c2.customer_id
	GROUP BY c2.customer_id
	ORDER BY COUNT(*) DESC
	LIMIT 1
);

/* 8 */