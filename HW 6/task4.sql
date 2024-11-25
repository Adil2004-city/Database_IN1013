--List the names of customers who spent more than 450.00 on a single bill on occasions when 'Charles' was their Headwaiter.
   SELECT DISTINCT c.customer_name
   FROM customers c
   JOIN bills b ON c.customer_id = b.customer_id
   JOIN headwaiters h ON b.headwaiter_id = h.headwaiter_id
   WHERE b.amount > 450.00 AND h.name = 'Charles';
   

--A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have to deal with the matter?
SELECT w.name
   FROM waiters w
   JOIN bills b ON w.waiter_id = b.waiter_id
   WHERE b.customer_name = 'Nerida' AND b.visit_date = '2016-01-11';
   

--What are the names of customers with the smallest bill?
SELECT DISTINCT c.customer_name
   FROM customers c
   JOIN bills b ON c.customer_id = b.customer_id
   WHERE b.amount = (SELECT MIN(amount) FROM bills);

--List the names of any waiters who have not taken any bills.
SELECT c.customer_name
   FROM customers c
   LEFT JOIN bills b ON c.customer_id = b.customer_id
   WHERE b.bill_id IS NULL;
   

   

--Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.
SELECT c.customer_name, b.amount, r.room_name
   FROM customers c
   JOIN bills b ON c.customer_id = b.customer_id
   JOIN rooms r ON b.room_id = r.room_id
   WHERE b.amount = (SELECT MAX(amount) FROM bills);