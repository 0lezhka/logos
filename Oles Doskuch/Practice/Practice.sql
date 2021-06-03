create database Practice;
use Practice;

create table user(
user_id int  primary key not null,
user_name varchar(30),
user_surname varchar(50),
user_age tinyint
);

insert into user values(1,'Taras','Shved',24);
insert into user values(2,'Petro','Kozak',40);
insert into user values(3,'Ostap','Bah',23);
insert into user values(4,'Oleg','Liko',28);
insert into user values(5,'Stas','Dub',38);
insert into user values(6,'Slavik','Busko',26);


create table account(
account_id  int  primary key not null,
login varchar(20),
password varchar(40),
foreign key(account_id) references user(user_id)
);

insert into account values(1,'Tarik','1234');
insert into account values(2,'Petro','5678');
insert into account values(3,'Ostriv','91011');
insert into account values(4,'Olg','121314');


create table message(
message_id int  not null primary key,
message_text text,
account_id int,
foreign key(account_id) references account(account_id)
);

insert into message values (1,'Hello',1);
insert into message values (2,'How are you?',1);
insert into message values (3,'Where are you?',3);
insert into message values (4,'What are you doing?',4);
insert into message values (5,'Okay',4);
insert into message values (6,'so so',2);

create table album(
album_id int  not null primary key,
album_title varchar(50),
number_of_photo int,
account_id int,
foreign key (account_id) references account(account_id)
);

insert into album values(1,'title1',1,1);
insert into album values(2,'title2',2,1);
insert into album values(3,'title3',1,2);
insert into album values(4,'title4',1,3);
insert into album values(5,'title5',1,4);
insert into album values(6,'title3',1,2);


create table photo(
photo_id int primary key,
photo_title varchar(50),
photo_size varchar(100)
);

insert into photo values(1,'title1','size1');
insert into photo values(2,'title2','size2');
insert into photo values(3,'title3','size3');
insert into photo values(4,'title4','size4');
insert into photo values(5,'title3','size4');


create table album_photo(
id_album int ,
id_photo int,
primary key(id_album,id_photo),
foreign key(id_album) references album(album_id),
foreign key(id_photo) references photo(photo_id)

);
insert into album_photo values (1,1);
insert into album_photo values (1,2);
insert into album_photo values (1,3);
insert into album_photo values (3,3);
insert into album_photo values (2,4); 
insert into album_photo values (3,5); 





select * from user  left join account on user.user_id = account.account_id;
select * from user  left join account on  account.account_id is null; -- 1
select account.account_id,message.message_text from account right join message  on account.account_id =message.account_id where message.account_id =1; -- 2
select account.login,message.message_text from account right join message  on account.account_id =message.account_id where account.login='Petro'; -- 3
select user.user_name, message.message_text from user right join message on user.user_id=message.account_id where user.user_name='Oleg';    -- 4
select user.user_name,count(message.message_text) from user left join message on user.user_id=message.account_id group by user.user_name; -- 5
select * from account left join user on account.account_id = user.user_id where user.user_name ='Ostap' and user.user_surname ='Bah'; -- 6
select album.album_title,album.number_of_photo,account.login -- 7
from album left join account on album.account_id = account.account_id where account.login='Tarik';    
select user.user_name, count(album.album_title) from album -- 8
left join user on album.account_id=user.user_id where user.user_name ='Taras' group by user.user_name; 
select photo_id,photo_title,photo_size,id_album,album_title from photo left join album_photo on photo_id = id_photo -- 9
inner join album on album_id =id_album where album_id=3;
select photo_id ,photo_title,photo_size ,album_id,album_title from photo left join album_photo on photo.photo_id = album_photo.id_photo -- 10
inner join album on album.album_id=album_photo.id_album where album.album_title ='title1'; 
select photo_id ,photo_title,login,photo_size from photo left join album_photo on photo_id =id_photo inner join album on album_id =id_album -- 11
inner join account on account.account_id =album.account_id where login='Petro'; 




