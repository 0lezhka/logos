create database  home3;
use home3;



create table book(
book_id int not null primary key,
description varchar(100),
price int

);

create table book_genre(
book_ganre_id int  primary key  not null,
name varchar(20),
book_id int,
foreign key(book_id) references book(book_id)
);



create table author(
id_author int primary key not null,
name varchar(20),
surname varchar(25),
email varchar(30),
address varchar(50),
date_author date
);


create table authot_book(
id_author int not null ,
id_book int not null,
primary key(id_author,id_book),
foreign key(id_author) references author(id_author),
foreign key(id_book) references book(book_id)

);





