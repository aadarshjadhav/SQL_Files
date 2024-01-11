use testcoursedb;

-- BASIC SELECT STATEMENT
-- 1. Write a query to display the names (first_name, last_name) using alias name
-- “First Name", "Last Name"

select first_name as 'First Name', last_name as 'Last Name'
from employees;

-- 2. Write a query to get unique department ID from employee table.

select distinct department_id
from employees;

-- 3.Write a query to get all employee details from the employee table order by first name, descending

select* 
from employees
order by first_name desc;

-- 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 12% of salary).

select first_name, last_name, salary *0.12 as 'PF'
from employees;

-- 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary

select employee_id, first_name, last_name, salary
from employees
order by salary asc;

-- 6. Write a query to get the total salaries payable to employees.
select sum(salary)
from employees;

-- 7. Write a query to get the maximum and minimum salary from employees table.
select max(salary), min(salary)
from employees;

-- 8. Write a query to get the average salary and number of employees in the employees table.

select avg(salary), count(employee_id)
from employees;

-- 9. Write a query to get the number of employees working with the company

select count(employee_id)
from employees;

-- 10. Write a query to get the number of jobs available in the employees table.

select distinct(job_id) 
from employees;

-- 11. Write a query get all first name from employees table in upper case

select upper(first_name)
from employees;

-- 12. Write a query to get the first 3 characters of first name from employees table

select substring(first_name, 1,3) as first_3_letters
from employees;

-- or 

select left(first_name,3) as first_3_letters
from employees;

-- 13.Write a query to calculate 171*214+625.

select sum((171*214)+625) as Sum;

-- 14.Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.

select concat(first_name, last_name) as 'Full Name'
from employees;

-- 15. Write a query to get first name from employees table after removing white spaces from both side.

select trim(first_name) as 'trimmed_first_name'
from employees;

-- 16. Write a query to get the length of the employee names (first_name,last_name) from employees table.

select length (concat(first_name, last_name)) as 'length of full name' 
from employees;

-- 17.Write a query to check if the first_name fields of the employees table contains numbers.
select first_name 
from employees
where first_name like '%1%';

-- or
select first_name 
from employees
where first_name regexp'[0-9]';


-- 18. Write a query to select first 10 records from a table.
select* 
from employees
limit 10;

-- 19. Write a query to get monthly salary (round 2 decimal places) of each and every employee
-- Note : Assume the salary field provides the 'annual salary' information

select  round((salary/12),2) as 'monthly_salary' 
from employees;

