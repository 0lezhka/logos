create database library;
use library;
create table library.book(
book_id int,
title varchar(200),
number_of_pages int,
primary key (book_id)
);
create table library.author(
author_id int,
author_name varchar(50),
author_surname varchar(100),
primary key (author_id)
);
create table library.genre(
genre_id int,
genre_name varchar(50),
primary key (genre_id)
);
create table book_author(
book_id int,
author_id int,
foreign key (book_id) references book(book_id),
foreign key (author_id) references author(author_id),
primary key (book_id, author_id)
);
create table book_genre(
book_id int,
genre_id int,
foreign key (book_id) references book(book_id),
foreign key (genre_id) references genre(genre_id),
primary key (book_id, genre_id)
);
insert into book values
(1, 'Title1', 100),
(2, 'Title2', 200),
(3, 'Title3', 300),
(4, 'Title4', 400),
(5, 'Title5', 500);
insert into author values
(11, 'Name1', 'Surname1'),
(22, 'Name2', 'Surname2'),
(33, 'Name3', 'Surname3'),
(44, 'Name4', 'Surname4'),
(55, 'Name5', 'Surname5');
insert into genre values
(111, 'genre1'),
(222, 'genre2'),
(333, 'genre3'),
(444, 'genre4'),
(555, 'genre5');
insert into book_author values
(1, 11),
(2, 55),
(3, 33),
(3, 11),
(4, 55),
(4, 33),
(4, 11);
insert into book_genre values
(1, 111),
(1, 222),
(1, 555),
(3, 222),
(5, 333);
select title, author.author_name, author_surname from book inner join (book_author 
inner join author on author.author_id = book_author.author_id) 
on book.book_id = book_author.book_id
where title = 'Title4';
select title, count(author.author_name) as number_of_authors
from book inner join (book_author 
inner join author on author.author_id = book_author.author_id) 
on book.book_id = book_author.book_id
group by author.author_name;
select genre_name from book inner join (book_genre 
inner join genre on genre.genre_id = book_genre.genre_id) 
on book.book_id = book_genre.book_id
where title = 'Title1';