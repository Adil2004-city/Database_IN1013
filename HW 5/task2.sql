-- 1. How much money has the restaurant taken? Change the name of the output column to 'Income'.
SELECT SUM(total) AS Income
FROM bills;

-- 2. How much money did the restaurant take in February 2016? Change the name of the output column to 'Feb Income'.
SELECT SUM(total) AS "Feb Income"
FROM bills
WHERE date >= '2016-02-01' AND date < '2016-03-01';

-- 3. Calculate the average bill in table 2.
SELECT AVG(total) AS Average_Bill
FROM bills
WHERE table_id = 2;

-- 4. Calculate the minimal, maximal, and average amount of seats of tables in Blue room. Name the corresponding columns as Min, Max, Avg.
SELECT 
    MIN(seats) AS Min, 
    MAX(seats) AS Max, 
    AVG(seats) AS Avg
FROM tables
WHERE room = 'Blue';

-- 5. Count how many distinct tables are served by waiters 004 and 002.
SELECT COUNT(DISTINCT table_id) AS Distinct_Tables
FROM bills
WHERE waiter_id IN ('004', '002');