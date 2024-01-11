-- SIMPLE SELECT STATEMENTS
use testcoursedb;

-- 1.Write a query to display the names (first_name, last_name) and salary 
-- for all employees whose salary is not in the range $10,000 through $15,000.

select first_name, last_name, salary
from employees
where salary between 10000 and 15000;

-- 2.Write a query to display the names (first_name, last_name) and
-- department ID of all employees in departments 30 or 100 in ascending
-- alphabetical order by first_name

select first_name, last_name, department_id
from employees
where DEPARTMENT_ID =30 or DEPARTMENT_ID= 100 
order by first_name;

-- 3. Write a query to display the names (first_name, last_name) and salary for
-- all employees whose salary is not in the range $10,000 through $15,000
-- and are in department 30 or 100.

select first_name, last_name, salary, department_id
from employees
where salary not between 10000 and 15000 and department_id in(30,100)  ;

-- or

select first_name, last_name, salary, department_id
from employees
where (salary<10000 or salary> 15000) and department_id in(30,100);


-- 4. Write a query to display the names (first_name, last_name) and hire date
-- for all employees who were hired in 1987

select first_name, last_name, hire_date
from employees
where hire_date 
like '%1987%';

-- 5. Write a query to display the first_name of all employees who have both "b" and "c" in their first name

select first_name
from employees
where first_name like binary'%b%' and first_name like binary'%c%';

-- 6.Write a query to display the last name, job, and salary for all employees
-- whose job ID is that of a it_PROG or a  JOB ID ST_CLERK, and whose salary
-- is not equal to $4,500, $10,000, or $15,000.

SELECT last_name, job_id, salary
from employees
where (job_id='IT_PROG' or job_id='st_clerk') and (salary !=4500 or salary !=10000 or salary !=15000);

-- 7. Write a query to display the last names of employees whose names have
-- exactly 6 characters

select last_name
from employees
where length(last_name)=6;

-- 8.Write a query to display the last names of employees having 'e' as the third character.

select last_name
from employees
where last_name like '__e%';

-- 9.Write a query to display the jobs/designations available in the employees table

select distinct (job_id)
from employees;


-- 10. Write a query to display the names (first_name, last_name), salary 
-- and PF (15% of salary) of all employees.

select first_name, last_name, salary, round((salary*0.15),2) as PF
from employees;
