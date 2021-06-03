Use Library;


create table book(
id int auto_increment  not null primary key,
name varchar(120) not null,
description text,
date date not null default '2018-01-01',
category varchar(30) not null,
isbn   varchar(20)  not null,
amount_page int  not null,
name_author varchar(45) not null,
surname_author varchar(45) not null,
email_author varchar(50) not null,
age_author int not null,
date_author date not null,
authors_awards varchar(120) default null,
   
);


insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('Jon','good','2012-03-04','roman','ddd',200,'Kelvin','Bond','kelvin@gmail.com',30,'1991-02-05','Oscar');

insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('Garry','well','2002-11-04','comedy','ff',250,'Jine','Girs','girs@gmail.com',41,'1980-08-11','nothing');
             
insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('Alisa','so so ','2021-03-04','roman','zzz',230,'Hon','Bon','hon@gmail.com',39,'1982-01-01','nothing ');
             
insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('car','good','2012-03-04','roman','ddd',200,'Kelvin','Bond','kelvin@gmail.com',30,'1991-02-05','Oscar');
             
insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('Jon','good','2012-03-04','roman','ddd',200,'Kelvin','Bond','kelvin@gmail.com',30,'1991-02-05','Oscar');
             
insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('Jon','good','2012-03-04','roman','ddd',200,'Kelvin','Bond','kelvin@gmail.com',30,'1991-02-05','Oscar');
             
insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('Jon','good','2012-03-04','roman','ddd',200,'Kelvin','Bond','kelvin@gmail.com',30,'1991-02-05','Oscar');
             
insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('Bob','good','2011-03-04','roman','edc',200,'Kylin','Ker','ker@gmail.com',28,'1993-02-05','lampa');
             
insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('Inter','good','2012-03-04','roman','ddd',200,'Igor','Plish','plish@gmail.com',23,'1998-02-05','medal');
             
insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author,authors_awards)
values('celeb','very well ','2018-12-12','bred','lkj',234,'Soly','Pink','spink@gmail.com',35,'1987-02-05','Oscar');
             
insert into book(name,description,date,category,isbn,amount_page,name_author,
surname_author,email_author,age_author,date_author)
values('celeb','very well ','2018-12-12','bred','lkj',234,'Soly','Pink','spink@gmail.com',35,'1987-02-05');
             
  
	
	select * from book;
    select * from book where id=5 or id=10 or id =13;
    select * from book where amount_page>150;
    select * from book where age_author>30;
    select * from book where authors_awards is null;
    select * from book where email_author = 'plish@gmail.com';
    select * from book where isbn ='zzz';
    select * from book where category = 'bred';
    select * from book where age_author>25 and  amount_page>200;
    select * from book where category ='comedy' or category ='bred';
    select * from book order by name;
	select * from book order by email_author;
    select * from book order by amount_page desc;
    select distinct category from book;
    select distinct name_author from book;
    select * from book where date >'2000-01-01';
    select * from book where date<'2010-01-01';
    
    

    
    
    
    
    
    
             
