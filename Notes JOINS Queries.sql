-- JOINS FROM NOTES
use classicmodels;

-- INNER JOIN
select o.ordernumber, productcode, quantityordered, priceeach, orderdate, status, customernumber
from orders o
inner join orderdetails 
on orderdetails.ordernumber=o.ordernumber;

select * 
from orderdetails;

select * 
from orders;

use testcoursedb;
-- LEFT JOIN
select c.country_id, c.country_name, l.country_id, city
from countries c
left join locations l on c.country_id=l.country_id;


use testcoursedb;
select r.region_name,
		c.country_name,
        l.street_address,
        l.city
		from 
        regions r
        left join countries c on c.region_id = r.region_id
        left join locations l on l.country_id = c.country_id
        where c.country_id IN('US','UK', 'CN');
        -- In the Above query, countries comes before locations in left join sequence
		-- So, countries are already filtered out and has only US, UK and CN.
        
select *
from regions;
select *
from countries;
select *
from locations;


-- SELF JOIN

select e.employee_id, concat(e.first_name, ' ', e.last_name ) as 'Employee', m.manager_id as
'ManagerNumber', concat(m.first_name, ' ', m.last_name) as Manager
from employees e
inner join employees m
on m.manager_id=e.employee_id;

use testcoursedb;
select * from employees;

use classicmodels;
-- RIGHT JOIN
select employeeNumber,customernumber
from customers
right join employees
on salesRepEmployeeNumber = employeeNumber;
/* where customerNumber is null
order by
EmployeeNumber;
*/

