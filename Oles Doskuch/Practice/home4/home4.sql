create database  home4;
use home4;


create table book_genre(
book_ganre_id int  primary key  not null,
name varchar(20)
);



create table book(
book_id int not null primary key,
description varchar(80),
price int,
id_book_genre int,
foreign key(id_book_genre)references book_genre(book_ganre_id)
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

