create database if not exists library;

use library;

create table if not exists category(
category_id int auto_increment primary key,  -- можна не вказувати not null, так як це є дефолтною властивістю primary key
genre varchar(30) not null unique
);

create table if not exists book(
book_id int auto_increment primary key,
title varchar(120) not null,
description text,
price smallint unsigned not null,
isbn varchar(20) not null unique,
category_id int not null,
foreign key(category_id) references category(category_id)
);

create table if not exists author(
author_id int auto_increment primary key,
author_name varchar(45) not null,
author_surname varchar(45) not null,
author_email varchar(50) not null unique,
author_birthdate date not null
);

create table if not exists book_author(
book_id int not null,
author_id int not null,
constraint id primary key(book_id, author_id),
foreign key(book_id) references book(book_id),
foreign key(author_id) references author(author_id)
);