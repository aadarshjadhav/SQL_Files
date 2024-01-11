/*
2> Create a procedure that takes an employee ID and a new salary as parameters and updates the salary of the specified employee based on some criteria.
*/

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSalary`(in pemp_id int, in psal decimal)
BEGIN

update employees
set salary=psal
where employee_id=pemp_id;

END