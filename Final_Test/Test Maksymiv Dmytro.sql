create database school;
use school;
drop database school;


create table subject(
sub_id int primary key auto_increment,
name varchar(50),
koef float
);

create table room(
room_id int primary key auto_increment,
name varchar(50),
seats int,
foreign key(room_id) references subject(sub_id)
);

create table teatcher(
teach_id int primary key auto_increment,
name varchar(80),
date_of_birth date,
sub_id int,
foreign key(sub_id) references subject(sub_id)
); 

create table student(
stud_id int primary key auto_increment,
name varchar(80),
date_of_birth date
);

create table student_teatcher(
stud_id int,
teach_id int,
foreign key (stud_id) references student(stud_id),
foreign key (teach_id) references teatcher(teach_id)
);




select * from teatcher
where date_of_birth > '1980-01-01';

select * from student
where name not like 'B%';

select * from subject
order by koef;

select * from teatcher
where date_of_birth = (select max(date_of_birth) from teatcher);

select count(*) from room;

select sum(seats) from room;

select * from students
where date_of_birth between '2000-01-01' and '2008-01-01';

alter table teatcher
rename column name to teatcher_name;

select * from teatcher as t
inner join subject as s
on s.sub_id = t.sub_id
where s.name = 'physics';

select s.name from student as s
inner join student_teatcher as ts
on s.stud_id = ts.stud_id
inner join teatcher as t
on ts.teach_id = t.teach_id
where t.name = 'Olga Petrowna';

select t.name from teatcher as t
inner join student_teatcher as ts
on t.teach_id = ts.teach_id
inner join student as s
on s.stud_id = s.stud_id
where s.name = 'Petro';

select * from room
inner join subject as s
on room_id = sub_id
where s.name = 'biology';

select t.name from teatcher as t
inner join subject as s
on s.sub_id = t.sub_id
inner join room as r
on s.sub_id = r.id
where t.name = 'Dmytro';

select t.name from teatcher as t
inner join subject as s
on s.sub_id = t.sub_id
inner join room as r
on s.sub_id = r.room_id
where r.name = 'Room for chemistry';

