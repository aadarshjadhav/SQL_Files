use fkdemo;
create table suppliers(
supplier_id INT 
auto_increment,
name varchar(255) not null,
phone varchar(15) not null unique,
address varchar(255) not null,
primary key (supplier_id),
constraint
uc_name_address unique
(name,address)
);

select* from suppliers;
insert into suppliers(name,phone,address) values('Aadarsh',8086508065,'Pune');
insert into suppliers(name,phone,address) values('Aadarsh',8086508065,'Mumbai');
insert into suppliers(name,phone,address) values('Rohit',8086508067,'Mumbai');
-- insert into suppliers(name,phone,address) values('',,'');

