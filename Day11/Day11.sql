use studentdb;
select * from employees;

-- Write a query to fetch employees whose salary is higher than the department average.
-- 1. Employees whose salary is higher than the department average
SELECT id, emp_name, salary, department
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department = department
);

-- 2. Customers who placed more than 2 ordersorders
SELECT * FROM orders;
SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 2
);

-- 3. Highest-priced product using a subquery in WHERE

SELECT price FROM orders WHERE price=( SELECT MAX(price) FROM orders);

-- 4. Total order value per customer using a subquery

SELECT c.customer_id,
       c.customer_name,
       (
           SELECT SUM(quantity * price)
           FROM orders o
           WHERE o.customer_id = c.customer_id
       ) AS total_order_value
FROM orders c;

-- 5. Employees earning more than their manager (Correlated Subquery)
SELECT id, emp_name, salary
FROM employees e
WHERE salary >
(
    SELECT m.salary
    FROM employees m
    WHERE m.id = e.manager_id
);
-- 6. Check if a product exists in the orders table using EXISTS
SELECT *
FROM products p
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.id = p.id
);
select * from products;