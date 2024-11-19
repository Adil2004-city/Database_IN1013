-- 1. List the dates and bill totals for customer Bob Crow.
SELECT b.date, b.total
FROM bills b
JOIN customers c ON b.customer_id = c.customer_id
WHERE c.first_name = 'Bob' AND c.last_name = 'Crow';

-- 2. List the names of all customers whose last name is Smith. List each customer only once in the reverse lexicographical order.
SELECT DISTINCT first_name, last_name
FROM customers
WHERE last_name = 'Smith'
ORDER BY first_name DESC;

-- 3. List the names of all customers whose second names begin with 'C'. List each customer only once.
SELECT DISTINCT first_name, last_name
FROM customers
WHERE last_name LIKE 'C%';

-- 4. List the names of all the headwaiters.
SELECT first_name, last_name
FROM staff
WHERE position = 'Headwaiter';

-- 5. List all the details of bills dated February 2016.
SELECT *
FROM bills
WHERE date >= '2016-02-01' AND date < '2016-03-01';

-- 6. List the dates the restaurant took money in 2015. List each date only once in the sorted order.
SELECT DISTINCT date
FROM bills
WHERE date >= '2015-01-01' AND date < '2016-01-01'
ORDER BY date;
