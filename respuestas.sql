
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
/* 5 */