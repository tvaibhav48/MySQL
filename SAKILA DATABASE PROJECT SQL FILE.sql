USE sakila;
SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM film_text;
SELECT * FROM inventory;
SELECT * FROM language;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM store;



-- ********************** --
-- SLIDE 1 DATA --
-- SHEET 1 IN EXCEL --
-- ********************** --
-- TOTAL REVENUE --
SELECT sum(amount) AS Total_Revenue FROM payment;

-- INVENTORY SIZE --
SELECT count(inventory_id) AS Inventory_Size FROM inventory;

-- NO. OF STORES --
SELECT count(store_id) AS Total_Stores FROM store;

-- NO. OF FILM CATEGORIES --
SELECT count(*) AS Total_Film_Categories FROM category;



-- ********************** --
-- SLIDE 2 DATA --
-- SHEET 2 IN EXCEL --
-- WRITE AN SQL QUERY TO FIND THE TOP 5 HIGHEST REVENUE GENERATING MOVIES? --
-- ********************** --
SELECT title AS Film_Title, sum(amount) as Revenue FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON rental.inventory_id = inventory.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY title
ORDER BY Revenue DESC
LIMIT 5;



-- ********************** --
-- SLIDE 3 DATA --
-- SHEET 3 IN EXCEL --
-- WRITE AN SQL QUERY TO FIND THE REVENUE BY MOVIE RATING? --
-- ********************** --
SELECT rating AS Rating ,sum(amount) AS Revenue FROM film 
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON rental.inventory_id = inventory.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY Rating
ORDER BY Revenue DESC;



-- ********************** --
-- SLIDE 4 DATA --
-- SHEET 4 IN EXCEL --
-- WRITE AN SQL QUERY TO FIND THE REVENUE AS PER THE FILM CATEGORY?--
-- ********************** --
SELECT name AS Category, sum(amount) AS Total_Sales FROM category
INNER JOIN film_category ON category.category_id = film_category.category_id
INNER JOIN film ON film_category.film_id = film.film_id
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.rental_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY Category
ORDER BY Total_Sales DESC
LIMIT 5;



-- ********************** --
-- SLIDE 5 DATA --
-- SHEET 5 IN EXCEL --
-- WRITE AN SQL QUERY TO FIND THE NO. OF MOVIE DVDS AVAILABLE IN STORE 1 & STORE 2 ACC0RDING TO THEIR CATEGORY --
-- ********************** --
SELECT Category, MAX(Store_1) AS Movie_DVDs_Available_In_Store_1, MAX(Store_2) AS Movie_DVDs_Available_In_Store_2
FROM
(SELECT Category,
CASE
WHEN store_id = 1 THEN No_of_Films
ELSE 0
END AS Store_1,
CASE
WHEN store_id = 2 THEN No_of_Films
ELSE 0
END AS Store_2
FROM
(SELECT name AS Category, store_id, COUNT(DISTINCT(film.film_id))AS No_of_Films FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
INNER JOIN inventory ON film.film_id = inventory.film_id
GROUP BY Category, store_id) AS Temp1) AS Temp2
GROUP BY Category;



-- ********************** --
-- SLIDE 6 DATA --
-- SHEET 6 IN EXCEL --
-- WRITE AN SQL QUERY TO FIND THE TOP 5 COUNTRIES WHERE MAXIMUM CUSTOMERS ARE ACTIVE?--
-- ********************** --
SELECT Country, MAX(Active) AS Active_Customers
FROM (SELECT Country,
CASE
WHEN active = 1 THEN Cnt
ELSE 0
END AS Active,
CASE
WHEN active = 0 THEN Cnt
ELSE 0
END AS Non_Active
FROM
(SELECT country AS Country, active, COUNT(active) AS Cnt FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
GROUP BY country, active) AS Temp3
GROUP BY Country, active) AS Temp4
GROUP BY Country
ORDER BY Active_Customers DESC
LIMIT 5;



-- ********************** --
-- SLIDE 7 DATA --
-- SHEET 7 IN EXCEL --
-- WRITE AN SQL QUERY TO FIND THE REVENUE PER STORE?--
-- ********************** --
SELECT store.store_id AS Store, country AS Country,
CONCAT(first_name,' ',last_name) AS Manager_Name, SUM(amount) AS Sales FROM store
INNER JOIN staff ON store.store_id = staff.staff_id
INNER JOIN inventory ON store.store_id = inventory.inventory_id
INNER JOIN payment ON staff.staff_id = payment.staff_id
INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
GROUP BY store.store_id;


-- ********************** --
-- SLIDE 8 DATA --
-- SHEET 8 IN EXCEL --
-- WRITE AN SQL QUERY TO FIND WHICH COUNTRY HAS GENERATED THE HIGHEST REVENUE? --
-- ********************** --
SELECT country AS Country, sum(amount) AS Revenue FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON country.country_id = city.country_id
GROUP BY Country
ORDER BY Revenue DESC;