use classicmodels;

/*
Find out all the employees who work in the officies located in USA.
*/

select firstname, lastname, officeCode
from employees
where officecode in(select officecode from offices where country= 'USA');

/*
	Query to find out customer who has highest payment?
*/

select customerName,contactFirstname
from customers
where customernumber =(select customernumber 
						from payments
						where amount=(select max(amount) 
                        from payments));
   
/*
	Find customers whose payments are greater than avg payments.
*/   
   
select customerName,contactFirstname
from customers
where customernumber in (select customernumber
from payments
where amount> (select avg(amount) from payments));

/*
Find customer who have not placed any orders
*/
select customernumber 
from customers 
where customernumber not in(select distinct customernumber 
							from orders);


/*
	Find maximum, minimum and average number of items in sales order?
*/

select max(items), min(items), floor(avg (items))
from (select ordernumber, count(ordernumber) as items
		from orderdetails
        group by ordernumber) as lineitems;
			
       
/*
	Select the products, whose buyprice are greater than 
    avg buyprice of all the product in each productlne
*/
-- This is correct, it returns 55 rows
select productcode, productLine
from products p1
where buyprice >(select avg(buyprice)  
				from products
				where productline=p1.productline);
			
-- This is wrong, it returns 54 rows
select productcode, productLine,buyprice
from products p1
where buyprice >(select avg(buyprice)  
				from products);

select productline, avg(buyprice)
from products
group by productline;
