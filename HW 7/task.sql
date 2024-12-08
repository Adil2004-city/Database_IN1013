-- 1. Create a view named 'samsBills' to display the bills taken by Sam Pitt.
-- This view includes columns: first_name, surname, bill_date, cust_name, and bill_total,
-- and filters the data to show only the records where the waiter's name is Sam Pitt.
CREATE VIEW samsBills AS
SELECT 
    first_name,
    surname,
    bill_date,
    cust_name,
    bill_total
FROM 
    bills
WHERE 
    first_name = 'Sam' AND surname = 'Pitt';

-- 2. Query the 'samsBills' view to show only bills with a total greater than £400.
-- This will filter out bills less than or equal to £400.
SELECT *
FROM samsBills
WHERE bill_total > 400;

-- 3. Create a view named 'roomTotals' to calculate the total bill amounts for each room.
-- The view groups data by room_name and sums the bill totals for each group.
-- The result includes columns: room_name and total_sum.
CREATE VIEW roomTotals AS
SELECT 
    room_name,
    SUM(bill_total) AS total_sum
FROM 
    bills
GROUP BY 
    room_name;

-- 4. Create a view named 'teamTotals' to calculate the total bill amounts for each team.
-- The head waiter's name (first_name and surname) is concatenated into one column called 'headwaiter_name',
-- and the total bill amounts are summed for each head waiter.
CREATE VIEW teamTotals AS
SELECT 
    CONCAT(first_name, ' ', surname) AS headwaiter_name,
    SUM(bill_total) AS total_sum
FROM 
    bills
GROUP BY 
    first_name, surname;
