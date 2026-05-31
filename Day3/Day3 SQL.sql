use studentdb;
-- 1.Create a product table
create table products(
     id int primary key,
     name varchar(60),
     price int
     );
-- 2.Add a new column stock

alter table products     
add stock int;

-- 3. Rename column price to unit_price
alter table products
rename column price to unit_price;
-- 4. Insert 5 products
insert into products
values(1,"Laptop",500000,10),
	(2,"Mobile",10000,20),
    (3,"TV",300000,5),
    (4,"Washing Machine",600000,15),
    (5,"AC",40000,25);
    
-- 5. Update stock of one product
update products
set stock = 30
where id =3;

-- 6. Delete one product
delete from products
where id=5;
    
select* from products
    
