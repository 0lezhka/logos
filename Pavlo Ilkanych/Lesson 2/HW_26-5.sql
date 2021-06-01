create database if not exists library;
use library;

create table book(
	id int not null primary key auto_increment,
    nameOfBook varchar(120) not null,
    discript tinytext,
    dateOfpublication date not null default "2018-01-01",
    category varchar(30) not null,
    isbn varchar(20) not null unique,
    numOfPages int not null,
    authors_name varchar(45) not null,
    authors_surname varchar(45) not null,
    authors_email varchar(50) not null,
    authors_age int,      -- не може бути not null, тому що деякі автори вже померли 
    dateOfBirth date not null,
    awards varchar(120)
);

insert into book
values
(1, "Harry Potter and Philosophers Stone", "blablabla", "1997-06-26", "fantasy", 115599, 265, "Joanne", "Rowling", "jkr@gmail.ru", 55, "1965-06-30", "a lot of awards"),
(2, "Harry Potter and Chamber of Secret", "blablabla", "1999-08-30", "fantasy", 226688, 336, "Joanne", "Rowling", "jkr@gmail.ru", 55, "1965-06-30", "a lot of awards"),
(3, "Harry Potter and Prisoner of Azkaban", "blablabla", "1999-04-12", "fantasy", 337744, 216, "Joanne", "Rowling", "jkr@gmail.ru", 55, "1965-06-30", "a lot of awards"),
(4, "Harry Potter and Goblet of Fire", "blablabla", "2000-06-26", "fantasy", 445511, 658, "Joanne", "Rowling", "jkr@gmail.ru", 55, "1965-06-30", "a lot of awards"),
(5, "Harry Potter and Order of the Phoenix", "blablabla", "2003-02-06", "fantasy", 558822, 457, "Joanne", "Rowling", "jkr@gmail.ru", 55, "1965-06-30", "a lot of awards"),
(6, "Harry Potter and Half-Blood Prince", "blablabla", "2005-07-11", "fantasy", 698547, 147, "Joanne", "Rowling", "jkr@gmail.ru", 55, "1965-06-30", "a lot of awards"),
(7, "Harry Potter and Deathly Hallows", "blablabla", "2007-01-01", "fantasy", 457819, 356, "Joanne", "Rowling", "jkr@gmail.ru", 55, "1965-06-30", "a lot of awards"),
(8, "The Hobbit", "blablabla", "1937-09-21", "fantasy", 989456, 500, "John Ronald", "Tolkien", "tolkien@gmail.ru", null, "1892-01-03", null),
(9, "On Fairy-Stories", "blablabla", "1939-03-08", "fantasy", 251463, 658, "John Ronald", "Tolkien", "tolkien@gmail.ru", null, "1892-01-03", null),
(10, "The Lord of the Rings", "blablabla", "1937-01-01", "fantasy", 789519, 458, "John Ronald", "Tolkien", "tolkien@gmail.ru", null, "1892-01-03", null);


-- витягнути всі книги
select * from book;

-- витягнути книги з id 5, 10, 13
select * from book
where id in (5,10,13);

-- витягнути всі книги де кількість сторінок більше 150
select * from book
where numOfPages > 150;

-- витягнути книги, де автори старше 30 років
select * from book
where authors_age > 30;

-- витягнути книги, в яких автори не мають нагород
select * from book
where awards is null;

-- витягнути книгу по email автора
select * from book
where authors_email regexp "tolkien@gmail.ru";

-- витягнути книгу по isbn
select * from book
where isbn = 789519;

-- витягнути всіх книги які належать до певної категорії
select * from book
where category = "fantasy"; -- категорії можна добавити в enum і шукати по номеру

-- витягнути книги в яких кількість сторінок більше 200 та вік автора більше 25
select * from book
where numOfPages > 200 and authors_age > 25;

-- витягнути книги, в яких категорія "комедія" або "драма"(назви категорії можете змінити)
select * from book
where category in ("comedy", "drama");

-- витягнути книги та посортувати за назвою
select * from book
order by nameOfBook;

-- витягнути книги та посортувати за email автора
select * from book
order by authors_email;

-- витягнути книги та посортувати за кількістю сторінок(проти алфавіту)
select * from book
order by numOfPages desc;

-- витягнути унікальні значення категорій
select distinct category from book;


-- витягнути унікальні імена авторів
select distinct authors_name from book;

-- витягнути книги які було написано після '2000-01-01'
select * from book
where dateOfpublication > "2000-01-01";

-- витягнути книги які було написано до '2010-01-01'
select * from book
where dateOfpublication < "2010-01-01";


