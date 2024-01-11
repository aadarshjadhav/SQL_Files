use classicmodels;

-- distinct Qurries
select distinct state from customers;

select distinct city,state
from customers
where state is not null;

select distinct status
from orders;

-- Group BY
select status, count(*) 
from orders
group by status;

-- Limit Clause
select customerNumber, customerName, creditLimit
from customers
order by creditlimit desc
limit 5,10;

-- Agregate Functions

select avg(buyPrice) 
from products;

select productline,avg(buyprice)
from products
group by productline;

select count(productCode) as 'No of Products'
from products;


select productline,count(productline) as 'No of products'
from products
group by productline
order by 'No of products' desc;


-- Sum
select sum(MSRP)
from products;

-- group By
select productCode,sum(priceEach*quantityordered)
from orderdetails
group by productCode;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select productCode,sum(priceEach*quantityordered)
from orderdetails
group by productCode;

select city, count(customerNumber)
from customers
group by city;

select year(orderdate) as year, count(ordernumber)
from orders
group by year;

-- Maximum
select max(buyprice)
from products;

select productline, buyPrice
from products
order by buyPrice desc;

-- Product by Lowest Price
select productline, buyPrice
from products
order by buyPrice asc;