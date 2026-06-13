use studentdb;
-- 1. Create a table sales (id, product, amount).
CREATE TABLE sales (
    id INT PRIMARY KEY,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO sales (id, product, amount) VALUES
(1, 'Laptop', 50000),
(2, 'Mobile', 30000),
(3, 'Tablet', 30000),
(4, 'Monitor', 20000),
(5, 'Keyboard', 10000);

-- 2. Use ROW_NUMBER() to rank sales by amount
SELECT
    id,
    product,
    amount,
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
FROM sales;

-- 3. Use RANK() to assign ranks with ties

SELECT
    id,
    product,
    amount,
    RANK() OVER (ORDER BY amount DESC) AS rank_num
FROM sales;

-- 4. Use DENSE_RANK() to avoid gaps in ranking
SELECT
    id,
    product,
    amount,
    DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank_num
FROM sales;

-- 5. Use SUM() OVER() to calculate running totals
SELECT
    id,
    product,
    amount,
    SUM(amount) OVER (
        ORDER BY id
    ) AS running_total
FROM sales;
 
-- 6. Create a CTE to fetch sales above average

WITH AvgSales AS (
    SELECT AVG(amount) AS avg_amount
    FROM sales
)
SELECT
    s.id,
    s.product,
    s.amount
FROM sales s
JOIN AvgSales a
ON s.amount > a.avg_amount;

