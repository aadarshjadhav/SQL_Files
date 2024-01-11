use testcoursedb;

update employees
set
salary=salary *1.05
where 
employee_id=100;

-- Below is the statement to check if the creiteria matches or not!!!
insert into employees values(401,'Donn', 'Bonn', 'donn@gmail.com', '515.123.8000', '1987-10-14', 'AC_ACCOUNT', 33999,0.00,205,110);
-- Correct statement below, salary>65000
insert into employees values(401,'Donn', 'Bonn', 'donn@gmail.com', '515.123.8000', '1987-10-14', 'AC_ACCOUNT', 66000,0.00,205,110);



select *from salary_changes;

DESC EMPLOYEES;
select *from employees;