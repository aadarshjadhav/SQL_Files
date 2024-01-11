use serivice_requestdb;

-- 3.Write a query to add column email_id(varchar(50)) to customer table. 

alter table Customer add email_id varchar(100) not null after cust_name;

-- 4.Show customer name, service description, charges of requests 
-- served by employees older than age 30.

select cust_name, service_desc, charges, age
from employee e inner join service_request sr on e.emp_id=sr.emp_id
inner join customer c on sr.cust_id = c.cust_id
where e.age>30;

-- 5.Write a query to select customer names for whom employee 
-- ‘Amit’ has not served any request

select cust_name, e.emp_name
from customer c 
left join service_request sr on c.cust_id=sr.cust_id
inner join employee e on sr.emp_id = e.emp_id
where e.emp_name not like 'Amit';

-- 6.Show employee name, total charges of all the requests served by ‘Amit’. 
-- Consider only ‘closed’ requests.
-- Or Consider only 'Open' requests
select e.emp_name, ss.desp, SUM(charges)
from employee e inner join service_request sr
on e.emp_id=sr.emp_id
inner join service_status ss 
on ss.status_id=sr.status_id
where e.emp_name like 'Amit'and ss.desp = 'OPEN'
GROUP BY e.Emp_name ;

-- 7.Show service description, customer name of request having 
-- third highest charges.

select service_desc, cust_name, charges
from service_request sr inner join customer c
on sr.cust_id=c.Cust_Id
order by charges desc
limit 1 offset 2;

-- 8.Show name of all employees who have same rating as employee ‘Amit’ 

select emp_name, emp_rating 
from employee 
where emp_rating =( select emp_rating
				from employee 
                where emp_name='Amit');

-- 9.Find the total charges earned by each employee. 
-- Sort by maximum charges at top. 
-- Consider ‘closed’ or ''IN_PROGRESS'' requests only.

select emp_name, sum(charges) as Total_Charges
from employee e left join service_request sr
on e.emp_id = sr.emp_id
inner join service_status ss on sr.status_id = ss.status_Id
where ss.desp = 'IN_PROGRESS'
group by emp_name
order by Total_Charges desc;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


-- 10.Delete all requests served by ‘Kumar’ as he has left the company.

-- Doubt: why do we need to put alias name of the 
-- table inseated of table_name itself?

delete sr
from service_request sr inner join employee e
on e.emp_id= sr.emp_id
where e.emp_name like 'Ishwar';

-- Below code shows error, since youu can't use table name itself and use alias.
delete service_request
from service_request sr inner join employee e
on e.emp_id= sr.emp_id
where e.emp_name like 'Abhishek';


-- 11.Delete all cancelled requests from request table.
delete sr
from service_request sr inner join service_status ss
on sr.status_id=ss.status_id
where ss.desp like 'CANCELLED';

-- 12.Add 200 to the charges of service_request raised by customer ‘Sunil’.

UPDATE service_request sr
INNER JOIN customer AS c ON sr.cust_id = c.cust_id
SET sr.charges = sr.charges + 200
WHERE c.cust_name LIKE 'Anil';


/*

15.	Create a trigger which is fired when Service_request is updated. 
The trigger should update emp_rating in employee table(emp_rating is 
average of all the service_requests ‘closed’ by employee).

*/





-- 16.	Create a stored procedure which returns the year-wise, 
-- month-wise addition of total_charges sorted by year in 
-- descending and then month in ascending 

call GetYearMonthTotalCharges();

-- 19.Write single query to create SerReqCopy table 
-- which will have same structure and data of service_request table.

create table SerReqCopy as select * from service_request;

Select * from SerReqCopy;
drop table SerReqCopy;

-- 20.Create index so that retrieval of records is
-- 	faster when retrieved based on status id
/* Douobt: INDEXing Doesn't work on primary key and foreign keys?*/
create index charges on service_request(charges);

select * from 
service_request 
where charges=150;

explain select * from 
service_request 
where charges=150;




