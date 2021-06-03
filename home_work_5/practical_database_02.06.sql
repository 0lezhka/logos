drop database if exists messenger;
create database messenger;
use messenger;

create table if not exists user(
	user_id int unique auto_increment primary key,
    user_name varchar(30) not null,
	user_surname varchar(50) not null,
    user_age tinyint);
    
create table if not exists account(
	account_id int unique primary key,
    login varchar(20) not null,
    password varchar(40),
    foreign key(account_id) references user(user_id));
    
create table if not exists message(
	message_id int unique auto_increment primary key,
    message_text text not null,
    account_id int not null,
    foreign key(account_id) references account(account_id));
    
create table if not exists album(
	album_id int unique auto_increment primary key,
    album_title varchar(50),
    number_of_photos int,
    account_id int not null,
    foreign key(account_id) references account(account_id));
    
create table if not exists photo(
	photo_id int unique auto_increment primary key,
    photo_title varchar(50),
    photo_size varchar(100));
    
create table if not exists album_photo(
	id_album int,
    id_photo int,
    primary key(id_album, id_photo),
	foreign key(id_album) references album(album_id),
    foreign key(id_photo) references photo(photo_id));
    
insert into user(user_name, user_surname, user_age) values
	('Софія', 'Дідула', 18),
	('Борис', 'Лалал', 37),
	('Петро', 'Орищак', 18),
	('Вікторія', 'Гордієнко', 19),
    ('Олександр', 'Чигрин', 18);
    
insert into account(account_id, password, login) values
	(1, 12340987, 'sonia_43'),
	(3, 654739287, 'bigWave'),
	(2, 3229730717, 'test'),
	(4, 647483, 'humbleman');

insert into message(message_text, account_id) values
	('hello, i`m team lead of SMART Jaegers', 3),
	('go cs', 3),
	('go citadeli', 1),
	('vechir v chatu, status v radist', 2),
    ('ви вже робили ос?)', 1),
    ('агонь', 2),
    ('Стартуємо з випускниками 2гого курсу', 2);
    
insert into album(album_title, number_of_photos, account_id) values
	('SencyCry', 3, 1),
	('SencyCry', 3, 3),
    ('Nature', 1, 3),
    ('CheckFuel', 2, 1),
    ('Mentors', 2, 2),
    ('Jury', 3, 2),
    ('Iot', 1, 4);
    
insert into photo(photo_title, photo_size) values
	('ESP32', '9mb'),
	('ODROID', '6mb'),
	('RaspberryPi zero', '8mb'),
    ('Klochnyk', '7mb'),
    ('Klymenko', '7mb'),
    ('Veselovskiy', '10mb');
    
insert into album_photo(id_photo, id_album) values
	(1, 1),		(1, 2),		(3, 3),    (3, 4),
    (5, 1),    (5, 3),    (2, 7),    (2, 2),
    (4, 5),    (4, 6),    (4, 7),    (5, 5),
    (5, 7),    (6, 5),    (6, 6),    (3, 2);
