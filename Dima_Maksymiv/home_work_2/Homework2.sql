create database if not exists library;
use library;

create table book(
	id int not null,
    nameOfBook varchar(120) not null,
    discript tinytext,
    dateOfpublication date not null default "2018-01-01",
    category varchar(30) not null,
    isbn varchar(20) not null unique,
    numOfPages int not null,
    authors_name varchar(45) not null,
    authors_surname varchar(45) not null,
    authors_email varchar(50) not null,
    authors_age int,
    dateOfBirth date not null,
    awards varchar(120)
);

drop database library;

insert into book
values
("1","The WItcher: The Last Wish","It's a very interesting book", "1993-02-17","fantasy", 422114, 288, "Andrzej", "Sapkowski", "anjeysap@gmail.com", "72", "1948-07-21", "Best book"),
("2","The WItcher: Sword of Destiny","It's a very interesting book", "1992-05-07","fantasy", 267813, 384, "Andrzej", "Sapkowski", "anjeysap@gmail.com", "72", "1948-07-21", "Best book"),
("3","The WItcher: Blood of Elves","It's a very interesting book", "1994-10-11","fantasy", 123221, 320, "Andrzej", "Sapkowski", "anjeysap@gmail.com", "72", "1948-07-21", "Best book"),
("4","The WItcher: Time of Contempt","It's a very interesting book", "1995-01-29","fantasy", 998574, 331, "Andrzej", "Sapkowski", "anjeysap@gmail.com", "72", "1948-07-21", "Best book"),
("5","The WItcher: Baptism of Fire","It's a very interesting book", "1996-03-14","fantasy", 665754, 343, "Andrzej", "Sapkowski", "anjeysap@gmail.com", "72", "1948-07-21", "Best book"),
("6","The WItcher: The Tower of the Swallow","It's a very interesting book", "1997-08-01","fantasy", 445676, 436, "Andrzej", "Sapkowski", "anjeysap@gmail.com", "72", "1948-07-21", "Best book"),
("7","The WItcher: The Lady of the Lake","It's a very interesting book", "1998-09-26","fantasy", 122112, 383, "Andrzej", "Sapkowski", "anjeysap@gmail.com", "72", "1948-07-21", "Best book");




select * from book;

select * from book
where id in (5,10,13);

select * from book
where numOfPages > 150;

select * from book
where authors_age > 30;

select * from book
where awards is null;

select * from book
where authors_email regexp "anjeysap@gmail.com";


select * from book
where isbn = 998574;


select * from book
where category = "fantasy";

select * from book
where numOfPages > 200 and authors_age > 25;

select * from book
where category in ("comedy", "fantasy");

select * from book
order by nameOfBook;

select * from book
order by authors_email;

select * from book
order by numOfPages desc;

select distinct category from book;


select distinct authors_name from book;

select * from book
where dateOfpublication > "2000-01-01";

select * from book
where dateOfpublication < "2010-01-01";