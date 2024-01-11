CREATE definer= 'root'@'localhost' PROCEDURE `getCustomerLevel` (IN pCustomerNumber INT,
									OUT pCustomerLevel varchar(20))
BEGIN
declare credit decimal default 0;
select creditlimit
into credit 
from Customers
where CustomerNumber = pCustomerNumber;

if credit>50000 then
	set pCustomerLevel = 'Platinum';
else if credit <=50000 and credit>10000 then
	set pCustomerLevel= 'Gold';
else
	set pCustomerLevel = 'Silver';
END IF;

end
