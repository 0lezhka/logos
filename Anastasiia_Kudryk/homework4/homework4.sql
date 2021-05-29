create database library;
use library;
create table library.book(
id int not null unique,
title varchar(100) not null,
book_description text,
price float not null,
isbn varchar(50) not null unique,
primary key(id)
);
create table library.genre(
id int not null unique,
name varchar(30) not null unique,
primary key(id)
);
create table library.author(
id int not null unique,
name varchar(50) not null,
surname varchar(50) not null,
email varchar(100) not null unique,
adress varchar(200) not null unique,
date_of_birth date not null,
primary key(id)
);
alter table book add book_genre int;
alter table book add foreign key(book_genre) references genre(id);
alter table author add book_id int;
alter table author add foreign key(book_id) references book(id);