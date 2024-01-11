CREATE DEFINER=`root`@`localhost` TRIGGER `employees_BEFORE_INSERT` BEFORE INSERT ON `employees` FOR EACH ROW BEGIN
if New.salary<65000 then
signal sqlstate '45000' set message_text= 
'Invalid salary criteria.Does not match with our requirements';
end if;


END