use testcoursedb;

/* MySQL string
1. Write a query to get the job_id and related employee's id.
Partial output of the query :
job_id Employees ID
AC_ACCOUNT 206
AC_MGR 205
AD_ASST 200
AD_PRES 100
AD_VP 101 ,102
FI_ACCOUNT 110 ,113 ,111 ,109 ,112 */

select job_id, group_concat(employee_id)
from employees
group by job_id;

/* 2. Write a query to update the portion of the phone_number in the employees
table, within the phone number the substring '124' will be replaced by '999'.
Sample table: employees */ 

update employees 
set phone_number= replace( phone_number,'124', '999')
where phone_number like '%124%';

/*3. Write a query to get the details of the employees where the length of the first
name greater than or equal to 8.
Sample table: employees */

select *
from employees
where length(first_name)>=8;


/* 
 4.Write a query to display leading zeros before maximum and minimum salary.
	Sample table: jobs
*/

select  LPAD(MAX(SALARY),11,'0')
from employees ;

/* 
5. Write a query to append '@example.com' to email field.
Sample table: employees
Sample Output :
EMAIL
--------------------
SKING@example.com
NKOCHHAR@example.com
LDEHAAN@example.com
--------------------
*/

select concat(email, '@gmail.com')
from employees;

/*
6. Write a query to get the employee id, first name and hire month.
Sample table: employees
*/
select employee_id, first_name, month(hire_date)
from employees;

/*
7. Write a query to get the employee id, email id (discard the last three
characters).
Sample table: employees
*/
-- , SUBSTR(str,pos,len):

select employee_id, substring(email,1, length(email)-3)
from employees;

/*
8. Write a query to find all employees where first names are in upper case.
Sample table: employees
*/

select first_name
from employees
where first_name=binary upper(first_name);


/*
9. Write a query to extract the last 4 character of phone numbers.
Sample table: employees
*/

select right(phone_number,4)
from employees;

/*
10. Write a query to get the last word of the street address.
Sample table: locations
*/

select reverse(substring_index(reverse(street_address), ' ', 1))
from locations;

/*
11. Write a query to get the locations that have minimum street length.
	MySQL string
	Sample table: locations
*/

select street_address
from locations
where  length(street_address)=(select min(length(street_address)) from locations);

/* 12. Write a query to display the first word from those job titles which contains
	more than one word.
	Sample table: jobs
*/

select substring_index(job_title, ' ', 1)
from jobs
where REGEXP_INSTR(job_title, ' ') >= 1;



/*
13. Write a query to display the length of first name for employees where last
name contain character 'c' after 2nd position.
Sample table: employees
*/

--  REGEXP_INSTR('dog cat dog', 'dog') 

select length(first_name), last_name
from employees
where REGEXP_INSTR(last_name, 'c')=2;


/*
14. Write a query that displays the first name and the length of the first name for
all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column
an appropriate label. Sort the results by the employees' first names.
Sample table: employees
*/

select first_name, length(first_name) as 'Name Length'
from employees
where left(first_name,1)= 'A' or left(first_name,1)= 'J' or left(first_name,1)= 'M'
order by first_name;

/*
15. Write a query to display the first name and salary for all employees. Format
the salary to be 10 characters long, left-padded with the $ symbol. Label the
column SALARY.
Sample table: employees
*/

select first_name, lpad(salary, 10, '$')
from employees;


/*
16. Write a query to display the first eight characters of the employees' first
names and indicate the amounts of their salaries with '$' sign. Each '$' sign
signifies a thousand dollars. Sort the data in descending order of salary.
Sample table: employees
*/

select left(first_name,8), repeat('$',salary/1000), salary
from employees;



/*
17.Write a query to display the employees with their code, first name, last name
and hire date who hired either on seventh day of any month or seventh month in
any year
*/

select employee_id, first_name, last_name, hire_date
from employees
where day(hire_date)=7 or month(hire_date)=7;
