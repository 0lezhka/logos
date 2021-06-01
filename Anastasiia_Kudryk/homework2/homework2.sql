create database library;
use library;
create table library.book(
id bigint not null auto_increment,
title varchar(120) not null,
description text,
publication_date date not null default "2018-01-01",
category varchar(30) not null,
isbn varchar(20) not null unique,
page_number int not null,
author_name varchar(45) not null,
author_surname varchar(45) not null,
author_email varchar(50) not null unique,
author_age int not null,
date_of_birth date not null,
author_awards varchar(120) default null,
primary key(id)
);
insert into book
values (23, 'B title', 'description A', '2010-09-09', 'a-category', 'JH-88-23-45-8', 123, 'F_author_Name', 'J_author_Surname', 'K_author_email', 24, '1987-02-02', 'M award'),
	(8, 'G title', 'description S', '2020-04-20', 'g-category', 'KI-56-123-65-1', 140, 'R_author_Name', 'G_author_Surname', 'U_author_email', 38, '1973-09-12', 'N award'),
    (10, 'S title', 'description D', '1999-01-05', 'a-category', 'KO-99-23-986-1', 450, 'V_author_Name', 'I_author_Surname', 'H_author_email', 84, '1968-10-02', null),
    (1, 'M title', 'description B', '1934-09-12', 'b-category', 'GW-12-09-456', 23, 'B_author_Name', 'E_author_Surname', 'P_author_email', 46, '1986-12-22', 'Q award'),
    (18, 'P title', 'description F', '1955-01-31', 'i-category', 'XX-99-34-08', 68, 'D_author_Name', 'O_author_Surname', 'G_author_email', 28, '2001-07-25', 'B award'),
    (13, 'E title', 'description L', '2001-07-26', 'b-category', 'JH-9-44-222-2', 93, 'S_author_Name', 'B_author_Surname', 'N_author_email', 52, '1997-03-10', null),
    (17, 'Z title', 'description Y', '2018-09-02', 'r-category', 'RT-00-12-3444', 199, 'Z_author_Name', 'N_author_Surname', 'Z_author_email', 33, '1952-05-17', 'A award'),
	(3, 'A title', 'description O', '1999-08-01', 'a-category', 'DF-900-23-4-55', 20, 'L_author_Name', 'Y_author_Surname', 'A_author_email', 19, '1993-03-09', 'K award'),
    (4, 'X title', 'description P', '2004=05-28', 'k-category', 'LP-87-23-450', 57, 'X_author_Name', 'T_author_Surname', 'X_author_email', 35, '1969-06-10', 'V award'),
	(38, 'Q title', 'description W', '2013-04-05', 'b-category', 'KL-657-3-4-222', 300, 'M_author_Name', 'Q_author_Surname', 'B_author_email', 50, '2003-12-12', 'C award');
    
select*from book;
select*from book where id=5 or id=10 or id=13;
select*from book where page_number>150;
select*from book where author_age>30;
select*from book where author_awards is null;
select*from book where author_email='X_author_email';
select*from book where isbn='DF-900-23-4-55';
select*from book where category='a-category';
select*from book where page_number>200 and author_age>25;
select*from book where category='b-category' or category='k-category';
select*from book order by title ASC;
select*from book order by author_email ASC;
select*from book order by page_number DESC;
select distinct category from book;
select distinct author_name from book;
select*from book where publication_date > '2000-01-01';
select*from book where publication_date < '2010-01-01';