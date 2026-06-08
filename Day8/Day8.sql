use studentdb;

SELECT * FROM employees;

-- 1. Find employees with salary greater than the average salary (subquery).
SELECT id,
       emp_name,
       salary
FROM employees
WHERE salary >
      (SELECT AVG(salary)
       FROM employees);
       
-- 2. Select products with price higher than the cheapest order.
SELECT id,
       name,
       unit_price
FROM products
WHERE unit_price >
      (SELECT MIN(unit_price)
       FROM products);
SELECT * FROM products;

-- 3. Use a subquery inside WHERE to fetch customers with orders.

SELECT customer_id,
       customer_name
FROM customers
WHERE customer_id IN
      (SELECT customer_id
       FROM orders);
       
-- 4. Use a subquery inside SELECT to show order counts.

SELECT customer_id,
       customer_name,
       (SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c;

-- 5. Use a correlated subquery to find the highest salary per department.
SELECT emp_id,
       emp_name,
       salary,
       dept_id
FROM employees e1
WHERE salary =
      (
        SELECT MAX(salary)
        FROM employees e2
        WHERE e1.dept_id = e2.dept_id
      );

-- 6. Use a Subquery to Check if a Product Exists
SELECT EXISTS
(
    SELECT 1
    FROM products
    WHERE id = 3
) AS product_exists;

select * from products;
