use library;

select * from book;
update book set author_last_name='Didula' where book.id in (3, 7);
select count(*) from book where author_awards is not null;
select * from book where pages_number=(select min(pages_number) from book);
select max(pages_number) from book;
select avg(pages_number) from book;
select sum(pages_number) from book group by category; 
select min(author_age) from book;
select * from book where author_age=(select min(author_age) from book);
select * from book where book_name like '%7%';
select * from book where book_name like '__p%';
select * from book where author_first_name like 'Ste%';
select book_name from book where price_in_UAH between 50 and 120;
select book_name from book where price_in_UAH not between 200 and 600;
delete from book where id=9;
delete from book where book_name='1984';
delete from book where isbn='1234567890';