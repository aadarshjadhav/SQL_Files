use bikedb;



-- Question 4
-- Number of compliants

select count(p.model_id) as 'Number of Complaints'from
purchase p inner join model m on p.model_id=m.model_id 
where p.rating_id = 5 and p.model_id in (select model_id
						from model 
						where model_name like "%Bajaj%");
                        
                        
-- Question 5
select first_name
from customer c inner join purchase p on c.customer_id =p.customer_id
where p.rating_id = null;



-- Question 6 Delete records

delete from purchase
where rating_id=5;
                        

-- Question 7 Update 

Update purchase
set rating_id = 1
where customer_id = (select customer_id from customer
						where first_name like '%AVAY%');
                        
-- Question -8 Reduce Cost
update model
set cost= cost-(cost/10)
where model_id in (select model_id 
					from purchase 
					where rating_id = (select rating_id
										from feedback_rating
                                        where rating like 'Bad'));
                                        
                                        
-- Question -1 Stored Procedure for Customer
call getCustomerName('C101',@cusname);
select @cusname as name; 



                    


                        


