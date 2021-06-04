-- 1. Створити БД на тему - "Бібліотека". 
-- 2. Створити таблицю "книжка" з полями(
-- назва книги(не null, до 120 символів), 
-- опис(встановити default значення "Опис відсутній"), 
-- дата публікації(не null, default значення "2018-01-01"), 
-- автор(не null, до 60 символів), 
-- категорія(не null, до 30 символів)

-- 3. Добавити в цю таблицю 10 записів.

use book;
create table bookCase(
name_book varchar(120) not null,
description_book varchar(500) default 'Опис відсутній',
data_public date not null default '2018-01-01',
autor varchar(60) not null,
category varchar(30) not null
);

insert into bookCase (
	name_book,
    data_public,
    autor,
    book_id
)
value(
	'Изучаем C++ через программирование игр',
    default, 
    'Майкл Доусон',
    'Программирование',
    default
    );



 
