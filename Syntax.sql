use testdb;
create table customer(cid int primary key, cnanme varchar(30), addr varchar(50), email varchar(30));

insert into customer  values(1, 'Aadarsh', 'pune', 'aadarsh@gmail.com');
insert into customer values(2, 'Maorti', 'mumbai','maroti@gmail.com');
select* from customer;
insert into customer values(3, 'Rohit', 'solapur','rohit@gmail.com');
insert into customer values(4, 'Jayraj', 'pune','jayraj@gmail.com');

select * from customer where cid>2;
select * from customer where cnanme like 'R%';

select *from customer order by cnanme;
select *from customer order by cnanme desc;

