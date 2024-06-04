
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