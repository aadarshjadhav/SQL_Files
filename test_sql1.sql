use test_sql;

create table theater (
theater_id int  primary key,
theater_name varchar(20) not null,
address varchar(20) not null,
rating int not null);

insert into theater values(1,'kusum theater','pune',8);
insert into theater values(2,'gandhrao theater','nashike',7);
insert into theater values(3,'golable theater','nanded',6);
insert into theater values(4,'star theater','beed',9);
insert into theater values(5,'moon theater','duhle',5);

create table movie (
movie_id int  primary key,
movie_name varchar(20) not null,
director varchar(20) not null,
producer varchar(20)not null);

insert into movie values(101,'uri','prakash raj','krann johar');
insert into movie values(102,'3 idiots','raju hirani','amir khan');
insert into movie values(103,'ddlj','sanjay leela','subhas gahe');
insert into movie values(104,'rockstar','ekta kapoor','kapoor production');
insert into movie values(105,'ranjan','prakash raj','dhanush');

create table customer(
cust_id int  primary key,
cust_name varchar(20) not null,
address varchar(20) not null,
birth_date date not null,
creaditcard_no int not null );

insert into customer values(201,'maroti','nanded','1996-02-24',899456123);
insert into customer values(202,'sunish','mumbai','1996-02-02',85956123);
insert into customer values(203,'abhisheek','mp','2000-11-11',749456123);
insert into customer values(204,'prashant','nager','2000-02-23',899456123);
insert into customer values(205,'mayuri','nanded','2002-10-14',899456123);
insert into customer values(206,'maroti','pune','1996-02-24',899456123);
insert into customer values(207,'yogesh','pune','1996-05-26',98437347);
insert into customer values(208,'pallavi','mumbai','1996-10-11',895456123);

create table screeninginfo(
movie_id int not null,
theatre_id int not null,
ticket_price int not null,
constraint uniscreen  unique  (movie_id,theatre_id),
constraint movie_const foreign key(movie_id) references  movie (movie_id),
constraint theater_const foreign key(theatre_id) references  theater(theater_id));




insert into screeninginfo values(101,1,250);
insert into screeninginfo values(102,2,550);
insert into screeninginfo values(101,2,350);
insert into screeninginfo values(103,3,250);
insert into screeninginfo values(104,4,450);
insert into screeninginfo values(105,5,550);
insert into screeninginfo values(102,5,150);
insert into screeninginfo values(103,1,550);
insert into screeninginfo values(101,3,750);
insert into screeninginfo values(102,3,250);





create table bookings(
booking_id int  primary key,
booking_date date not null,
cust_id int not null,
movie_id int not null,
theatre_id int not null,
no_of_tickets_booked int not null,
constraint fkcust foreign key (cust_id) references customer(cust_id),
constraint fkmovie foreign key(movie_id) references  movie (movie_id),
constraint fkthearter foreign key(theatre_id) references  theater  (theater_id));



insert into bookings values(501,'2023-02-03',201,101,1,5);
insert into bookings values(502,'2023-02-04',201,102,2,4);
insert into bookings values(503,'2023-02-03',202,101,2,7);
insert into bookings values(504,'2020-03-05',203,103,3,5);
insert into bookings values(505,'2021-05-06',204,104,4,3);
insert into bookings values(506,'2022-04-07',205,105,5,4);
insert into bookings values(507,'2023-09-03',204,102,3,5);
insert into bookings values(508,'2023-04-03',202,104,2,7);
insert into bookings values(509,'2022-03-03',205,105,5,7);
 
