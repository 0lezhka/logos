create database if not exists library;

use library;

create table if not exists book(
title varchar(120) not null,
description varchar(500) default 'Description does not exist',
publication_date date not null default '2018-01-01',
author varchar(60) not null,
category varchar(30) not null
);

insert into book(title, description, publication_date, author, category)
values ('In Search of Lost Time', 'Swanns Way, the first part of A la recherche de temps perdu, 
Marcel Prousts seven-part cycle. In it, Proust introduces the themes that run through the entire work. 
The narrator recalls his childhood, aided by the famous madeleine; and describes M. Swanns passion for 
Odette. The work is incomparable. Edmund Wilson said: Proust has supplied for the first time in literature 
an equivalent in the full scale for the new theory of modern physics.', '1913-05-12','Marcel Proust', 'novel'),
('Pride and Prejudice', 'It is a truth universally acknowledged that when most people think of Jane Austen they 
think of this charming and humorous story of love, difficult families and the tricky task of finding a handsome 
husband with a good fortune.', '1813-09-10', 'Jane Austen', 'love story'),
('One Hundred Years of Solitude', 'Magic realism at its best. Both funny and moving, this book made me reflect 
for weeks on the inexorable march of time.', '1967-02-02', 'Gabriel García Márquez', 'opus'),
('Crime and Punishment', 'This novel is a masterful and completely captivating depiction of a man experiencing 
a profound mental unravelling. No amount of ethical bargaining on Raskolnikov’s part can free him from the 
parasitic guilt nested in his soul. A brilliant read if you loved Breaking Bad.', '1866-07-01', 'Fyodor Dostoevsky', 'novel'),
('Ulysses', default, default, 'James Joyce', 'short story'),
('The Lion, the Witch and the Wardrobe', default, '1950-12-18', 'C.S. Lewis', 'fantasy'),
('The Master and Margarita', default, '1966-03-08', 'Mikhail Bulgakov', 'novel'),
('The Grapes of Wrath', default, default, 'John Steinbeck', 'novel'),
('The Adventures of Huckleberry Finn by Mark Twain (1884)', 'Meander down the Mississippi River with Huck Finn and Tom Sawyer; 
on the surface, it’s a simple adventure but dig a little deeper into Mark Twains novel and discover undercurrents of 
slavery, abuse and corruption.', '1884-10-15', 'Mark Twain', 'adventure'),
('One Flew Over the Cuckoos Nest', 'A psychiatric ward in Oregon is ruled by a tyrannical head nurse, but 
when a rebellious patient arrives her regime is thrown into disarray. A story of the imprisoned battling the 
establishment.', '1962-01-21', 'Ken Kesey', 'psychology thriller');

select * from book;