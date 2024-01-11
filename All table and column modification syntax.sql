use assignments;

create table vehicles
(
	vehicle_id int,
    year int not null,
    make varchar(100) not null,
    primary key(vehicle_id)
);

-- add a single column at a certain position
alter table vehicles add models varchar(100) not null after year;
select* from vehicles;

-- add new cloumns
alter table vehicles add colour varchar(100),add note varchar(100);

desc vehicles;

-- Modify contraint of a column: null or not null
alter table vehicles modify note varchar(100) not null;

-- modify multiple tables with repositioning column 
alter table vehicles modify year int null, modify models varchar(100) null after make;

-- rename column name
alter table vehicles change column note vehicleCondition varchar(100) not null;

-- Drop a column
alter table vehicles drop column vehicleCondition; 

-- Rename your table name
alter table vehicles rename to cars;
desc cars;