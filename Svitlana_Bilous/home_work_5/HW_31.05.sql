create database if not exists social_network;

use social_network;

create table if not exists user(
user_id int auto_increment primary key,
user_name varchar(30) not null,
user_surname varchar(50) not null,
user_age tinyint unsigned
);

create table if not exists account(
account_id int primary key,
login varchar(20) not null unique,
password varchar(40) not null,
foreign key(account_id) references user(user_id)
);

create table if not exists album(
album_id int auto_increment primary key,
album_title varchar(50),
number_of_photo int unsigned,
account_id int not null,
foreign key(account_id) references account(account_id)
);

create table if not exists photo(
photo_id int auto_increment primary key,
photo_title varchar(50),
photo_size varchar(100)
);

create table if not exists album_photo(
id_album int not null,
id_photo int not null,
constraint id primary key(id_album, id_photo),
foreign key(id_album) references album(album_id),
foreign key(id_photo) references photo(photo_id)
);

create table if not exists message(
message_id int auto_increment primary key,
message_text text not null,
account_id int not null,
foreign key(account_id) references account(account_id)
);

insert into user(user_name, user_surname, user_age) values
('Petro', 'Petriv', 18),
('Vasya', 'Vasyltsiv', null),
('Mark', 'Twen', 90),
('Sonya', 'Hide', 43),
('Ben', 'Kors', 33),
('Borys', 'Lalal', 57);

insert into account values
(1, 'pet', 'password'),
(3, 'test', 'test23'),
(4, 'sonya_43', '12345'),
(6, 'borya', 'lalal');

insert into album(album_title, number_of_photo, account_id) values
('Nature', 4, 1),
('Family', 3, 4),
('Trip', 7, 4),
('Private', 2, 6);

insert into photo(photo_title, photo_size) values
('Tree', 45),
('Test', 108),
('Flower field', 67),
('Maldives', 78),
('Son', 78),
('My honey', 87),
('Milan', 98),
('Park', 34),
('Me', 56);

insert into album_photo values
(1, 1),
(1, 3),
(1, 4),
(1, 8),
(2, 5),
(2, 4),
(2, 9),
(2, 7),
(3, 4),
(3, 7),
(3, 8),
(4, 2),
(4, 6),
(4, 4),
(4, 5),
(4, 9);

insert into message(message_text, account_id) values
('Hi Petro', 1),
('How are you?', 1),
('Happy Birthday', 1),
('Test', 3),
('One more test', 3),
('Have a great day', 4),
('1001 roses', 4),
('Join us', 4),
('Good evening Borya', 6),
('Your surname is so wierd...', 6),
('Bye.. see you later', 6);

select user_id, user_name, user_surname, user_age from user 
left join account on user.user_id = account.account_id where account.account_id is null;

select message_text from message where account_id = 1;

select message_text from account join message on account.account_id = message.account_id where account.login = 'test';

select message_text from user join message on user.user_id = message.account_id where user.user_name = 'Petro';

select user_name, user_surname, count(*) as message_qty from user 
join message on user.user_id = message.account_id group by user.user_id;

select account_id, login, password from user 
join account on user.user_id = account.account_id where user.user_name = 'Borys' and user.user_surname = 'Lalal';

select album_title, number_of_photo from account join album on account.account_id = album.account_id where account.login = 'sonya_43';

select count(*) as album_qty from user join album on user.user_id = album.account_id where user.user_name = 'Petro';

select photo_title, photo_size from photo 
join album_photo on photo.photo_id = album_photo.id_photo 
join album on album_photo.id_album = album.album_id where album.album_id = 3;

select photo_title, photo_size from photo 
join album_photo on photo.photo_id = album_photo.id_photo 
join album on album_photo.id_album = album.album_id where album.album_title = 'Nature';

select photo_title, photo_size from photo 
join album_photo on photo.photo_id = album_photo.id_photo 
join album on album_photo.id_album = album.album_id 
join user on album.account_id = user.user_id where user.user_name = 'Petro';