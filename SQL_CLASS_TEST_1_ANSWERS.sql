/*SQL_CLASS TEST-1*/
use sql_test_1_class_work;
/*
1.Show names of theatres where ‘pallavi’ has booked tickets. 
*/
select theatre_name
from theatre
where theatre_id in(select distinct(theatre_id)
					from bookings
					where cust_id in (
										select cust_id
										from customer
										where cust_name Like 'sunish'));


/*
2.Show names of theatre where movie ‘Uri’ is screening
*/

select theatre_name
from theatre
where theatre_id in (
					select theatre_id
					from screeninginfo
					where movie_id in(
										select movie_id
										from movie
										where movie_name Like 'Uri'));

/*
3.Show names of theatre which has done maximum business
*/

SET sql_mode=(select  replace(@@sql_mode,'Only_full_group_by',''));
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


select theatre_name
from theatre
where theatre_id = (
					select theatre_id
					from bookings
					group by theatre_id
					order by sum(no_of_tickets_booked) desc limit 1
);

	
select s.theatre_id, s.movie_id, ticket_price, sum(no_of_tickets_booked), (sum(no_of_tickets_booked)*ticket_price)
from Screeninginfo s, BOOKIngs b
where s.movie_id=b.movie_id and s.theatre_id=b.theatre_id
group by s.movie_id;
/*
4.Show names of movies and business done by that movie
*/
-- Me result is showing 3000 price, but it should be 3700 for movie 101
select sum(no_of_tickets_booked)*ticket_price, b.movie_id, ticket_price, t.theatre_name
from bookings b, screeninginfo s, theatre t
where b.movie_id = s.movie_id and b.theatre_id = s.theatre_id and t.theatre_id= b.theatre_id
group by s.movie_id;


/*
5.Write a query to add city field in theatre table between address and rating
*/
alter table theatre add city varchar(100) after address;

-- Doubt: cannot add a new column before an existing column;

/*
6.Write a query to add field totalchargesint(10) in bookings table.
*/
alter table bookings add totalcharges int(10);
-- Doubt: warnings

/*
7.Update field totalcharges. 
	Totalcharges are no of tickets booked 
    multiplied by ticket_price for that movie and theatre.
*/
-- Doubt: How does sql knows at which row it should put the calculated values inside bookings table?
update bookings b
set totalcharges=(b.no_of_tickets_booked *
(select ticket_price from screeninginfo s where b.movie_id = s.movie_id and  b.theatre_id=s.theatre_id));



select* 
from bookings;

/*
8.Update totalcharges to give discount off 20% to all those who have their birthday on the booking date when they have booked tickets. 
*/

Update bookings b 
set totalcharges= totalcharges- (totalcharges*0.20)
where b.cust_id in( select b.cust_id from customer c
					where day(c.birth_date)= day(b.booking_date) and  month(c.birth_date)=month(b.booking_date)
                    and b.cust_id=c.cust_id
                    );

select *
from bookings;

/*
9.Delete all bookings done by ‘yogesh’
*/

/*
10.Show names of movie name , totalbusiness done by it of movies directed by ‘kirtiraj’
*/

select ticket_price, no_of_tickets_booked, b.movie_id, sum(no_of_tickets_booked *ticket_price)
from bookings b, screeninginfo s
where b.movie_id= s.movie_id and b.theatre_id and b.movie_id in(
																select movie_id from movie where  director='prakash raj')
			
group by b.movie_id;

select movie_id, movie_name
from movie where director='prakash raj';

/*Another method to do above query*/
select 
	m.movie_name, sum(b.no_of_tickets_booked *s.ticket_price) as total_business
from 
	movie m, bookings b, screeninginfo s
where 
	m.movie_id =b.movie_id and b.movie_id=s.movie_id and b.theatre_id = s.theatre_id
	and 
	m.director= 'prakash raj'
group by
	m.movie_id, m.movie_name;