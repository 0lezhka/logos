-- витягнути всі книжки
-- + змінити прізвище автора в 2х книжках
-- + підрахувати кількість книжок, в яких автори мають нагороди
-- + вивести інформацію про книжку з найменшою кількістю сторінок
-- + вивести максимальну кількість сторінок
-- + вивести середню ціну книжки
-- + порахувати суму книжок за категорією
-- + вивести мінімальну ціну книжки
-- + вивести інформацію про книжку з найменшою ціною
-- + написати 3 запити, використавши різні види пошуку за співпадіннями(like)
-- + вивести книжки де ціна на проміжку: 1. 50-120, 2. не включаючи проміжок 200-600.
-- 3 запити на видалення книжки(за id, name, isbn)
-- Cпробувати змінити назву колонок, деякі записи з бази даних
-- Спробувати видалити деякі записати з БД.

use book;

select * from book.book;

UPDATE book SET name_autor = 'Ігор' WHERE (book_id = '7');
UPDATE book SET name_autor = 'Alex' WHERE (book_id = '5');

select * from book where number_pages = (select min(number_pages) from book);

select max(number_pages) from book;

select avg(price) from book;

SELECT COUNT(*) FROM book WHERE category = 'Програмування';

select min(price) from book;

select * from book where price = (select min(price) from book);

SELECT * FROM book WHERE isbn LIKE '%ІЛ%';

select * from book where number_pages like '13%';

select * from book where number_pages like '56_';

select * from book where price between '40' and '100';

select * from book where price not between 40 and 100;

DELETE FROM book.book WHERE (book_id = '10');

DELETE FROM book.book WHERE (isbn = 'ІМ-0011678');

delete from book where name_book = 'Філософія Java';




