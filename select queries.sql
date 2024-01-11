use classicmodels;

select lastName
from employees;

select lastName,firstName,jobTitle
from employees;

-- selecet all the columns from employees
select* 
from employees;

-- or
select employeeNumber, lastname,firstname,extension,email,officecode,reportsTo,jobtitle
from employees;

-- interesting experiment
select 1+1;

-- current date time
select now();

-- concat
select concat('Aadarsh ',':',' Jadhav');

-- Alias of column name
select concat('Aadarsh ',':',' Jadhav') as FullName;

select concat(firstname,' ',lastname) as fullname from employees;

-- or
select concat(firstname,' ',lastname) as 'full name' from employees;

-- OrderBY
desc customers;

-- Order by: sort customers ascending order of last name of customer
select contactlastname,contactfirstname
from customers order by contactlastname;

-- Order by: sort customers ascending order of first name and descending order by lastname of customer
	select contactlastname, contactfirstname
	from customers 
	order by contactlastname desc, contactfirstname asc;
    
-- Decribe Order Details
desc orderdetails;    

-- You can apply order by on Alias columns as well
select productCode, ordernumber, quantityordered*priceEach as 'TotalPrice'
from orderdetails
order by TotalPrice desc;

-- FIELD
select field ('c', 'a', 'b', 'c');

select ordernumber, status
from orders
order by  field(status, 'In Process', 'On Hold','Cancelled', 'Resovled', 'Disputed', 'Shipped');

-- ORDER BY, to check null
select firstname, lastname, reportsto from employees order by reportsto;

-- Use DESC to make the null at the last
select firstname, lastname, reportsto from employees order by reportsto desc;