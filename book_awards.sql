use assignments;

-- author id ,author name , ph no , email , address, city

-- author created
create table author
(
	author_id int auto_increment primary key,
    author_name varchar(100) not null,
    author_phone int not null,
    author_email varchar(100) not null,
    author_address varchar(100) not null,
    author_city varchar(100) not null,
    constraint un_auth_email_address unique (author_email,author_address)
    
);

-- Book id , book name , author id , price

create table book
(
	book_id int auto_increment primary key,
    book_name varchar(100) not null,
    author_id int, constraint fkauthor foreign key(author_id) references author(author_id),
    book_price int not null
    
);

select* from book;
desc book;

-- award type id , award name , award price
create table awards
(
	award_type_id int auto_increment primary key,
    award_name varchar(100) not null,
    award_price int not null
);

-- award id , award type id, author id , book id , year
create table main_awards
(
	award_id int primary key,
    award_type_id int, constraint fkaward_type_id foreign key(award_type_id) references awards(award_type_id),
    author_id int, constraint fkauthor_id foreign key(author_id) references author(author_id),
    book_id int, constraint fkbook_id foreign key(book_id) references book(book_id),
    year int not null
    
);

select* from author;
select* from book;
select* from awards;

-- inserting values into Author

-- author id ,author name , ph no , email , address, city
insert into author() values(1,'Shudarshan',12345678, 'sud@gmail.com', 'Karve nager','Pune');
insert into author() values(2,'Aadarsh',223456568, 'aj@gmail.com', 'Garve nager','Pune');
insert into author() values(3,'Maroti',14454345, 'maro@gmail.com', 'Ambhe nager','Mumbai');
insert into author() values(4,'Ishwar',5555555, 'ishwar@gmail.com', 'Hadapsar nager','Pataleshwar');
select* from author;

-- inserting valueus for book
-- Book id , book name , author id , price

insert into book() values(101,'Dev Das', 1,250);
insert into book() values(102,'Dev Das 2', 2,300);
insert into book() values(103,'Good Way', 3,500);
insert into book() values(104,'Bible', 4,50);
select* from book;

-- award type id , award name , award price
insert into awards() values(1,'Best Debut Book', 30000);
insert into awards() values(2,'Book of the year', 50000);
insert into awards() values(3,'People Choice', 35000);
insert into awards() values(4,'Critics Choice', 60000);
select* from awards;

-- award id , award type id, author id , book id , year
insert into main_awards() values(1,1,1,101,2015);
insert into main_awards() values(2,2,2,102,2017);
insert into main_awards() values(3,3,3,103,2018);
insert into main_awards() values(4,4,4,104,2020);

select* from main_awards;
select* from author;
select* from book;
select* from awards;


