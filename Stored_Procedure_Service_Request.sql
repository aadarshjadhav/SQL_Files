CREATE DEFINER=`root`@`localhost` PROCEDURE `GetYearMonthTotalCharges`()
BEGIN
select 
	year(request_open_date),
    month(request_open_date),
    sum(charges) Total_charges

from 
	service_request
where 
	request_open_date is not null
group by 
	year(request_open_date), month(request_open_date)
order by
	year(request_open_date) desc, month(request_open_date) asc;

END