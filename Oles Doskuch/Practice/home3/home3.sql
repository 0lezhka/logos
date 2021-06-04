use library ;



	select * from book;

    
	    update book set name='Hand'  where name ='Alisa';
        delete from book  where id =6;
        update book set id=6 where id = 11;


    	select * from book; -- 1
        update book  set name_author ='Ray' where name_author in ('Jine' ,'Igor'); -- 2
        select sum(amount_page) from book where authors_awards is not null; -- 3
        select * from book where amount_page= (select min(amount_page )from book); -- 4
		select amount_page from book where amount_page= (select max(amount_page )from book); -- 5
		select  avg(amount_page) from book; -- 6
        
        alter table book add price int ;
        update book set price =100 where id =1;
	    update book set price =150 where id =2;
        update book set price =150 where id =3;
        update book set price =200 where id =4;
        update book set price =210 where id =5;
        update book set price =220 where id =6;
        update book set price =110 where id =7;
        update book set price =140 where id =8;
        update book set price =130 where id =9;
        update book set price =170 where id =10;
        
		select avg(price) from book ;
        select avg(price) from book  where category ='roman'; -- 7
        select price from book where price =(select min(price) from book); -- 8
		select * from book where price =(select min(price) from book); -- 9
        select * from book where price like 170; -- 10
		select * from book where name like 'Inter'; -- 10
        select * from book where surname_author like 'Pink'; -- 10
        select * from book where price between 50 and 100;  -- 11
	    select * from book where price between 201 and 601; -- 11
        
	    delete from book where id =1;     -- 12
        delete from book where name ='Inter'; -- 12
		delete from book where isbn ='zzz';  -- 12

