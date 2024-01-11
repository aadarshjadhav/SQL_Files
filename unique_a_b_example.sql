use assignments;


create table B
(
	bid int unique,
    bname varchar(255)
);

insert into B values(1,'aabb'),(2,'ccbb');

create table A
(
	aid int,
    aname varchar(255),
    bid int, constraint fk_b foreign key(bid) references b(bid)
);

select* from B;
select* from A;

insert into A values(100,'zzz',3);
insert into A values(100,'zzz',1);

drop table B;
drop table A;
