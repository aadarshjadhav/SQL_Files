use sqltest1;

create table Theatre(theatre_id int auto_increment primary key, theatre_name varchar(100) not null, address varchar(100) not null, rating double not null);

insert into Theatre values(1,'Inox', 'Margarpatta City, Pune', 3.5 );
insert into Theatre values(2,'Pvr', 'Koregaon, Pune', 4.5 );
insert into Theatre values(3,'Pvr', 'Swargate City, Pune', 4.5 );
insert into Theatre values(4,'Inox', 'Hadapsar City, Pune', 3.2 );

select* from Theatre;
drop table Theatre;

create table Movie(movie_id int auto_increment primary key, movie_name varchar(100) not null, director varchar(100) not null, producer varchar(100) not null);

insert into Movie values(1, 'Jawan', 'Shudarshan', 'Sharukh');
insert into Movie values(2, 'Tiger 3', 'Rohit', 'Sachin');
insert into Movie values(3, 'Animal', 'Jayraj', 'Jayu');
insert into Movie values(4, 'Pathaan', 'Abhishek', 'Utkarsha');

select* from Movie;

create table Customer(cust_id int auto_increment primary key, cust_name varchar(100) not null, address varchar(100) not null, birth_date date, creditcardno long);

insert into Customer values(1, 'Abhijay', 'House no1, Warje', '1999-04-20', 1111111111 );
insert into Customer values(2, 'Abhijeet', 'House no2, Wakad', '1998-07-10', 2222222222 );
insert into Customer values(3, 'Daya', 'House no3, Kharadi', '2000-06-15', 3333333333 );
insert into Customer values(4, 'Pradyuman', 'House no4, Hinjewadi', '1984-02-01', 4444444444 );

select* from Customer;

-- constraint fkauthor foreign key(author_id) references author(author_id),

create table Bookings(

bookingid int auto_increment primary key, booking_date date, 
cust_id int, constraint fkcust_id foreign key(cust_id) references Customer(cust_id),



);

