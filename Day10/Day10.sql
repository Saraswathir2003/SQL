use studentdb;
-- 1. Create a Stored Procedure to Insert a New Employee
SELECT * FROM employees;
DELIMITER //

CREATE PROCEDURE AddEmployee(
    IN id INT,
    IN emp_name VARCHAR(50),
    IN salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO employees(id, emp_name, salary)
    VALUES(id, name, salary);
END //

DELIMITER ;
CALL AddEmployee(101, 'Ravi', 45000);
-- 2. Create a Stored Procedure to Update Salary Based on ID
DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN p_id INT,
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE employees
    SET salary = p_salary
    WHERE id = p_id;
END //

DELIMITER ;

CALL UpdateSalary(101, 50000);

-- 3. Trigger to Update Stock When a New Order is Placed
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    stock INT
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT
);

DELIMITER //

CREATE TRIGGER trg_update_stock
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;
-- 4. Trigger to Prevent Deleting the Last Admin User

CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    role VARCHAR(20)
);

DELIMITER //

CREATE TRIGGER trg_prevent_last_admin
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    IF OLD.role = 'Admin' AND
       (SELECT COUNT(*) FROM users WHERE role='Admin') = 1
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete the last admin user';
    END IF;
END //

DELIMITER ;

-- 5. Call a Stored Procedure to Fetch Employees

DELIMITER //

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT * FROM employees;
END //

DELIMITER ;
CALL GetEmployees();

-- 6. Drop a Procedure and Trigger

DROP PROCEDURE IF EXISTS AddEmployee;

DROP PROCEDURE IF EXISTS UpdateSalary;

DROP PROCEDURE IF EXISTS GetEmployees;

DROP TRIGGER IF EXISTS trg_update_stock;

DROP TRIGGER IF EXISTS trg_prevent_last_admin;

SHOW PROCEDURE STATUS;