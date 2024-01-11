use testdb;
create table employees(employee_id int primary key, first_name varchar(100), last_name varchar(100), birth_date date,salary double, manager_id int);

insert into employees values(1, 'Aadarsh', 'J', '1998-07-22',20000, 4);
insert into employees values(2, 'Adarsh', 'Jon', '1997-05-17',27000, 4);
insert into employees values(3, 'Jayraj', 'K', '1999-03-27',31000, 4);
insert into employees values(4, 'Rohit', 'K', '1995-10-12',41000, null);
insert into employees values(5, 'Sudharshan', 'S','1992-09-30' ,51000, 8);
insert into employees values(6, 'Maroti', 'Tate', '1990-2-28',60000, 8);
insert into employees values(7, 'Yogesh', 'Kawalae','1991-01-29' ,70000, 8);
insert into employees values(8, 'Abhishek', 'Pise', '1994-04-16',55000, null);

drop table employees;


-- Below statement is to check if the trigger for age is working or not
insert into employees values(9, 'Suraj', 'Lokade', '2008-04-16',2000, 8);

insert into employees values(10, 'Utkarsha', 'Narhe', '2002-04-18',2000, 8);
insert into employees values(12, 'Kratos', 'Narhe', '2000-04-18',2000, 8);

insert into employees values(0,'Nathan', 'WildLife', '2000-04-18',68000, 8);

insert into employees values(0,'Ethan', 'Hunt', '2000-04-29',70000, 8);

delete from employees where employee_id =8;
select* from employees;