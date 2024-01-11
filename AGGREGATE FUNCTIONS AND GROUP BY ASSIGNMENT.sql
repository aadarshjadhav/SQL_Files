use testcoursedb;

-- 1.Write a query to list the number of jobs available in the employees table.

select count(distinct(job_title)) 
from jobs;

-- 2.Write a query to get the total salaries payable to employees.
select sum(salary)
from employees;

-- 3.Write a query to get the minimum salary from employees table
select min(salary)
from employees;

-- 4.Write a query to get the maximum salary of an employee working as a Programmer
select max_salary
from jobs
where job_title='Programmer';

-- 5.Write a query to get the average salary and number of employees working 
-- the department 90.
select  department_id ,avg(salary), count(employee_id)
from employees
where department_id=90;

-- 6.Write a query to get the highest, lowest, sum, and average salary of all employees.
select max(salary) as 'maximum_salary', min(salary), sum(salary), avg(salary)
from employees;

-- 7.Write a query to get the number of employees with the same job.

select job_id,sum(employee_id)
from employees
group by job_id;

-- 8. Write a query to get the difference between the highest and lowest salary
select max(salary)-min(salary)
from employees;

-- 9.Write a query to find the manager ID and the salary of the lowest-paid
-- employee for that manager.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select manager_id, min(salary), first_name
from employees
group by manager_id;

-- 10. Write a query to get the department ID and the total salary payable
-- in each department.

select department_id, sum(salary)
from employees
group by department_id;

-- 11.Write a query to get the average salary for each job ID excluding
-- programmer

select job_id,avg(salary)
from employees
where job_id !='IT_PROG';

-- 12.Write a query to get the total salary, maximum, minimum, average
-- salary of employees (job ID wise), for department ID 90 only.

select job_id,sum(salary), max(salary), min(salary), avg(salary), department_id
from employees
where department_id=90
group by job_id;


