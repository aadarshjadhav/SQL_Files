-- 21.Create a view which will show customer name, service desc , 
-- employee name , service charges , 
-- status desc of requests which are not closed.
CREATE VIEW OpenServiceRequests
(
	cust_name,
    service_desc,
    emp_name,
    charges,
    desp
) AS

	select cust_name, 
			service_desc, 
			emp_name, 
			charges, 
			desp
	from 
		customer c 
        inner join service_request sr
        on c.cust_id=sr.cust_id
        inner join employee e 
        on e.emp_id = sr.emp_id
        inner join service_status ss 
        on ss.status_id = sr.status_id
        where desp not like 'CLOSED';