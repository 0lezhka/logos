create database if not exists library;
use library;
drop table genre_of_book;

create table book(
id int primary key,
nameOfBook varchar(50) not null,
discript tinytext,
price decimal,
isbn int not null unique
);


create table genre_of_book(
genreId int primary key,
genre varchar(40) unique,
foreign key (genreId) references book(id)
);


create table author(
authorsId int,
authors_name varchar(50) not null,
authors_surname varchar(50) not null,
authors_email varchar(50),
authors_address varchar(100),
dateOfBirth date,
book_id int,
foreign key(book_id) references book(id)
);