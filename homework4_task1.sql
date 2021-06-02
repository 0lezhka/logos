create database if not exists library;
use library;
drop table genre_of_book;
drop database library;
create table book(
id int primary key,
nameOfBook varchar(50) not null,
discript tinytext,
price decimal,
isbn int not null unique
);


create table genre_of_book(
genre_id int primary key,
genre varchar(40) unique
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

create table book_genre(
genre_id int not null,
book_id int not null,
foreign key (genre_id) references genre_of_book(genre_id),
foreign key (book_id) references book(id)
);

select b.nameOfBook as book_name, isbn, authors_name, authors_surname
from book as b
inner join author as a
on a.book_id = b_id