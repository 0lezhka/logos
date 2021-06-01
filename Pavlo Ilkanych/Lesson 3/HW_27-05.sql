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

-- витягнути всі книжки
select * from book;

-- змінити прізвище автора в 2х книжках
update book
set authors_surname = "Not Rowling"
limit 2;

-- підрахувати кількість книжок, в яких автори мають нагороди
select count(*) from book
where awards is not null;

-- вивести інформацію про книжку з найменшою кількістю сторінок
select * from book
where numOfPages <= (select min(numOfPages) from book);

-- вивести максимальну кількість сторінок
select max(numOfPages) from book;

-- вивести середню ціну книжки
select avg(numOfPages) from book; -- ціни в таблиці нема, тому порахував середнє сторінок)

-- порахувати суму книжок за категорією
select count(*) from book
where category = "fantasy";

-- вивести мінімальну ціну книжки
select min(numOfPages) from book; -- теж замінив на сторінки

-- вивести інформацію про книжку з найменшою ціною
select * from book
where numOfPages <= (select min(numOfPages) from book); -- те саме

-- написати 3 запити, використавши різні види пошуку за співпадіннями(like)
select * from book
where nameOfBook like "Harry%";

select * from book
where discript like "blablabl_";

select * from book
where authors_email regexp "gmail.ru$"; -- регулярні вирази набагато ширші і краще підходять для таких запитів ніж лайк

-- вивести книжки де ціна на проміжку: 1. 50-120, 2. не включаючи проміжок 200-600.
select * from book
where numOfPages between  120 and 250;

select * from book
where numOfPages not between  300 and 600;

-- 3 запити на видалення книжки(за id, name, isbn)
delete from book
where id = 3;

delete from book
where nameOfBook regexp "^Harry";

delete from book
where isbn = 251463;








