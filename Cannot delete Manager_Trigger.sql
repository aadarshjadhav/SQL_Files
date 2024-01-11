CREATE DEFINER=`root`@`localhost` TRIGGER `employees_BEFORE_DELETE` BEFORE DELETE ON `employees` FOR EACH ROW BEGIN

if 
	old.employee_id in (select manager_id from employees) then
    signal sqlstate '46000' set message_text= 'Invalid delete criteria.Cannot delete Manager';
end if;
END