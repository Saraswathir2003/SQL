use store;

create table orders(
     id int primary key,
     product_name varchar(50),
	 quantity int,
     price decimal(10,2)
    );
     
-- 2. Insert 5 orders

insert into orders (id,product_name,quantity, price)
values (1, 'Apple ', 5, 120.00),
(2, 'Banana', 2, 80.00),
(3, 'Almonds', 3, 450.00),
(4, 'Milk', 1, 60.00),
(5, 'Watermelon', 4, 350.00);

-- 3. Select all orders where quantity > 2

select * from orders where quantity > 2;

-- 4. Select orders where price is between 100 and 500

select * from orders where price between 100 and 500;

-- 5. Fetch orders with product_name starting with 'A'

select * from orders where product_name like 'A%';

-- 6. Fetch orders sorted by quantity in descending order

select * from orders order by quantity desc;

desc orders;
select * from orders;
