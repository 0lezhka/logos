create database library;
use library;
create table library.book(
title varchar(120) not null,
description varchar(10000) default "No description",
publication_date date not null default "2018-01-01",
author varchar(60) not null,
category varchar(30) not null
);
insert into book
values ("title1", "description1", "2011-09-09", "Author1", "category1"),
	("title2", "description2",  "2011-09-09", "Author2", "category2"),
	("title3", "description3", "2011-09-09", "Author3", "category3"),
    ("title4", "description4", "2011-09-09", "Author4", "category4"),
    ("title5", "description5", "2011-09-09", "Author5", "category5");
insert into book(title, author, category)
values ("Title6", "Author6", "category6");
insert into book(title, description, author, category)
values ("Title7", "descroption7", "Author7", "category6");