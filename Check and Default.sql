use fkdemo;

create table cart_items
(
	item_id int auto_increment primary key,
    name varchar(255) not null,
    quatity int not null,
    price dec(5,2) not null,
    sales_tax dec(5,2) not null default 0.1,
    check(quatity>0),
    check (sales_tax>=0)
);

insert into cart_items(name, quatity, price, sales_tax) 
values('Maintainence services', 3,25.99,0);

insert into cart_items(name, quatity,price,sales_tax) values ('Battery',4,0.25,default);

-- if you quantity is not greater than 0, check will cause error, that contraint is voilated
-- insert into cart_items(name, quatity,price,sales_tax) values ('Screen',0,0.25,default);

select* from cart_items;
