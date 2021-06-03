CREATE DATABASE IF NOT EXISTS library;
USE library;

CREATE TABLE book(
name1 varchar(150) NOT NULL,
description1 varchar(350) DEFAULT "Discription is empty.",
dateOfPublication DATE DEFAULT "2018-01-01" NOT NULL,
author varchar(100) NOT NULL,
category varchar(50) NOT NULL
);

INSERT INTO book(name1, description1, dateOfPublication, author, category)
VALUES
("The Wither Blood of Elves", "It's the book about Geralt and his friends", "1994-03-17", "Anjey Sapkoski", "fantasy"),
("The Wither Blood of Elves", "It's the book about Geralt and his friends", "1994-03-17", "Anjey Sapkoski", "fantasy"),
("The Wither Blood of Elves", "It's the book about Geralt and his friends", "1994-03-17", "Anjey Sapkoski", "fantasy"),
("The Wither Blood of Elves", "It's the book about Geralt and his friends", "1994-03-17", "Anjey Sapkoski", "fantasy"),
("The Wither Blood of Elves", "It's the book about Geralt and his friends", "1994-03-17", "Anjey Sapkoski", "fantasy"),
("The Wither Blood of Elves", "It's the book about Geralt and his friends", "1994-03-17", "Anjey Sapkoski", "fantasy"),
("The Wither Blood of Elves", "It's the book about Geralt and his friends", "1994-03-17", "Anjey Sapkoski", "fantasy");


SELECT * FROM book;
