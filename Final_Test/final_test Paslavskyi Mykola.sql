-- create database school;

create table audience (
	id int primary key auto_increment,
    name varchar(50) not null,
    seats int not null,
    foreign key (id) references subject(id)
);

create table subject (
	id int primary key auto_increment,
    name varchar(30) not null,
    koef double,
    
    foreign key (id) references audience(id)
);

create table teacher (
	id int primary key auto_increment,
    name varchar(50) not null,
    date_of_birth date,
    subject_id int not null,
    
    foreign key (subject_id) references subject(id)
);

create table student (
	id int primary key auto_increment,
    name varchar(30) not null,
    date_of_birth date,
    class varchar(20) not null
);

create table teacher_student (
	teacher_id int,
	student_id int,
    
    foreign key(teacher_id) references teacher(id),
    foreign key(student_id) references student(id),
    primary key(teacher_id, student_id)
);

select * from teacher
where date_of_birth >= '1980-01-01';

select * from student
where name not like 'В%';

select * from subject
order by koef;

select * from teacher
where date_of_birth = (select min(date_of_birth) from teacher);

select count(*) from audience;

select sum(seats) from audience;

select * from student
where date_of_birth between '2000-01-01' and '2005-01-01';

select * from teacher
join subject on subject_id = subject.id and subject.name = 'sfaa';

select * from student
join teacher_student on student.id = student_id
join teacher on teacher.id = teacher_id and teacher.name = 'tgggg';

select * from teacher
join teacher_student on teacher.id = teacher_id
join student on student.id = student_id and student.name = 'пппав';

select * from audience
join subject on audience.id = subject.id and subject.name = 'sfaa';

select * from audience
join subject on audience.id = subject.id
join teacher on subject.id = subject_id and teacher.name = 'tgggg';

select * from teacher
join subject on subject_id = subject.id and subject.name = 'sfaa'
join audience on subject_id=audience.id;






