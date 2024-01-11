use testcoursedb;

/*
1. Write a query to find the addresses (location_id, street_address, city,
state_province, country_name) of all the departments.
*/

select l.location_id, street_address, city, state_province
from departments d
left join locations l on d.location_id= l.location_id
left join countries c on l.country_id = c.country_id;

/*
2.Write a query to find the names (first_name, last name), department ID
and name of all the employees.
*/

select first_name, last_name
from employees e
inner join departments d
where e.department_id= d.department_id;

/*
3.Find the names (first_name, last_name), job, department number(ID), and
department name of the employees who work in London.
*/

select first_name, last_name, job_title, d.department_id, d.department_name
from employees e inner join jobs j on e.job_id= j.job_id
left join departments d on e.department_id = d.department_id
left join locations l on l.location_id = d.location_id
where city='London';

select * from employees
where department_id = 40;
/*
4.Write a query to find the employee id, name (last_name) along with their
manager_id, manager name (last_name).
*/

select e.employee_id,e.first_name, e.last_name, e.manager_id, concat(m.first_name, m.last_name) as Manager
from employees e inner join employees m
on e.manager_id= m.employee_id;

select * from employees;

/*
5.. Find the names (first_name, last_name) and hire date of the employees
who were hired after 'Jones'.
*/
select first_name, last_name, hire_date
from employees
where hire_date in (
					select hire_date
					from employees
					where hire_date> (select hire_date
										from employees
										where first_name like 'Jones' or last_name like 'Jones')
										);


select e.first_name, e.last_name, e.hire_date, e1.hire_date
from employees e 
inner join employees e1 on e1.last_name like binary 'J%'
where e1.hire_date < e.hire_date;

-- e1 stores entire list of employees whose names start with J
-- and e1.hire_date stores entrie list of hire_dates of those 
-- employees whose names start with Letter J

/*
6.Write a query to get the department name and number of employees in the
department.
*/

select d.department_name,count(employee_id)
from departments d inner join employees e on d.department_id = e.department_id
group by d.department_name;


/*
7.Find the employee ID, job title, number of days between ending date and
starting date for all jobs in department 90 from job history.
*/

select e.employee_id, j.job_title, datediff(jh.end_date,jh.start_date), jh.end_date, jh.start_date
from employees e 
inner join jobs j using(job_id)
inner join job_history jh using(job_id)
where jh.department_id = 90;


SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

/*
8.Write a query to display the department ID, department name and
manager first name.
*/

select d.department_id, department_name, first_name
from departments d inner join employees e on d.manager_id= e.manager_id;

select * from departments;
select * from employees;

/*
9.Write a query to display the department name, manager name, and city
*/
select * from departments;
select * from employees;

select department_name, concat(first_name, ' ', last_name) as 'Manager Name', city
from departments d left join employees e on d.manager_id =e.employee_id
inner join locations l using(location_id);

select * from locations;


/*
10.Write a query to display the job title and average salary of
employees.
*/

select job_title, avg(salary)
from jobs j inner join employees e on j.job_id= e.job_id
group by job_title;

/*
11.Display job title, employee name, and the difference between salary
of the employee and minimum salary for the job
*/

select job_title, first_name, last_name, salary-min_salary as Diff_Salary
from employees e inner join jobs using(job_id);

/*
12. Write a query to display the job history that were done by any
employee who is currently drawing more than 10000 of salary
*/

select first_name, salary
from job_history jh left join  employees e using(employee_id)
where salary>10000;

/*
13.Write a query to display department name, name (first_name,
last_name), hire date, salary of the manager for all managers whose
experience is more than 15 years.
*/

select department_name, first_name, last_name, hire_date, salary
from departments d inner join employees e on d.manager_id= e.employee_id
where datediff(curdate(), hire_date)/365>36.5;

