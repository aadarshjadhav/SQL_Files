use testcoursedb;
/*
1.Write a query to find the names (first_name, last_name) and the salaries of
the employees who have a higher salary than the employee whose
last_name='Bull'.
*/
select first_name, last_name, salary
from employees 
where salary>(select  salary
from employees
where last_name='Bull');


/*
2. Write a query to find the names (first_name, last_name) of all employees
who works in the IT department.
*/

-- Here below, even if you use '=' instead of IN, it is showing correct answer
select first_name, last_name, department_id
from employees
where department_id in (select department_id
from departments
where department_name='IT');

/*
3. Write a query to find the names (first_name, last_name) of the employees who
have a manager and work for a department based in the United States.
Hint : Write single-row and multiple-row subqueries
*/

select first_name, last_name,manager_id, department_id
from employees
where manager_id in (select manager_id
from departments 
where manager_id !=0 and location_id in (select location_id
						from locations
						where country_id='US'));
                        
/*
3. Write a query to find the names (first_name, last_name) of the employees
who are managers.
*/

select first_name,last_name,employee_id, manager_id
from employees
where employee_id in (select manager_id 
from employees);

/* 
4. Write a query to find the names (first_name, last_name), the salary of the
employees whose salary is greater than the average salary
*/

select first_name, last_name,salary
from employees
where salary>(select avg(salary)
from employees);

/*
5. Write a query to find the names (first_name, last_name), the salary of the
employees whose salary is equal to the minimum salary for their job
grade.
*/

select first_name, last_name, job_id
from employees e1
where salary= (
select min_salary
from jobs as j1
where e1.job_id=j1.job_id );


/*
6.Write a query to find the names (first_name, last_name), the salary of the
employees who earn more than the average salary and who works in any
of the IT departments
*/

select first_name, last_name, salary, department_id
from employees e1
where salary>( select avg(salary)
				from employees) and e1.department_id in (select department_id
															from departments
															where department_name like 'IT%');




-- Below 2 code are written to verify the above query's answer
/*
select first_name, last_name, department_id, salary
from employees 
where department_id= 60 or  department_id= 210 or  department_id= 230;

select avg(salary)
from employees;
*/
-- -- -- -- -- -- -- -- -- -- -- -- --
select department_id, department_name 
from departments
where department_name like 'IT%';


-- Below code can also work, but left() is uneesecary                
select department_id, department_name 
from departments
where left(department_name,2) like 'IT%';

/*
7.Write a query to find the names (first_name, last_name), the salary of the
employees who earn more than Mr. Bell.
*/
select first_name, last_name, salary
from employees
where salary>(	select salary
				from employees 
				where last_name like 'Bell'
);

-- Only one Bell and that is Mrs.Sarah Bell
-- After the query below, there is no employee who has first name Bell
select first_name, last_name,salary
from employees 
order by first_name ;

/*
8.Write a query to find the names (first_name, last_name), the salary of the
employees who earn the same salary as the minimum salary for all
departments.
*/
-- THIS QUERY MIGHT BE WRONG!!!
select first_name, last_name, salary
from employees
where salary in (select min(salary)
				from employees);
                
/*
9.Write a query to find the names (first_name, last_name), the salary of the
employees whose salary greater than the average salary of all
departments
*/

select first_name, last_name, salary
from employees
where salary> all (select avg(salary)
				from employees
                group by department_id);
                
                
/* 10. Write a query to find the names (first_name, last_name) and salary
of the employees who earn a salary that is higher than the salary of all the
Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of
the lowest to highest.              
*/

-- 4200 is max salary of a SH_CLERK employee

select first_name, last_name, salary
from employees
where salary >all(select MAX(salary)
				from employees
				where job_id='SH_CLERK'
);


/* 11.Write a query to find the names (first_name, last_name) of the
employees who are not supervisors.
*/
-- BLANK OUTPUT

select employee_id, first_name, last_name
from employees
where employee_id not in(select manager_id
							from employees);

select employee_id, manager_id from employees;

/*
12.Write a query to display the employee ID, first name, last names,
and department names of all employees.
*/

select first_name, last_name,(select department_name 
								from departments as d1 
								where e1.department_id=d1.department_id)
from employees e1;

/*
13.Write a query to display the employee ID, first name, last names,
salary of all employees whose salary is above average for their
departments.
*/

select first_name, last_name, salary, department_id
from employees e1
where salary> (select avg(salary)
				from employees
                where department_id= e1.department_id);
                
/*
14.Write a query to fetch even numbered records from employees
table.
*/    
-- (Hint: We need PL/SQL)

select employee_id,phone_number,job_id,salary, manager_id, department_id
from employees
where employee_id%2=0 or (phone_number%2=0 and job_id and salary %2=0 and manager_id%2=0 and department_id%2=0) ;  

/*
15.Write a query to find the 5th maximum salary in the employees
table
*/

select distinct(salary)
from employees
order by salary desc
limit 1 offset 4;
         
/*
16.Write a query to find the 4th minimum salary in the employees table
*/

select distinct (salary)
from employees
order by salary asc
limit 1 offset 4;

/*
17. Write a query to select last 10 records from a table.
*/


select * 
from (	select *
		from employees
		order by employee_id desc
		limit 10) 
        as sub_query
order by employee_id asc;


/*
18.Write a query to list department number, name for all the
departments in which there are no employees in the department
*/

select department_id, department_name
from departments
where department_id not in (select department_id
							from employees);
                            
/*
19.Write a query to get 3 maximum salaries.
*/
	select salary 
    from employees
    order by salary desc
    limit 3;
/*
20.Write a query to get 3 minimum salaries.
*/
	select salary 
    from employees
    order by salary asc
    limit 3;

/*
21.Write a query to get nth max salaries of employees.
*/

/*
22.Write a query to get nth max salaries of employees.
*/
                            