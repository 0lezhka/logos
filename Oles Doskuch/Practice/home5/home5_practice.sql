create database social_network;
use social_network;

create table user(
user_id int auto_increment not null primary key,
user_name varchar(25),
user_surname varchar (25),
user_age int not null
);


create table account (
account_id  int auto_increment not null  primary key,
login varchar (30) default 'Noname',
password varchar (20),
foreign key(account_id) references user(user_id)
);


create table album(
album_id int not null primary key,
title varchar(30),
number_of_foto int not null,
id_account int ,
foreign key(id_account) references account(account_id)

);



create table photo(
photo_id int  not null primary key ,
title varchar(30),
size int
);

create  table album_photo(
id_album int,
id_photo int,
primary key (id_album,id_photo),
foreign key(id_album) references album(album_id),
foreign key(id_photo) references photo(photo_id)

);



create table message(
message_id int primary key,
text text not null,
id_account int ,
foreign key(id_account) references account(account_id)
);
