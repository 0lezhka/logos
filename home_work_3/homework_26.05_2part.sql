drop database if exists library_4hometask;
create database library_4hometask;

use library_4hometask;

create table category(
	id int unique auto_increment primary key,
    category_name varchar(30) not null);
    
create table book(
	id int unique auto_increment primary key,
    book_name varchar(60) not null,
    description text not null,
    price decimal(3, 2) not null,
    isbn varchar(20) not null,
    category_id int not null,
    foreign key(category_id) references category(id));
    
create table author(
	id int unique auto_increment primary key,
    author_firstname varchar(30) not null,
    author_secondname varchar(50) not null,
    email varchar(30) not null,
    adress varchar(100) not null,
    birthdate date not null,
    book_id int not null,
    foreign key(book_id) references book(id));
