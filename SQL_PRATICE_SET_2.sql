use testcoursedb;

/*
1>Write a query to select employee with the highest salary
*/

select e.first_name, e.last_name, max(e.salary)
from employees e inner join employees e2 on e.salary = (select max(salary)
from employees); 

/*
2>Select employee with the second highest salary
*/

select e.first_name, e.last_name, max(e.salary)
from employees e inner join employees e2 on e.salary <(select max(salary)
from employees); 


/*
3>Write a query to select employees and their corresponding managers and their salaries
*/

select concat(e.first_name, ' ' ,e.last_name) as Employees, e.salary,concat(m.first_name,' ', m.last_name) as Managers, m.salary
from employees e inner join employees m on e.employee_id=m.manager_id;


/*
4>Write a query to show count of employees under each manager in descending order
*/

select m.first_name as Manager, count(e.employee_id)
from employees e inner join employees m on e.employee_id=m.manager_id
group by m.manager_id;

-- Below another method
select e2.first_name, count(e1.employee_id) as 'NoOFEmp'
from employees e1
right join employees e2 on e1.employee_id=e2.manager_id
group by e1.employee_id
order by NoOfEmp desc;

/*
5>Find the count of employees in each department
*/

select department_name, count(employee_id)
from departments d left join employees e on d.department_id = e.department_id
group by department_name;

/*
6>Get the count of employees hired year wise
*/

select year(e2.hire_date) as year,count(e.employee_id)
from employees e inner join employees e2 on e.employee_id= e2.employee_id
group by year;

/*
7>Select the employees whose first_name contains “an”
*/

select first_name
from employees
where first_name like '%an%';

/*
8>Find the employees who joined in August, 1994.
*/

select first_name
from employees 
where month(hire_date)= 08 and year(hire_date) =1994;

/*
9>Write an SQL query to display employees who earn more than the average salary in that company
*/

select e.first_name
from employees e
where e.salary> ( select avg(e2.salary)
				from employees e2);

/*
10>Find the maximum salary from each department.
*/
select max(salary), department_name
from employees e inner join departments d on e.department_id = d.department_id
group by department_name;

/*
11>Write a query to make deptid foreign key in employee table.
*/
-- NOT DONE!!!!
alter table employees add constraint fk_dept_id foreign key (department_id) references departments(department_id);

/*
12>	Write a query to insert multiple rows in both tables using one insert command.
*/

/*
13.Write a query to show employee names and department names for each employee. 
*/
select first_name, department_name
from employees e inner join departments d on e.department_id= d.department_id;


/*
14>Show name of city where ‘Ramesh’ is working.
*/

select city
from locations l inner join departments d on d.location_id= l.location_id
inner join employees e on e.department_id= d.department_id
where first_name like 'Alberto';

/*
15>Write a query to show name of city and number of employees working in that city.
*/

select city, count(e.employee_id)
from locations l inner join departments d on d.location_id= l.location_id
inner join employees e on e.department_id= d.department_id
group by city;

/*
16>Show all employees who are working in HR department and having salary less than 5000
*/

-- no employee having salary less than 5000
select first_name
from employees e inner join departments d on e.department_id= d.department_id
where department_name like 'Human Resources' and salary>5000;

/*
17>Show employee having highest salary. 
*/
select e.first_name, e.last_name, max(e.salary)
from employees e inner join employees e2 on e.salary = (select max(salary)
from employees); 

/*
18>	Show name of department along with number of employees working in that city.
*/
-- Done already

/*
19>Show city wise number of employees
*/
-- Done already

/*
20>Show city name and total salary of employees working in that city.
*/
select city, sum(salary)
from locations l inner join departments d on d.location_id= l.location_id
inner join employees e on e.department_id= d.department_id
group by city;
