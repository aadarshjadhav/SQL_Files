use fkdemo;
create table category(
catid int auto_increment primary key,
catname varchar(100) not null
);

create table product(
pid int auto_increment primary key,
pname varchar(100),
catid int, constraint fkcategory foreign key(catid) references category(catid));

insert into category(catname) values('smartphone');
insert into category(catname) values('smartwatch');

select* from category;

insert into product(pname, catid) values('ApplePhone',1);
insert into product(pname, catid) values('AppleWatch',3); -- error, if i try to add a category which doesnt exists, fooreign key contraint fails


-- updating category to 100 from 1
update category
set catid=100
where catid=1;

-- Drop Product
drop table product;

-- using cascade option
create table product(
pid int auto_increment primary key,
pname varchar(100) not null,
catid int, constraint fkcategory foreign key(catid) references category(catid)
on delete cascade
on update cascade);



-- insert record again
insert into product(pname, catid) values('Applewatch',2);

-- delete category
delete from category where catid=100;
select* from category;
select* from product;

delete from category where catid=100;

select *from category;
select *from product;

-- Deleting foreign key constraint
show create table product;

insert into product(pname, catid) values('GalaxyPhone',100), ('Applewatch',100);

-- detach the contraint from parent table
alter table product
drop foreign key fkcategory;

insert into product(pname, catid) values('LGPhone',2), ('LGwatch',2);
select *from product;
select * from category;

-- description table
desc product;


create table product(
pid int auto_increment primary key,
pname varchar(100),
catid int, constraint fkcategory foreign key(catid) references category(catid)
on delete cascade
on update cascade);

drop table product;
alter table product
modify pname varchar(100) not null;

insert into product(pname, catid) values ('Applewatch',2);

select *from product;
select * from category;
delete from category where catid=2; -- you cannot delete this 101 from parent table, because its a contranit for child table, so you detach that contraint from child tatble fisrt
insert into product(pname, catid) values ('ApplePhone',1);

drop table category;
drop table product;


