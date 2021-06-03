create database if not exists library;
use library;
drop table genre_of_book;

create table book(
id int primary key auto_increment,
nameOfBook varchar(50),
discript tinytext,
price decimal not null,
isbn int not null unique
);


create table genre_of_book(
id int primary key,
genre varchar(40) unique
);


create table author(
authorsId int,
authors_name varchar(45) not null,
authors_surname varchar(45) not null,
authors_email varchar(50) not null,
authors_address varchar(100) not null,
dateOfBirth date not null,
book_id int,
foreign key(book_id) references book(id) 
);

-- Вам потрiбно переробити бд щоб получився зв'язок типу many-to-many

create table book_genre(
genre_id int not null,
book_id int not null,
foreign key (genre_id) references genre_of_book(id),
foreign key (book_id) references book(id)
);