create database social_network;
use social_network;
create table social_network.user(
user_id int,
user_name varchar(30),
user_surname varchar(50),
user_age tinyint,
primary key (user_id)
);
create table social_network.account(
account_id int,
login varchar(20),
password varchar(40),
foreign key(account_id) references user(user_id),
primary key (account_id)
);
create table social_network.message(
message_id int,
message_text text,
account_id int,
foreign key(account_id) references account(account_id),
primary key(message_id)
);
create table social_network.album(
album_id int,
album_title varchar(50),
number_of_photo int,
account_id int,
foreign key(account_id) references account(account_id),
primary key(album_id)
);
create table social_network.photo(
photo_id int,
photo_title varchar(50),
photo_size varchar(100),
primary key (photo_id)
);
create table social_network.album_photo(
album_id int,
photo_id int,
foreign key (album_id) references album(album_id),
foreign key (photo_id) references photo(photo_id),
primary key (album_id, photo_id)
);
insert into user values
(1, 'Name1', 'Surname1', 23),
(2, 'Name2', 'Surname2', 75),
(3, 'Name3', 'Surname3', 35),
(4, 'Name4', 'Surname4', 38),
(5, 'Name5', 'Surname5', 12),
(6, 'Name6', 'Surname6', 54),
(7, 'Name7', 'Surname7', 49);
insert into account  values
(1, 'login1', 'password1'),
(2, 'login2', 'password2'),
(3, 'login3', 'password3'),
(4, 'login4', 'password4'),
(5, 'login5', 'password5');
insert into message values
(11, 'text1', 1),
(221, 'text2_1', 2),
(222, 'text2_2', 2),
(331, 'text3_1', 3),
(332, 'text3_2', 3),
(333, 'text3_3', 3),
(44, 'text4', 4);
insert into album values
(111, 'title1_1', 5,  1),
(112, 'title1_2', 5,  1),
(113, 'title1_3', 5,  1),
(222, 'title2', 10, 2),
(333, 'title3', 77, 3),
(444, 'title4', 200, 4);
insert into photo values
(1111, 'title1', 'size1'),
(2222, 'title2', 'size2'),
(3333, 'title3', 'size3'),
(4444, 'title4', 'size4'),
(5555, 'title5', 'size5'),
(6666, 'title6', 'size6'),
(7777, 'title7', 'size7'),
(8888, 'title8', 'size8');
insert into album_photo values
(111, 1111),
(222, 2222),
(222, 3333),
(333, 4444),
(333, 5555),
(333, 6666),
(444, 7777),
(444, 8888),
(444, 1111),
(444, 2222);
select*from user left join account on user_id = account_id 
where account.account_id is null;
select message_text from account inner join message on account.account_id = message.account_id 
where account.account_id = 2;
select message_text from account inner join message on account.account_id = message.account_id 
where login='login3';
select message_text from (user 
inner join account on user_id = account_id) 
inner join message on account.account_id = message.account_id
where user_name = 'Name2';
select user_name, count(message.message_text) from 
(user inner join account on user_id = account_id) 
inner join message on account.account_id = message.account_id group by user_name;
select account_id, login, password from user 
inner join account on user_id = account_id
where user_name = 'Name2';
select album_id, album_title from (user 
inner join account on user_id = account_id) 
inner join album on account.account_id = album.account_id
where user_name = 'Name1';
select photo.photo_id, photo.photo_title from album inner join (album_photo 
inner join photo on album_photo.photo_id = photo.photo_id)
on album.album_id = album_photo.album_id
where album.album_id = 222;
select photo.photo_id, photo.photo_title from album inner join (album_photo 
inner join photo on album_photo.photo_id = photo.photo_id)
on album.album_id = album_photo.album_id
where album.album_title = 'title2';
select photo.photo_id, photo.photo_title from user
inner join (account inner join (album inner join (album_photo 
inner join photo on album_photo.photo_id = photo.photo_id)
on album.album_id = album_photo.album_id) 
on account.account_id = album.account_id) 
on account.account_id = user_id
where user_name = 'Name3';