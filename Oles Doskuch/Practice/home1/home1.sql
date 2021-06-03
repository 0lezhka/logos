   USE Library;

   create table books(
   id int auto_increment not null primary key,
   name varchar(120) not null,
   description varchar(150) default 'not description',
   date datetime default '2018-01-01',
   author varchar(60) not null,
   category varchar(30) not null,

        );
 
     insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');
     insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');
     insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');
     insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');
     insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');
     insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');
     insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');
     insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');
	   insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');
     insert into books (name,description,date,author,category) values ('film1','good','2010-02-02','Jon','roman');

     SELECT * FROM Library.books;
     