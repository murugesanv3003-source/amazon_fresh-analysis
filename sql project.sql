create database amazon;
select* from amazon.products;
-- task 3--
select* from amazon.customers
where city="bakerview";
select * from amazon.products
where category="fruits";

-- task 4--
show create table amazon.customers;
use amazon;
alter table customers modify age int not null;

set sql_safe_updates = 0;
update amazon.customers set age =19 where age <=18;
alter table amazon.customers add constraint chk_age check (age>18);

alter table amazon.customers add constraint uq_CustomerID unique( CustomerID);

-- task 5--
select * from amazon.products;
insert into amazon.products (ProductID,ProductName,Category,SubCategory,PricePerUnit,StockQuantity,SupplierID) values
("223sdesa15sderd1qwa342ad","horlicks","healthy","sub-healthdrink-3","280","200","dd007aswas1212axsdcdssazxs111"),
("ebe2a2ab-74f0431b-8e23-78da321sxdc232","boost","healthdrink","sub-healthy-4","230","230","8u731c59-d04546e9-9fb7-791efre23143wsd"),
("ab86eb25-7147-4e12-bf51-4a31fredfswe3214532","milo","healthdrink","sub-healthy--5","250","220","e3a583d1-fa62-47f2-8493-a84cdet5463734");
-- task6--
update amazon.products set StockQuantity =300 where productID= ("223sdesa15sderd1qwa342ad");
-- task 7--
select* from amazon.products where StockQuantity = 300;

-- task 8 --
alter table amazon.reviews 
add constraint chk_rating check 
(rating between 1 and 5);

alter table amazon.customers change PrimeMember PrimeMember varchar(10);
alter table amazon.customers alter column PrimeMember set default ("NO");

-- task 9--
select* from amazon.orders;
select* from amazon.orders where OrderDate > "2024-01-01";

select ProductID,avg(Rating) as avgRating from reviews
group by ProductID having avg(Rating) >4 ;

select ProductID, sum(UnitPrice) as totalsales from order_details
group by ProductID order by totalsales desc ;

-- task 10--
select CustomerID,sum(orderamount) as totalspend from orders
group by CustomerID having totalspend >5000 order by totalspend desc;

-- task 11--
-- 1
select a.orderID, sum(Quantity*UnitPrice) as totalrevenue from amazon.orders as a 
inner join amazon.order_details as b on a.Orderid=b.OrderID group by a.OrderID;
-- 3
select supplierID,max(StockQuantity)   from amazon.products
group by SupplierID,stockQuantity order by max(StockQuantity) desc limit 1;
-- 2
select customerID,OrderDate from amazon.orders
group by CustomerID,OrderDate order by OrderDate desc limit 3; 

-- task 12
create table amazon.Category(ProductID int,CategoryName varchar(100), SubCategoryName varchar(100));
alter table amazon.category add CategoryID int;
alter table amazon.products add CategoryID int;

-- task 13
select a.CustomerID,a.Name from amazon.customers as a
left join amazon.orders as b
on a.CustomerID=b.CustomerID where b.CustomerID is null;

select p.ProductID,p.ProductName,sum(od.Quantity*od.UnitPrice) as salesrevenue from amazon.products as p
join amazon.Order_details od on p.ProductID=od.ProductID group by p.ProductID,ProductName order by salesrevenue desc limit 3;

-- task 14
select p.Category,sum(od.Quantity) as totalordered from amazon.products as p
join amazon.order_details od on p.productID=od.ProductID group by p.Category order by totalordered desc limit 3;

select City,count(*) as PrimeMember from amazon.customers
where PrimeMember="yes" group by city order by PrimeMember desc;



