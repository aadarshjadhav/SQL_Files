CREATE DEFINER=`root`@`localhost` TRIGGER `employees_BEFORE_INSERT_Salary` BEFORE INSERT ON `employees` FOR EACH ROW BEGIN
 IF new.salary < 5000 then		-- OR salary IS NULL THEN
        SET new.salary = 5000;
    END IF;

END