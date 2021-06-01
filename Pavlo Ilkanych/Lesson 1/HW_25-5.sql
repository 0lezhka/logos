CREATE DATABASE IF NOT EXISTS library;
USE library;

CREATE TABLE book(
name1 varchar(120) NOT NULL,
description1 varchar(300) DEFAULT "Discription is empty.",
dateOfPublication DATE DEFAULT "2018-01-01" NOT NULL,
author varchar(60) NOT NULL,
category varchar(30) NOT NULL
);

INSERT INTO book(name1, description1, dateOfPublication, author, category)
VALUES
("Harry Potter 1", "some description", "2000-01-01", "J. K. Rowling", "fantasy"),
("Harry Potter 1", "some description", "2001-01-01", "J. K. Rowling", "fantasy"),
("Harry Potter 1", "some description", "2002-01-01", "J. K. Rowling", "fantasy"),
("Harry Potter 1", "some description", "2005-01-01", "J. K. Rowling", "fantasy"),
("Harry Potter 1", "some description", "2006-01-01", "J. K. Rowling", "fantasy"),
("Harry Potter 1", "some description", "2007-01-01", "J. K. Rowling", "fantasy"),
("Harry Potter 1", "some description", "2009-01-01", "J. K. Rowling", "fantasy"),
("Lord Of The Ring", "blabla", "1954-01-01", "John Ronald Reuel Tolkien", "fantasy");


USE library;
SELECT * FROM book;