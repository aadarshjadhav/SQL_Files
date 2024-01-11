CREATE DEFINER=`root`@`localhost` PROCEDURE `powerOfNumber` ()
BEGIN

declare num, power int;
declare base int;

set num=5;
set base =3;
set power=1;

loop_label:loop
	if base=0 then 
    leave loop_label;
    end if;
    set power=power*num;
    set base = base -1;
iterate loop_label;
end loop;
select power;

End

