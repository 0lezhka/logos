create database if not exists library;
drop database library;
use library;

create table if not exists category(
category_id int auto_increment primary key,
genre varchar(30) not null unique
);

create table if not exists book(
book_id int auto_increment primary key,
title varchar(120) not null,
description text,
price smallint unsigned not null,
isbn varchar(20) not null unique,
category_id int not null,
foreign key(category_id) references category(category_id)
);

create table if not exists author(
author_id int auto_increment primary key,
author_name varchar(45) not null,
author_surname varchar(45) not null,
author_email varchar(50) not null unique,
author_birthdate date not null
);

create table if not exists book_author(
book_id int not null,
author_id int not null,
constraint id primary key(book_id, author_id),
foreign key(book_id) references book(book_id),
foreign key(author_id) references author(author_id)
);

insert into category(genre) values
('novel'),
('love story'),
('opus'),
('fantasy'),
('adventure'),
('psychology thriller');

insert into book (title, description, price, isbn, category_id) values
('In Search of Lost Time', 'Swanns Way, the first part of A la recherche de temps perdu, 
Marcel Prousts seven-part cycle. In it, Proust introduces the themes that run through the entire work. 
The narrator recalls his childhood, aided by the famous madeleine; and describes M. Swanns passion for 
Odette. The work is incomparable. Edmund Wilson said: Proust has supplied for the first time in literature 
an equivalent in the full scale for the new theory of modern physics.', 50, '0812969642', 1),
('Pride and Prejudice', 'It is a truth universally acknowledged that when most people think of Jane Austen they 
think of this charming and humorous story of love, difficult families and the tricky task of finding a handsome 
husband with a good fortune.', 41, '9780141439518', 2),
('One Hundred Years of Solitude', 'The multi-generational story of the Buendía family, whose patriarch, José Arcadio 
Buendía, founded the (fictitious) town of Macondo. The novel is often cited as one of the supreme achievements in 
literature.', 45, '0060883286', 3),
('Crime and Punishment', 'This novel is a masterful and completely captivating depiction of a man experiencing 
a profound mental unravelling. No amount of ethical bargaining on Raskolnikov’s part can free him from the 
parasitic guilt nested in his soul. A brilliant read if you loved Breaking Bad.', 57, '9781784871970', 1),
('Ulysses', 'James Joyces masterpiece, Ulysses, tells of the diverse events which befall Leopold Bloom and Stephen 
Dedalus in Dublin on one day in June 1904. It is considered to be one of the most important works of modernist 
literature and was hailed as a work of genius by W. B. Yeats, T. S. Eliot and Ernest Hemingway. Scandalously frank, 
wittily erudite, mercurially eloquent, resourcefully comic and generously humane, Ulysses offers the reader a 
life-changing experience.', 58, '9781857151008', 1),
('The Lion, the Witch and the Wardrobe', 'Most of the novel is set in Narnia, a land of talking animals and mythical creatures 
that is ruled by the evil White Witch. In the frame story, four English children are relocated to a large, old country house 
following a wartime evacuation. The youngest, Lucy, visits Narnia three times via the magic of a wardrobe in a spare room. Lucys 
three siblings are with her on her third visit to Narnia. In Narnia, the siblings seem fit to fulfill an old prophecy and find 
themselves adventuring to save Narnia and their own lives. The lion Aslan gives his life to save one of the children; he later 
rises from the dead, vanquishes the White Witch, and crowns the children Kings and Queens of Narnia.', 29, '9780064404990', 4),
('The Master and Margarita', 'This ribald, carnivalesque satire - featuring the Devil, true love and a gun-toting cat - was 
written in the darkest days of the Soviet Union and became an underground sensation.', 40, '9780241259320', 1),
('The Grapes of Wrath', 'Set during the Great Depression, the novel focuses on the Joads, a poor family of tenant farmers driven 
from their Oklahoma home by drought, economic hardship, agricultural industry changes, and bank foreclosures forcing tenant 
farmers out of work. Due to their nearly hopeless situation, and in part because they are trapped in the Dust Bowl, the Joads 
set out for California along with thousands of other "Okies" seeking jobs, land, dignity, and a future.', 70, '9780241980347', 1),
('The Adventures of Huckleberry Finn', 'Meander down the Mississippi River with Huck Finn and Tom Sawyer; 
on the surface, it’s a simple adventure but dig a little deeper into Mark Twains novel and discover undercurrents of 
slavery, abuse and corruption.', 31, '9780141199009', 5),
('One Flew Over the Cuckoos Nest', 'A psychiatric ward in Oregon is ruled by a tyrannical head nurse, but when a rebellious 
patient arrives her regime is thrown into disarray. A story of the imprisoned battling the establishment.', 87, '0451163966', 6);

insert into author(author_name, author_surname, author_email, author_birthdate) values
('Marcel', 'Proust', 'prust@gmail.com', '1871-07-10'),
('Jane', 'Austen', 'austen@gmail.com', '1775-12-16'),
('Gabriel', 'García Márquez', 'marquez@gmail.com', '1927-03-06'),
('Fyodor', 'Dostoevsky', 'dostoevsky@gmail.com', '1881-02-09'),
('James', 'Joyce', 'joyce@gmail.com', '1882-02-02'),
('Clive Staples', 'Lewis', 'lewis@gmail.com', '1898-11-29'),
('Mikhail', 'Bulgakov', 'bulgakov@gmail.com', '1891-05-15'),
('John', 'Steinbeck', 'steinback@gmail.com', '1902-02-27'),
('Mark', 'Twain', 'twain@gmail.com', '1835-11-30'),
('Ken', 'Kesey', 'kesey@gmail.com', '1935-09-17');

insert into book_author(book_id, author_id) values
(1, 1),
(1, 5),
(2, 2),
(3, 3),
(3, 7),
(4, 4),
(5, 5),
(5, 10),
(6, 6),
(7, 7),
(8, 8),
(8, 2),
(9, 9),
(10, 5),
(10, 10);

select book.title, book.price, category.genre from book left join category on book.category_id = category.category_id where book.price < 50;

select book.title, author.author_name, author.author_surname from book join book_author on book.book_id = book_author.book_id join author on book_author.author_id = author.author_id where book.category_id = 1;

select author.author_surname, author.author_birthdate, book.title, category.genre, book.price from author join book_author on author.author_id = book_author.author_id join book on book_author.book_id = book.book_id join category on book.category_id = category.category_id order by author_birthdate;