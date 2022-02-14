create table Student(student_id integer, name varchar(10), age integer);
insert into Student(student_id, name, age) values(1, "john",15);
insert into Student(student_id, name, age) values(2, "marqueez",16);
insert into Student(student_id, name, age) values(3, "chip",14);
insert into Student(student_id, name, age) values(4, "marley",14);
create table Classroom(classroom_id integer, student_id integer);
insert into Classroom(classroom_id, student_id) values(123, 1);
insert into Classroom(classroom_id, student_id) values(234, 2);
insert into Classroom(classroom_id, student_id) values(123, 4);

select classroom_id, count(classroom_id) as number_of_students
from Classroom
group by classroom_id;

select classroom_id, name
from Student right join Classroom
on Student.student_id = Classroom.student_id;

select classroom_id, name
from Student left join Classroom
on Student.student_id = Classroom.student_id;

select school, count(*) as number_of_students from
(
select 
  case
   when age <16 then 'middle school'
   when age >15 then 'high school'
 end as school
 from Student
) Student
group by school
order by school;

select * from Student
order by age desc
limit 1;

select student_id, name, age, sum(age) over (order by student_id) as cumulative_sum
from Student;