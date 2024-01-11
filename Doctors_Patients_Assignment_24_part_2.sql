SELECT * FROM hospitaldb.patients;

	use hospitaldb2;

	-- docid int(primary key),docName varchar(25) ,
	-- Speciality varchar(20)

	create table Doctors(doc_id int primary key, docName varchar(25), speciality varchar(20));

	insert into Doctors values(101, 'Alex','Kidney');
	insert into Doctors values(102, 'Gopan','Brain');
	insert into Doctors values(103, 'Benji','Bone');
	insert into Doctors values(104, 'George','Muscle');
	insert into Doctors values(105, 'Mathew','Eyes');


	create table patients (pid INT PRIMARY KEY,
		pName VARCHAR(25),
		age INT,
		weight FLOAT,
		email VARCHAR(25),
		admissiondate DATE,
		doc_id int, 
		constraint fkdoc_id foreign key(doc_id) references doctors(doc_id));



	insert into patients  (pid, pName, age, weight, email, admissiondate, doc_id) values
	(1,'Aadarsh', 30, 70.5, 'Aadarsh@gmail.com', '2023-01-01',101),
	(2, 'Jadoo', 25, 62.0, 'Jadoo@gmail.com', '2023-02-15',104),
	(3, 'Rohit', 57, 60.2, 'Rohit@gmail.com', '2023-03-10',103),
	(4, 'Jayraj', 51, 50, 'Jayraj@gmail.com', '2023-07-23',104),
	(5, 'Abhishek', 59, 76.8, 'Abhishek@gmail.com', '2023-06-24',102),
	(6, 'Jitu', 29, 55.5, 'Jitu@gmail.com', '2023-05-08',103),
	(7, 'Siddharth', 70, 50, 'Siddharth@gmail.com', '2023-12-1',102),
	(8, 'Prem', 37, 55.5, 'Prem@gmail.com', '2023-05-18',101),
	(9, 'Raj', 45, 55.5, 'Raj@gmail.com', '2020-07-27',102),
	(10, 'Jenny', 47, 55.5, 'Jenny@gmail.com', '2022-05-08',102),
	(11, 'Geralt', 81, 55.5, 'Geralt@gmail.com', '2019-05-16',null);
