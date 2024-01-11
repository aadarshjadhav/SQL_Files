use hospitaldb2;

call getPatientNameAge(2,@p_name,@p_age);
select @p_name as name,@p_age as age;
