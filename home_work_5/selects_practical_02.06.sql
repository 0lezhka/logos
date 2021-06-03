select user_name, user_surname, user_age from user left join account on user_id=account.account_id
where account_id is null;

select message_text from message where account_id=1;

select message_text from message inner join account on message.account_id=account.account_id where login='test';

select message_text from message inner join account on message.account_id=account.account_id
right join user on account.account_id=user.user_id
where user.user_name='Петро';

select user_name, user_surname, count(message_text) from message inner join account on message.account_id=account.account_id
right join user on account.account_id=user.user_id
group by user.user_id;

select login, password from account inner join user on account.account_id=user.user_id
where user.user_name='Борис' and user.user_surname='Лалал';

select album_title, number_of_photos from album inner join account on  album.account_id=account.account_id
where login='sonia_43';

select photo_title, photo_size from photo join album_photo on photo.photo_id=album_photo.id_photo
where album_photo.id_album=3;

select photo_title, photo_size from photo join album_photo on photo.photo_id=album_photo.id_photo
join album on album_photo.id_album=album.album_id
where album.album_title='Nature';

select photo_title, photo_size from photo join album_photo on photo.photo_id=album_photo.id_photo
join album on album_photo.id_album=album.album_id
join account on album.account_id=account.account_id
right join user on account.account_id=user.user_id
where user.user_name='Петро';