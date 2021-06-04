create database  home4;
use home4;


create table book_genre(
book_ganre_id int  primary key  not null,
name varchar(20)
);

insert into book_genre(book_ganre_id,name) values(1,'roman');
insert into book_genre(book_ganre_id,name) values(2,'drama');
insert into book_genre(book_ganre_id,name) values(3,'crime');



create table book(
book_id int not null primary key,
description varchar(80),
price int,
id_book_genre int,
foreign key(id_book_genre)references book_genre(book_ganre_id)
);

insert into book (book_id,description,price,id_book_genre) values (1,'good',100,1);
insert into book (book_id,description,price,id_book_genre) values (2,'so so',80,2);
insert into book (book_id,description,price,id_book_genre) values (3,'very well',150,3);
insert into book (book_id,description,price,id_book_genre) values (4,'well',140,1);




create table author(
id_author int primary key not null,
name varchar(20),
surname varchar(25),
email varchar(30),
address varchar(50),
date_author date
);

insert into author(id_author,name,surname,email,address,date_author) values(1,'Jon','Hon','jon@gmail.com','Lviv','1970-11-11');
insert into author(id_author,name,surname,email,address,date_author) values(2,'Petro','Lan','petro@gmail.com','Kyiv','1980-09-15');
insert into author(id_author,name,surname,email,address,date_author) values(3,'Maks','Past','maks@gmail.com','Ternopil','1970-08-13');




create table authot_book(
id_author int not null ,
id_book int not null,
primary key(id_author,id_book),
foreign key(id_author) references author(id_author),
foreign key(id_book) references book(book_id)

);

insert into authot_book (id_author,id_book) values(1,1);
insert into authot_book (id_author,id_book) values(1,2);
insert into authot_book (id_author,id_book) values(2,3);
insert into authot_book (id_author,id_book) values(3,4);
insert into authot_book (id_author,id_book) values(1,3);

select * from authot_book;

select name,id_book,description,price from author left join authot_book on author.id_author =authot_book.id_author 
inner join book on book.book_id=id_book  where name ='Jon';
select name,book_id from book_genre right join book on book_ganre_id=id_book_genre;
select * from book_genre left join book on book_ganre_id=id_book_genre
union
select * from book_genre right join book on book_ganre_id=id_book_genre;
select * from book left join book_genre on book.id_book_genre=book_ganre_id where name ='roman';






