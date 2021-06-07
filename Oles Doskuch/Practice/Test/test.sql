create database school;
 
 use school;

create table subject(
subject_id int primary key not null ,
subject_nam varchar(25),
subject_koef int not null
);
insert into subject(subject_id,subject_nam,subject_koef) values (1,'Фізика',5);
insert into subject(subject_id,subject_nam,subject_koef) values (2,'Математика ',7);
insert into subject(subject_id,subject_nam,subject_koef) values (3,'Геометрія ',4);
insert into subject(subject_id,subject_nam,subject_koef) values (4,'Біологія',3);
insert into subject(subject_id,subject_nam,subject_koef) values (5,'Історія',2);
insert into subject(subject_id,subject_nam,subject_koef) values (6,'Хімія',6);
select * from subject;

create table classroom (
classroom_id int primary key not null,
classroom_name varchar (25),
classroom_seats int not null,
foreign key(classroom_id) references subject(subject_id)
);

insert into classroom(classroom_id,classroom_name,classroom_seats) values (1,'клас_фізики',20);
insert into classroom(classroom_id,classroom_name,classroom_seats) values (2,'клас_математики',30);
insert into classroom(classroom_id,classroom_name,classroom_seats) values (3,'клас_геометрії',23);
insert into classroom(classroom_id,classroom_name,classroom_seats) values (4,'клас_біології',15);
insert into classroom(classroom_id,classroom_name,classroom_seats) values (5,'клас_історія',25);
insert into classroom(classroom_id,classroom_name,classroom_seats) values (6,'клас_хімії',25);
select * from classroom;


create table teacher (
teacher_id  int primary key not null,
teacher_name varchar(25),
teacher_dateOfBirth date,
id_subject int not null,
foreign key (id_subject) references subject(subject_id)
);



insert into teacher (teacher_id,teacher_name,teacher_dateOfBirth,id_subject) values(1,'Ольга Миколаївна','1985-11-13',2);
insert into teacher (teacher_id,teacher_name,teacher_dateOfBirth,id_subject) values(2,'Дмитро Богданович','1970-11-22',1);
insert into teacher (teacher_id,teacher_name,teacher_dateOfBirth,id_subject) values(3,'Галина Григорівна','1990-04-08',5);
insert into teacher (teacher_id,teacher_name,teacher_dateOfBirth,id_subject) values(4,'Наталя Тарасівна','1975-07-06',3);
insert into teacher (teacher_id,teacher_name,teacher_dateOfBirth,id_subject) values(5,'Ігор Володимирович','1970-10-27',4);
insert into teacher (teacher_id,teacher_name,teacher_dateOfBirth,id_subject) values(6,'Юлія Богданівна','1974-04-12',6);
insert into teacher (teacher_id,name_techer,teacher_dateOfBirth,id_subject) values(7,'Мирон Степанович','1975-11-12',5);

select * from teacher;

create table student(
student_id int primary key not null,
student_name varchar (25),
student_dateOfBirth date,
student_class int 
);

insert into student (student_id,student_name,student_dateOfBirth,student_class) values(1,'Іван','2000-02-05',7);
insert into student (student_id,student_name,student_dateOfBirth,student_class) values(2,'Петро','2001-03-04',6);
insert into student (student_id,student_name,student_dateOfBirth,student_class) values(3,'Тарас','1999-03-06',8);
insert into student (student_id,student_name,student_dateOfBirth,student_class) values(4,'Олег','2006-04-02',1);
insert into student (student_id,student_name,student_dateOfBirth,student_class) values(5,'Маркіян','1998-04-23',9);
insert into student (student_id,student_name,student_dateOfBirth,student_class) values(6,'Андрій','1996-11-23',11);



create  table student_teacher(
id_student int ,
id_teacher int,
primary key(id_student,id_teacher),
foreign key(id_student) references student(student_id),
foreign key(id_teacher) references teacher(teacher_id)
);


insert into student_teacher(id_student,id_teacher) values (1,2);
insert into student_teacher(id_student,id_teacher) values (1,3);
insert into student_teacher(id_student,id_teacher) values (2,4);
insert into student_teacher(id_student,id_teacher) values (3,6);
insert into student_teacher(id_student,id_teacher) values (4,5);
insert into student_teacher(id_student,id_teacher) values (5,1);
insert into student_teacher(id_student,id_teacher) values (6,5);
insert into student_teacher(id_student,id_teacher) values (6,1);
insert into student_teacher(id_student,id_teacher) values (2,5);





select * from teacher where  teacher_dateOfBirth >'1980-01-01'; -- 1
select * from student where  student_name not  like 'В%' ; -- 2
select * from subject order by subject_koef ; -- 3     ASC or DESC
select * from teacher where teacher_dateOfBirth= (select min( teacher_dateOfBirth) from teacher);  -- 4
select count(classroom_name) from classroom ; -- 5
select sum(classroom_seats) from classroom; -- 6
select * from student where student_dateOfBirth between '2000-01-01' and '2005-01-01'; -- 7
alter table teacher rename column teacher_name to name_techer; -- 8
select * from teacher left join subject on teacher.id_subject =subject.subject_id where subject_id=1; -- 9
select * from student left join student_teacher on student.student_id= student_teacher.id_student -- 10
left join teacher on teacher.teacher_id=student_teacher.id_teacher where name_techer='Ольга Миколаївна'; 
select * from teacher left join student_teacher on teacher_id =id_teacher -- 11
left join student on student_id = id_student where student_name = 'Петро'; 
select * from classroom left join subject on classroom_id = subject_id where subject_nam='Біологія'; -- 12
select classroom_name,classroom_seats,subject_nam,name_techer from classroom  -- 13
left join subject on classroom_id=subject_id 
left join teacher on id_subject =subject_id where name_techer='Дмитро Богданович';
select name_techer,subject_nam,classroom_name,classroom_seats 
from teacher left join subject on id_subject =subject_id   -- 14
left join classroom on classroom_id =subject_id where classroom_name='клас_хімії';

 





