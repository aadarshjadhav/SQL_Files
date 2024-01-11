CREATE PROCEDURE `getCountOfEmployee` (out empcnt int)
BEGIN
select count(*) into empcnt from employees;
END
