use testcoursedb;

-- Personel queries(H.W)
/*
1. Find the names of employees who work in Hiroshima
*/

select first_name,last_name
from employees 
where department_id in (
						select department_id
						from departments
						where location_id in (select location_id
												from locations
												where city like 'Toronto'));

                        
select * from locations;
select * from departments;


/*
2. Find employees who are having clerk related jobs
*/

select first_name, last_name
from employees
where job_id in (
					select job_id
					from jobs
					where job_title like '%clerk%'
                );

/*
3.Find the number of employees working in each city
*/

select city, count(employee_id)
from locations l, employees e, departments d
where d.department_id= e.department_id and l.location_id= d.location_id
group by city;

