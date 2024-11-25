-- 

List the names of the waiters who have served the customer Tanya Singh. 
   SELECT DISTINCT waiter_name 
 FROM waiters 
JOIN orders ON waiters.waiter_id = orders.waiter_id 
JOIN customers ON orders.customer_id = customers.customer_id 
 WHERE customers.customer_name = 'Tanya Singh'; 

--On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room? The output date should be in the format they are stored. 
 SELECT DISTINCT order_date FROM orders 
JOIN headwaiters ON orders.headwaiter_id = headwaiters.headwaiter_id 
 WHERE headwaiters.headwaiter_name = 'Charles' 
AND room_name = 'Green room' 
AND order_date BETWEEN '2016-02-01' AND '2016-02-29'; 

-- 

List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball. 
SELECT customers.customer_name, SUM(orders.amount_spent) AS total_spent, waiters.waiter_name 
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id 
JOIN waiters ON orders.waiter_id = waiters.waiter_id 
GROUP BY customers.customer_name, waiters.waiter_name 
ORDER BY total_spent DESC; 

List the customer name, the amount they spent and the waiter’s name for all bills. Order the list by the amount spent, highest bill first. 
SELECT waiters.first_name, waiters.last_name 
FROM waiters 
JOIN orders ON waiters.waiter_id = orders.waiter_id 
WHERE orders.room_name = 'Blue room' AND orders.order_id = 160312; 

List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017. 

 
--List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017. 
SELECT h.headwaiter_name, h.headwaiter_surname 
FROM headwaiters h 
JOIN orders o ON h.headwaiter_id = o.headwaiter_id 
WHERE o.room_name = 'Green room' 
GROUP BY h.headwaiter_name, h.headwaiter_surname 
HAVING COUNT(o.order_id) > 5; 

--List the names and surnames of the waiters in the team (including the headwaiter) that served Blue room on 160312. 
SELECT SUM(o.amount_spent) AS total_amount_spent 
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id 
WHERE o.order_date BETWEEN '2016-03-01' AND '2016-03-31'; 