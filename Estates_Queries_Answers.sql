use estatesdb;

-- 3.	Display Ownernames whose payment date is same as M.S.Shah
select distinct OwnerName
from Owners o inner join Flats f on o.Oid=f.Oid
inner join Maintenance m on m.FlatNo = f.FlatNo
where OwnerName not like '%D.Y.Patil%' and Paymentdate in (	select Paymentdate
						from Maintenance m inner join Flats f on m.FlatNo=f.FlatNo
						inner join Owners o on f.Oid=o.Oid
						where o.OwnerName Like '%D.Y.Patil%');


4.	Delete all records from Flats where nobody stays and with flat area 900 sq.ft.		[1]

-- 5.	Show ownername,balance and flatno whose maintainance is paid partially	

select OwnerName,m.FlatNo, balance
from Owners o inner join Flats f on o.Oid = f.Oid
inner join Maintenance m on f.FlatNo = m.FlatNo
where balance !=0;

-- 6.	If Occupiedstatus in Flats table gets updated to ‘Tenent’ then maintenance 
-- amount  for that flat should be increased by 2000. 
-- Write a trigger  for the same.

