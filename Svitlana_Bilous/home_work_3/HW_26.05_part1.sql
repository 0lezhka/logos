create database if not exists library;

use library;

create table if not exists book(
id int not null auto_increment primary key,
title varchar(120) not null,
description text,
publication_date date not null default '2018-01-01',
category varchar(30) not null,
isbn varchar(20) not null unique,
qty_pages smallint unsigned not null,
price  smallint unsigned not null,
author_name varchar(45) not null,
author_surname varchar(45) not null,
author_email varchar(50) not null unique,
author_age tinyint unsigned not null,
author_birthdate date not null,
author_awards varchar(120)
);

insert into book (title, description, publication_date, category, isbn, qty_pages, price, author_name, 
author_surname, author_email, author_age, author_birthdate, author_awards) values
('In Search of Lost Time', 'Swanns Way, the first part of A la recherche de temps perdu, 
Marcel Prousts seven-part cycle. In it, Proust introduces the themes that run through the entire work. 
The narrator recalls his childhood, aided by the famous madeleine; and describes M. Swanns passion for 
Odette. The work is incomparable. Edmund Wilson said: Proust has supplied for the first time in literature 
an equivalent in the full scale for the new theory of modern physics.', '1913-05-12', 'novel', '0812969642', 
4211, 50, 'Marcel', 'Proust', 'prust@gmail.com', 51, '1871-07-10', null),
('Pride and Prejudice', 'It is a truth universally acknowledged that when most people think of Jane Austen they 
think of this charming and humorous story of love, difficult families and the tricky task of finding a handsome 
husband with a good fortune.', '1813-09-10', 'love story', '9780141439518', 480, 32, 'Jane', 'Austen', 'austen@gmail.com',
41, '1775-12-16', null),
('One Hundred Years of Solitude', 'The multi-generational story of the Buendía family, whose patriarch, José Arcadio 
Buendía, founded the (fictitious) town of Macondo. The novel is often cited as one of the supreme achievements in 
literature.', '1967-02-02', 'opus', '0060883286', 417, 45, 'Gabriel', 'García Márquez', 'marquez@gmail.com', 87, '1927-03-06',
'1980 - Mexican Cinema Journalists; 1982 - Nobel Prize'),
('Crime and Punishment', 'This novel is a masterful and completely captivating depiction of a man experiencing 
a profound mental unravelling. No amount of ethical bargaining on Raskolnikov’s part can free him from the 
parasitic guilt nested in his soul. A brilliant read if you loved Breaking Bad.', '1866-07-01', 'novel', '9781784871970', 
560, 57, 'Fyodor', 'Dostoevsky', 'dostoevsky@gmail.com', 59, '1881-02-09', null),
('Ulysses', 'James Joyces masterpiece, Ulysses, tells of the diverse events which befall Leopold Bloom and Stephen 
Dedalus in Dublin on one day in June 1904. It is considered to be one of the most important works of modernist 
literature and was hailed as a work of genius by W. B. Yeats, T. S. Eliot and Ernest Hemingway. Scandalously frank, 
wittily erudite, mercurially eloquent, resourcefully comic and generously humane, Ulysses offers the reader a 
life-changing experience.', '1904-06-16', 'novel', '9781857151008', 1144, 71, 'James', 'Joyce', 'joyce@gmail.com', 58, '1882-02-02',
'1989 - USC Scripter Award'),
('The Lion, the Witch and the Wardrobe', 'Most of the novel is set in Narnia, a land of talking animals and mythical creatures 
that is ruled by the evil White Witch. In the frame story, four English children are relocated to a large, old country house 
following a wartime evacuation. The youngest, Lucy, visits Narnia three times via the magic of a wardrobe in a spare room. Lucys 
three siblings are with her on her third visit to Narnia. In Narnia, the siblings seem fit to fulfill an old prophecy and find 
themselves adventuring to save Narnia and their own lives. The lion Aslan gives his life to save one of the children; he later 
rises from the dead, vanquishes the White Witch, and crowns the children Kings and Queens of Narnia.', '1950-12-18', 'fantasy', 
'9780064404990', 208, 29, 'Clive Staples', 'Lewis', 'lewis@gmail.com', 64, '1898-11-29', '2006 - Hugo Awards'),
('The Master and Margarita', 'This ribald, carnivalesque satire - featuring the Devil, true love and a gun-toting cat - was 
written in the darkest days of the Soviet Union and became an underground sensation.', '1966-03-08', 'novel', '9780241259320',
528, 40, 'Mikhail', 'Bulgakov', 'bulgakov@gmail.com', 48, '1891-05-15', null),
('The Grapes of Wrath', 'Set during the Great Depression, the novel focuses on the Joads, a poor family of tenant farmers driven 
from their Oklahoma home by drought, economic hardship, agricultural industry changes, and bank foreclosures forcing tenant 
farmers out of work. Due to their nearly hopeless situation, and in part because they are trapped in the Dust Bowl, the Joads 
set out for California along with thousands of other "Okies" seeking jobs, land, dignity, and a future.', '1939-04-14', 'novel', 
'9780241980347', 544, 70, 'John', 'Steinbeck', 'steinback@gmail.com', 66, '1902-02-27', '1945 - Academy Awards, USA; 1962 - Nobel Prize'),
('The Adventures of Huckleberry Finn', 'Meander down the Mississippi River with Huck Finn and Tom Sawyer; 
on the surface, it’s a simple adventure but dig a little deeper into Mark Twains novel and discover undercurrents of 
slavery, abuse and corruption.', '1884-10-15', 'adventure', '9780141199009', 336, 31, 'Mark', 'Twain', 'twain@gmail.com', 74, '1835-11-30', null),
('One Flew Over the Cuckoos Nest', 'A psychiatric ward in Oregon is ruled by a tyrannical head nurse, but when a rebellious 
patient arrives her regime is thrown into disarray. A story of the imprisoned battling the establishment.', '1962-01-21', 
'psychology thriller', '0451163966', 272, 87, 'Ken', 'Kesey', 'kesey@gmail.com', 66, '1935-09-17', null);

select * from book;
update book set author_surname = 'Anonymous' where id in (3, 5);
select count(author_awards) as Authors_with_awards_quantity from book;
select * from book where qty_pages = (select min(qty_pages) from book);
select max(qty_pages) from book;
select avg(price) from book;
select count(*) as novel_quantity from book where category = 'novel';
select sum(price) as novel_total_price from book where category = 'novel';
select min(price) from book;
select * from book where price = (select min(price) from book);
select * from book where title like 'the%';
select * from book where description like '%adventure%';
select * from book where author_name like '____';
select * from book where price between 50 and 120;
select * from book where price not between 200 and 600;
delete from book where id = 7;
delete from book where title = 'Ulysses';
delete from book where isbn = '0812969642';

alter table book rename column author_birthdate to author_date_of_birth;
alter table book modify column isbn decimal(13);
update book set price = price + 10 where author_awards is not null; 

drop table book;