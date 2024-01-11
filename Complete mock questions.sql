use testcoursedb;

select * from employees;

select e1.manager_id,count(e.employee_id) as 'No. Of Employees'  -- :Doubt:View not working
from employees e inner join employees e1
on e.employee_id=e1.manager_id
group by e1.manager_id 
order by count(e.employee_id) desc; -- Give different output for: 'No. Of Employees'


SELECT e1.manager_id, COUNT(e.employee_id) AS 'No. Of Employees'
FROM employees e
INNER JOIN employees e1 ON e.employee_id = e1.manager_id
GROUP BY e1.manager_id
ORDER BY "No. Of Employees" DESC;

drop table tableA;
create table tableA (employee_id int unique key, employee_name varchar(100));
insert into tableA values(1,'Aadarsh');
insert into tableA values(2,'Marothi');
insert into tableA values(3, 'Sudharshan');
insert into tableA values(null,'Suraj');

select * from tableA;

create table tableB (department int primary key, employee_id int, constraint foreign key (employee_id) references tableA(employee_id));
insert into tableB values(101,2);
insert into tableB values(102,null);
drop table tableB;

-- Ans: TableB cannot refer the null unique key from tableA 
-- Can we specify employee column in table as unique and that employee as a foreign key in department table?
-- Check constraint?
-- Normalization?
-- Can we have in,out,inout in functions?
-- types of triggers
-- syntax for trigers
-- serialzation
-- jdbc code
-- statement interface?
-- purpose of interface?
-- statement methods?
-- iindexs
-- by table in mysql?
-- difference between sub query and corelated sub query?
-- Difference between statement and preparestatement?







