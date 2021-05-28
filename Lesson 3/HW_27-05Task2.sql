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

-- Отже, потрібно об`єднати між собою книжку і жанр книжки. 
-- Умова - книжка може належати до одного жанру.


create table genre_of_book(
genreId int primary key,
genre varchar(40) unique,
foreign key (genreId) references book(id)
);

-- Подумати, як правильно і зробити об`єднання таблиць автор і книжка. 
-- Умови - книжку може писати багато авторів


create table author(
authorsId int,
authors_name varchar(45) not null,
authors_surname varchar(45) not null,
authors_email varchar(50) not null,
authors_address varchar(100) not null,
dateOfBirth date not null,
book_id int,
foreign key(book_id) references book(id) -- тут більше підходив би зв'язок типу many-to-many, а не one-to-many тому що один автор також може написати багато книг
);