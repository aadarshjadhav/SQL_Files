use classicmodels;

-- Equality Operator in Where
select * 
from employees 
where jobTitle="Sales Rep";

-- find the employess whose jobtitle is Sales Rep AND officeCode is 1
select firstname, lastname, jobtitle, officeCode 
from employees 
where jobTitle="Sales Rep" and officeCode=1;

-- find the employess whose jobtitle is Sales Rep 0R officeCode is 1
select firstname, lastname, jobtitle, officeCode 
from employees 
where jobTitle="Sales Rep" or officeCode=1;

--  find the employess whose officeCode is 1 BETWEEN 3
select firstname, lastname, officeCode
from employees
where officeCode between 1 and 3;

-- FIND employees whose lastname ends with son
select firstname, lastname 
from employees
where lastname like '%son';

-- Find firstname that has 5 character: we use 5 times Underscore
select firstname, lastname 
from employees
where firstname like '_____';

-- firstname starts with A alphabets
select firstname, lastname 
from employees
where firstname like 'a%';


-- find all the employees who are located in offices with officeCode 1,2,3: IN Operator
select firstname, lastname, officeCode
from employees 
where officeCode in(1,2,3);

-- find all the employees who are not reportinng to anyone: IS NULL Operator
select firstName, lastname, reportsto
from employees
where reportsTo is null;

-- find all employees who are not sales representative: comparison operators: <> or !=
select firstName, lastname, jobtitle
from employees
where jobtitle !='Sales Rep';

-- find all employeses whose officecode is greater than 5

select firstName, lastname, officecode
from employees
where officecode > 5;

-- find all employees whose office code less than or equal to 4: <=
select firstName, lastname, officecode
from employees
where officecode <=4; 