create database school;
use school;
create table school.subject(
id int,
name varchar(100),
koef float,
primary key(id)
);
create table school.classroom(
id int,
name varchar(100),
seats int,
foreign key (id) references subject(id),
primary key(id)
);
create table school.teacher(
id int,
name varchar(100),
date_of_birth date,
subject_id int,
foreign key (subject_id) references subject(id),
primary key(id)
);
create table school.student(
id int,
name varchar(100),
date_of_birth date,
class int,
primary key (id)
);
create table school.student_teacher(
student_id int,
teacher_id int,
foreign key(student_id) references student(id),
foreign key(teacher_id) references teacher(id),
primary key (student_id, teacher_id)
);
insert into subject values
(1, 'subject_name_1', 1.1),
(2, 'subject_name_2', 2.2),
(3, 'subject_name_3', 3.3),
(4, 'subject_name_4', 4.4);
insert into classroom values
(1, 'classromm_name_1', 11),
(2, 'classromm_name_2', 22),
(3, 'classromm_name_3', 33);
insert into teacher values
(11, 'Teacher_name_1', '1967-04-23', 4),
(22, 'Teacher_name_2', '1995-12-15', 3),
(33, 'Teacher_name_3', '1979-02-01', 2),
(44, 'Teacher_name_4', '2000-07-09', 1);
insert into student values
(111, 'Student_name_1', '2010-03-04', 4),
(222, 'Student_name_1', '2008-03-04', 6),
(333, 'Student_name_1', '2006-03-04', 8),
(444, 'Student_name_1', '2004-03-04', 10),
(555, 'Student_name_1', '2003-03-04', 11);
insert into student_teacher values 
(111, 11),
(222, 11), (222, 33), (222, 33),
(333, 11), (333, 33),
(444, 33), (444, 44),
(555, 44);
select*from teacher where date_of_birth > '1980-01-10';
select*from student where name not like 'B%';
select*from subject order by (koef);
select* from teacher where date_of_birth = (select min(date_of_birth) from teacher);
select count(*) from classroom;
select sum(seats) from classroom;
select*from student where date_of_birth between '2000-01-01' and '2005-01-01';
alter table teacher rename column name to teacher_name;
select*from teacher inner join subject on teacher.subject_id = subject.id 
where subject.name = 'subject_name_1';
select student.name from (teacher inner join student_teacher 
on student_teacher.teacher_id = teacher_id) inner join student 
on student_teacher.student_id = student.id
where teacher_name = 'Teacher_name_1';
select teacher_name from (teacher inner join student_teacher 
on student_teacher.teacher_id = teacher_id) inner join student 
on student_teacher.student_id = student.id
where student.name = 'Student_name_1';
select classroom.name from classroom inner join subject on classroom.id = subject.id 
where subject.name = 'subject_name_1';
select classroom.name from teacher inner join subject on teacher.subject_id = subject.id
inner join classroom on classroom.id = subject.id
where teacher_name = 'Teacher_name_3';
select teacher_name from teacher inner join subject on teacher.subject_id = subject.id
inner join classroom on classroom.id = subject.id
where classroom.name = 'classroom_name_2';