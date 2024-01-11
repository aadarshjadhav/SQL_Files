use classicmodels;

call getCountOfEmployee(@e);
select @e as Count;


call Hello_World_Procedure(@str_value);
select @str_value as string_value;

call getCustomerLevel(270, @customerDetail);
select @customerDetail;

call getDepartmentNameLocation(20,@dname,@dlocation);
select @dname,@dlocation;

call getDepartmentNameLocation(20,@dconcat);
select @dconcat;

call facotrialExample();
call  facotrialWhile();
call getNum(1076);
SET GLOBAL log_bin_trust_function_creators = 1;

use classicmodels;
set @somvar= getNum(1076);
select @somvar;
select * from employees;

call classicmodels.powerOfNumber(7, 3, @result);
select @result;
