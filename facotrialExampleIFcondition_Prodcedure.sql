CREATE DEFINER=`root`@`localhost` PROCEDURE `facotrialExample`()
BEGIN

declare num, fact int;
set num=5;
set fact=1;
	loop_label: loop
		if num=0 then
			leave loop_label;
		End if;
	set fact=fact*num;
    set num=num-1;
    Iterate loop_label;
    End loop;
 select fact;
 
END