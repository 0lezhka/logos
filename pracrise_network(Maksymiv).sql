create database network;
drop database network;
use network;
drop table user;


create table user(
user_id int primary key auto_increment,
user_name varchar(50),
user_surname varchar(50),
user_age int
);

create table account(
account_id int primary key auto_increment,
login varchar(30),
password varchar(30),
foreign key (account_id) references user(user_id)
);

create table message(
message_id int primary key auto_increment,
message_text text,
account_id int,
foreign key (account_id) references account(account_id)

);

create table album(
album_id int primary key auto_increment,
album_title varchar(50),
number_of_photo int,
account_id int,
foreign key (account_id) references account(account_id)
);

create table photo(
photo_id int primary key auto_increment,
photo_title varchar(50),
photo_size int
);

create table album_photo(
id_album int,
id_photo int,
foreign key (id_album) references album(album_id),
foreign key (id_photo) references photo(photo_id)
);


insert into user(user_name, user_surname, user_age)
values
("Dima1", "Maksymiv1", 19),
("Oleg1", "Em1", 32),
("Olga1", "Ras1h", 21),
("Petro1", "Mak1", 14);

insert into account(login, password)
values
("asdfas", "131qe"),
("lhkgfd", "34asdf"),
("xxcvcx", "sdf31"),
("qazzaq", "34x31");


insert into message(message_text, account_id)
values
("asdasdasdsad", 1),
("fhojokhgok4214oskg", 1),
("hi", 1),
("zzxzcxzczxc", 2),
("sfew3weefsdg444", 2),
("asda44112eqwfgthtr", 3),
("as", 3),
("sdsad", 3);





select * from user
inner join account
on user_id = account_id;

select * from account as a
left join message as m
on a.account_id = m.account_id;

select user_id, user_name, user_surname from user
left join account
on user_id = account_id
where password is null;

select message_text
from message
where account_id = 1;

select * from message as m
inner join account as a
on a.account_id = m.account_id
where a.login = "asdfas";

select * from message as m
inner join user as u
on m.account_id = u.user_id
where u.user_name = "Dima";

select count(message_text), account_id from message
group by account_id;


select * from account
inner join user
on account_id = user_id
where user_name = 'Dima1'
and user_surname = 'Maksymiv1';


select * from album as al
inner join account as ac
on ac.account_id = al.accont_id
where ac.login = 'sonia_43';

select count(*) as albums_num from album as al
inner join account as ac
on ac.account_id = al.account_id
inner join user 
on ac.account_id = user_id
where user_name = 'Dima1';

select photo_id, photo_title from photo
left join album on photo.photo_id = album.album_id
where album.album_id = 3;


select photo_id, photo_title from photo
left join album on photo.photo_id = album.album_id
where album.album_title = "Nature";


select photo_id, photo_title from photo
left join user on photo.photo_id = user.user_id
where user.user_name = "Петро";


