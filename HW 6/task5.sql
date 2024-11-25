--Which waiters have taken 2 or more bills on a single date?
--List the waiter names and surnames, the dates and the number of bills they have taken.
   SELECT waiter_name, date, COUNT(bill_id) AS bill_count
   FROM bills
   GROUP BY waiter_name, date
   HAVING COUNT(bill_id) >= 2;
   

--List the rooms with tables that can server more than 6 people and how many of such tables they have.
SELECT room_name, COUNT(bill_id) AS bill_count
   FROM tables
   JOIN bills ON tables.table_id = bills.table_id
   WHERE tables.capacity > 6
   GROUP BY room_name;
   

--List the names of the rooms and the total amount of bills in each room
   SELECT headwaiter_name, SUM(total_bill) AS total_amount
   FROM waiters
   JOIN bills ON waiters.waiter_id = bills.waiter_id
   GROUP BY headwaiter_name;
   

--List the headwaiter's name and surname and the total bill amount their waiters have taken. Order the list by total bill amount, largest first.
   SELECT customer_name
   FROM bills
   GROUP BY customer_name
   HAVING AVG(total_amount) > 400;
   

--List any customers who have spent more than £400 on average.
  SELECT waiter_name, COUNT(DISTINCT date) AS days_count
   FROM bills
   GROUP BY waiter_name
   HAVING COUNT(bill_id) >= 3;

--Which waiters have taken 3 or more bills on a single date?
--List the waiter names, surnames, and the number of bills they have taken.
SELECT waiter_name, COUNT(DISTINCT date) AS number_of_days
FROM bills
GROUP BY waiter_name
HAVING COUNT(bill_id) >= 3;