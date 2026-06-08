use studentdb;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    amount DECIMAL(10,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers
VALUES
(1,'Saraswathi','Chennai'),
(2,'Priya','Pune'),
(3,'Shakthi','Delhi'),
(4,'Sneha','Mumbai'),
(5,'Ramya','Bangalore');

INSERT INTO orders
VALUES
(101,'2026-06-01',1500,1),
(102,'2026-06-02',2500,2),
(103,'2026-06-03',1800,1),
(104,'2026-06-04',3000,3),
(105,'2026-06-05',2200,4);

SELECT * FROM customers;
SELECT * FROM ORDERS;

SELECT c.customer_name,
       o.order_id,
       o.order_date,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_name,
       o.order_id,
       o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


CREATE TABLE Departments3 (
    DeptID VARCHAR(5) PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DeptID VARCHAR(5),
    FOREIGN KEY (DeptID)
    REFERENCES Departments(DeptID)
);


drop table orders;
drop table customers;
drop table departments3;
drop table students;
