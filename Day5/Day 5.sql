use store;

create table orders(
     id int primary key,
     product_name varchar(50),
	 quantity int,
     price decimal(10,2)
    );
    
-- 1. Count total orders
    
select count(*) as order_count from orders;
    
-- 2. Find the SUM of all order prices
    
select sum(price) as total_prices from orders;
    
-- 3. Find the AVG order price
    
select avg(price) as avg_price from orders;
    
-- 4. Group orders by product_name and show total sales
    
select product_name,sum(quantity * price) as total_sales from orders group by product_name;
    
-- 5. Find the MAX and MIN price
    
select max(price) as highest_price, min(price) as lowest_price from orders;
    
-- 6. Sort grouped data by total sales descending
select product_name,sum(quantity * price) as total_sales from orders group by product_name order by total_sales desc;