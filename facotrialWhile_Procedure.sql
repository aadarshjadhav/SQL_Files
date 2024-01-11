CREATE PROCEDURE `facotrialWhile` ()

BEGIN
declare fact int;
declare i,N int;
set fact=1;
set i=1;
set N=5;
while(i<=N)
do
	set fact=fact*i;
    set i=i+1;
end while;

select n as Number, fact as Factorial;

END
