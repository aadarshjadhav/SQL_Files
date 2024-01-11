use student_course;
/*
1.Select all students and their majors.
*/

select *
from students;

/*
2.List the names of courses with more than 3 credit hours.
*/
select course_name
from courses 
where credit_hours>3;

/*
3.Find the students born after 2000.
*/

select student_name
from students
where year(birth_date) > 2000;

/*
4.Count the number of courses in each major.
*/

select count(course_id) as 'Number of Courses'
from courses;

/*
5.Show the name and birth date of the oldest student.
*/

select student_name, birth_date
from students
where birth_date =(select min(birth_date)
					from students);

/*
6.Update the major of a specific student.
*/

update students s
set major= 'Computer'
where student_id = 2;

/*
7.List all students who have not enrolled in any courses.
*/
-- Doubt: Cannot find Student having major has null value
select student_id, student_name,major
from students
where major=null;

/*
8.Find the course with the highest number of credit hours.
*/
select course_name
from courses
where credit_hours = (select max(credit_hours)
						from courses);


/*
9.Calculate the average birth year of all students.
*/
select avg(year(birth_date))
from students;

/*
10.	Delete all students majoring in 'Chomputer'.
*/

select student_name
from students
where student_id in (select student_id
					from students
                    where major like 'Computer');


/*
11.	Show the names and birth dates of students majoring in 'Computer'.
*/
select student_name, birth_date
from students
where major like 'Computer';


/*
12.	Find the student with the highest number of credit hours enrolled.
*/
select student_name
from students
where student_id in(select student_id
					from enrollments
                    where course_id in(
										select course_id
										from courses
										where credit_hours = (select max(credit_hours)
																from courses)));
					

/*
13.List the majors and the number of students in each major.
*/

select course_name, count(e.student_id) -- It doesnt matter: e.student_id or s.student_id
from courses c, students s, enrollments e
where e.student_id =s.student_id and e.course_id = c.course_id
group by course_name;

/*
14.Find students with similar birth years (having at least one year in common).
*/

select year(birth_date), group_concat(student_name)
from students 
group by year(birth_date);


/*
15.Show the majors with students born before 1995.
*/

select major, group_concat(student_name)
from students
where year(birth_date)<1995
group by major;

/*
16.Count the total number of credit hours for each major.
*/

select major,credit_hours
from students s, courses c, enrollments e
where e.student_id= s.student_id and e.course_id = c.course_id
group by major;

/*
17.Update the birth date of all students majoring in 'Mechanical'.
*/

update students s
set birth_date= '1991-07-22'
where major like 'Mechanical';
                    
select * from students;

/*
18.Find the courses with no enrolled students.
*/
select course_name
from courses
where course_id not in (select c.course_id
					from courses c, enrollments e, students s
					where c.course_id=e.course_id and e.student_id= s.student_id);

/*
19.List the students and their majors, ordered by birth date (ascending order).
*/

select student_name, major, birth_date
from students 
order by birth_date;


/*
20.Show the students born in the last ten years.
*/
select student_name
from students
where year(birth_date)>=year(current_date)-10;

21.	Find the courses with names containing the word 'Math'.


22.	Calculate the total number of credit hours for all courses.


23.	Show the students with the highest and lowest credit hours enrolled.

-- Doubt: Not done!
select s.student_id, s.student_name, sum(credit_hours)
from students s, enrollments e, courses c
where s.student_id=e.student_id and e.course_id=c.course_id
group by s.student_id
order by sum(credit_hours) asc
limit 1 and (
				select s.student_id, s.student_name, sum(credit_hours)
				from students s, enrollments e, courses c
				where s.student_id=e.student_id and e.course_id=c.course_id
				group by s.student_id
				order by sum(credit_hours) desc
				limit 1
				);

24.	Find students who have enrolled in consecutive years.

/*
25.Delete all courses with less than 2 credit hours.

*/
delete from courses
where credit_hours<2;
