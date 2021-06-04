create database if not exists school;

use school;

create table if not exists subject(
subject_id int auto_increment primary key,
subject_name varchar(30) not null,
subject_koef decimal(4, 2) not null
);

create table if not exists room(
room_id int primary key,
room_name varchar(10) not null,
room_seats tinyint unsigned not null,
foreign key(room_id) references subject(subject_id)
);

create table if not exists teacher(
teacher_id int auto_increment primary key,
teacher_name varchar(30) not null,
teacher_date_of_birth date not null,
subject_id int not null,
foreign key(subject_id) references subject(subject_id)
);

create table if not exists student(
student_id int auto_increment primary key,
student_name varchar(30) not null,
student_date_of_birth date not null,
student_class varchar(5) not null
);

create table if not exists teacher_student(
teacher_id int not null,
student_id int not null,
constraint id primary key(teacher_id, student_id),
foreign key(teacher_id) references teacher(teacher_id),
foreign key(student_id) references student(student_id)
);

insert into subject(subject_name, subject_koef) values
('Math', 9.5),
('Chemistry', 6.5),
('Physics', 8.2),
('English', 5.34),
('Art', 4.8);

insert into room values
(1, '12-g', 25),
(2, '23-f', 26),
(3, '45-g', 27),
(4, '38-a', 25),
(5, '13-a', 30);

insert into teacher(teacher_name, teacher_date_of_birth, subject_id) values
('Jackson', '1970-12-7', 1),
('Ivanov', '1980-10-12', 2),
('Newton', '1965-01-01', 3),
('Jo', '1987-09-15', 4),
('Da Vinci', '1960-02-14', 5),
('Davidson', '1977-05-30', 4),
('Adams', '1985-10-20', 1);

insert into student(student_name, student_date_of_birth, student_class) values
('Tom', '2006-07-25', '8-B'),
('Steve', '2004-09-10', '10-C'),
('Gigi', '2007-01-01', '7-D'),
('Anna', '2006-03-09', '8-B'),
('Dana', '2008-12-14', '6-F'),
('Max', '2009-10-18', '5-A'),
('Katy', '2005-09-10', '9-A');

insert into teacher_student values
(1, 3),
(1, 5),
(1, 7),
(2, 2),
(2, 4),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 1),
(5, 3),
(5, 5),
(5, 7),
(6, 2),
(6, 4),
(6, 6),
(7, 1),
(7, 2),
(7, 5),
(7, 7);

select * from teacher where teacher_date_of_birth > '1980-12-31';

select * from student where student_name not like 'B%';

select * from subject order by subject_koef;

select * from teacher where teacher_date_of_birth = (select min(teacher_date_of_birth) from teacher);

select count(*) as room_qty from room;

select sum(room_seats) as seats_qty from room;

select * from student where student_date_of_birth between '2000-01-01' and '2005-12-31';

alter table teacher rename column teacher_name to name;

select teacher.teacher_id, teacher.name, teacher.teacher_date_of_birth, subject.subject_name from teacher 
join subject on teacher.subject_id = subject.subject_id where subject.subject_name = 'Physics';

select student.student_id, student.student_name, student.student_date_of_birth, student.student_class, teacher.name as teacher_name from student 
join teacher_student on student.student_id = teacher_student.student_id 
join teacher on teacher_student.teacher_id = teacher.teacher_id where teacher.name = 'Jackson';

select teacher.teacher_id, teacher.name as teacher_name, teacher.teacher_date_of_birth, student.student_name from teacher 
join teacher_student on teacher_student.teacher_id = teacher.teacher_id 
join student on student.student_id = teacher_student.student_id where student.student_name = 'Max';

select room_id, room_name, room_seats, subject_name from room 
join subject on room.room_id = subject.subject_id where subject.subject_name = 'Chemistry';

select room_id, room_name, room_seats, teacher.name from room 
join subject on room.room_id = subject.subject_id 
join teacher on subject.subject_id = teacher.subject_id where teacher.name = 'Ivanov';

select teacher.teacher_id, teacher.name as teacher_name, teacher.teacher_date_of_birth, subject.subject_name from teacher
join subject on teacher.subject_id = subject.subject_id
join room on room.room_id = subject.subject_id where subject.subject_name = 'Chemistry';