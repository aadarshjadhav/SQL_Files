use student_course;

/*
Table: students
student_id (int, primary key)
student_name (varchar)
birth_date (date)
major (varchar)
*/

/*
Student Table details
*/
create table students(student_id int primary key, student_name varchar(100), birth_date date, major varchar(100));

-- values into Students

insert into students values(1, 'Aadarsh', '1994-04-25', 'Computer');
insert into students values(2, 'Rohit', '1992-07-15', 'Biology');
insert into students values(3, 'Jayraj', '1997-03-17', 'Physics');
insert into students values(4, 'Abhishek', '1995-08-05', 'Chemistry');
insert into students values(5, 'Sudharshan', '2002-09-1', 'Electrical');
insert into students values(6, 'Jitu', '2001-08-1', 'Computer');
insert into students values(7, 'Sidharth', '2001-10-22', 'Mechanical');
insert into students values(8, 'Ghost', '1891-10-17', null);

drop table students;

/*Table: courses
course_id (int, primary key)
course_name (varchar)
credit_hours (int)
*/

create table courses(course_id int primary key, course_name varchar(100), credit_hours int);

-- insert values in Courses

insert into courses values(101, 'Computer', 4);
insert into courses values(102, 'Biology', 4);
insert into courses values(103, 'Physics', 3);
insert into courses values(104, 'Chemistry', 2);
insert into courses values(105, 'Electrical', 4);
insert into courses values(106, 'Mechanical', 2);
insert into courses values(107, 'Web Technology', 1);

drop table courses;


/*Table: enrollments
enrollment_id (int, primary key)
student_id (int, foreign key references students(student_id))
course_id (int, foreign key references courses(course_id))
enrollment_date (date)
*/


create table enrollments(enrollment_id int primary key, student_id int, constraint fkstud_id foreign key (student_id) references students(student_id),
						course_id int, constraint fkcourse_id foreign key (course_id) references courses(course_id),
                        enrollment_date date
);


insert into enrollments values(1001, 1,101,'2023-10-14');
insert into enrollments values(1002, 2,102,'2023-07-17');
insert into enrollments values(1003, 3,103,'2023-05-19');
insert into enrollments values(1004, 4,104,'2023-03-22');
insert into enrollments values(1005, 5,105,'2023-02-11');
insert into enrollments values(1006, 6,101,'2023-10-14');
insert into enrollments values(1007, 7,106,'2023-12-15');


drop table enrollments;
