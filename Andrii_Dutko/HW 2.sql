-- 2. Створити таблицю "книжка" з полями(
-- -  Id not null primary key auto_increment
-- -  назва книги(не null, до 120 символів), 
-- - опис(потрібно подумати який тип даних), 
-- - дата публікації(не null, default значення "2018-01-01"),#date
-- - категорія(не null, до 30 символів),
-- - isbn (не null, до 20 символів, унікальний),
-- - кількість сторінок(не null)
-- - ім"я автора (не null, до 45 символів), 
-- - прізвище автора (не null, до 45 символів), 
-- - email автора (не null, до 50 символів, унікальне)
-- - вік автора(не null),
-- - нагороди автора(до 120 символів, якщо нема - то NULL)
use book;

create table book(
book_id int not null auto_increment primary key,
name_book varchar(120) not null,
description_book varchar(5000) not null default 'Опис відсутній',
data_publication date not null default '2018-01-01',
category varchar(30) not null,
isbn varchar(20) not null UNIQUE,
number_pages int not null,
name_autor varchar(45) not null,
last_name_autor  varchar(45) not null,
email_autor varchar(50) not null unique,
age_autor int not null,
awards_autor varchar(120)
);

insert into book
value(
	1,
    'Пришвидшений курс Python',
    'У цій книжці ви розглянете фундаментальні поняття програмування — змінні, списки, класи, цикли та інші, — й навчитеся писати чистий код за допомогою вправ до кожної теми. Ви також дізнаєтеся, як зробити програми інтерактивними та як безпечно тестувати код. А ще ознайомитеся із трьома чималими проєктами, у яких зможете застосувати нові знання на практиці: «Космічні прибульці», гра на кшталт старих аркад; візуалізації даних з використанням спеціальних бібліотек Python; простий вебзастосунок, який можна вивантажити в мережу.
	 Якщо ви справді хочете зрозуміти програмування, то «Пришвидшений курс Python» допоможе вам швидко перейти до реальних програм. Навіщо чекати? На старт, увага і... кодуймо!',
    '2008-09-09',
    'Програмування',
	'ІЛ-00002007',
	 1000,
	'Ерік',
	'Маттес',
	'ЕрікМаттес@gmail.com',
     68,
     null 
);

insert into book
value(
	default,
    'Чистий код. Створення і рефакторинг за допомогою Agile',
    'Навіть поганий програмний код може працювати. Однак якщо код не є «чистим», це завжди буде заважати розвитку проекту і компанії-розробника, віднімаючи значні ресурси на його підтримку і «приборкання». Ця книга присвячена хорошому програмуванню. У ній повно реальних прикладів коду. Прочитавши книгу, ви дізнаєтеся багато нового про коди. Більш того, ви навчитеся відрізняти хороший код від поганого. Ви дізнаєтеся, як писати хороший код і як перетворити поганий код у хороший.',
    '2005-07-03',
    'Програмування',
	'ІМ-00118678',
	 1500,
	'Роберт',
	'Мартін',
	'РобертМартін@gmail.com',
     58,
     null 
);

insert into book
value(
	default,
    'Чиста архітектура',
    'Користуючись універсальними правилами архітектури програмного забезпечення, можна значно підвищити продуктивність праці розробників протягом усього життєвого циклу будь-якої програмної системи. Легендарний майстер програмного забезпечення Роберт К. Мартін («Дядечко Боб») розкриває ці правила у своїй книжці «Чиста архітектура» і допомагає їх застосувати.',
    '2020-07-03',
    'Програмування',
	'ІМ-00117978',
	 1300,
	'Роберт',
	'Мартін',
	'МартінРоберт@gmail.com',
     58,
     null 
);

insert into book
value(
	default,
    'Head First. Патерни проєктування',
    '«Патерни проєктування» — ваша книжка, якщо вам хоч колись доводилося стикатися з проблемами дизайну програмного забезпечення. Вам не доведеться «винаходити колесо» — просто скористайтеся зведеним докупи величезним досвідом розробників і можливістю використовувати найкращі практики. Ви дізнаєтеся, навіщо потрібні патерни, побачите, як вони виглядають і працюють у «дикій природі»,',
    '2005-07-03',
    'Програмування',
	'ІМ-00096196',
	 1100,
	'Ерік',
	'Фрімен',
	'ЕрікФрімен@gmail.com',
     53,
     null 
);

insert into book
value(
	default,
    'Програмування мовою Python',
    'Книга присвячена мові програмування Python. На сьогодні це одна з найпопулярніших та найперспективніших мов. Вона проста, ефективна і красива. Книга допоможе читачеві познайомитися з мовою Python і навчитися використовувати її для написання професійних програм. Книга містить інформацію про особливості мови Python та необхідне програмне забезпечення.',
    '2019-06-01',
    'Програмування',
	'ІМ-00114362',
	 800,
	'Олексій',
	'Васильєв',
	'ОлексійВасильєв@gmail.com',
     48,
     null 
);

insert into book
value(
	default,
    'Програмування мовою Java',
    'Книга присвячена мові Java, яка на сьогодні є однією з найпопулярніших мов програмування. Це професійна мова, яка дозволяє створювати складні та ефективні програми. У книзі розглядаються всі основні теми, котрі формують парадигму мови програмування Java. Серед них, зокрема, базові прийоми створення програм, основні оператори та типи даних, керуючі інструкції, класи та об’єкти,',
    '2005-07-03',
    'Програмування',
	'ІМ-00121116',
	 560,
	'Олексій',
	'Васильєв',
	'ВасильєвОлексій@gmail.com',
     78,
     null 
);

insert into book
value(
	default,
    'MySQL: лабораторний практикум',
    'У посібнику подано лабораторні роботи для формування основних умінь та навичок використання та налагодження MySQL. Лабораторний практикум орієнтований на студентів педагогічних навчальних закладів, вчителів загальноосвітніх шкіл.',
    '2008-04-06',
    'Довідник',
	'ІМ-00006418',
	 1350,
	'Надія',
	'Балик',
	'НадіяБалик@gmail.com',
     35,
     null 
);

insert into book
value(
	default,
    'Вступ до алгоритмів',
    'Вступ до алгоритмів (англ. Introduction to Algorithms) використовують як підручник для курсів з теорії алгоритмів у багатьох університетах і часто цитують в документах у цій галузі, наразі більше 6600 цитувань задокументованих на CiteSeerX. Продажі книги впродовж перших 20 років сягли півмільйона копій. Її слава призвела до появи позначення «CLRS» (Cormen, Leiserson, Rivest, Stein). ',
    '2005-07-03',
    'Програмування',
	'ІМ-00118575',
	 1500,
	'Томас',
	'Кормен',
	'ТомасКормен@gmail.com',
     46,
     null 
);

insert into book
value(
	default,
    'Філософія Java',
    'Переклад з англійської-Мислення на Java - це книга про мову програмування Java, написана Брюсом Еккелем і вперше опублікована в 1998 році. Prentice Hall опублікувала 4-е видання твору в 2006 році. Книга являє собою версію для друку семінару Eckel "Hands-on Java".',
    '1998-07-03',
    'Програмування',
	'ІМ-00216678',
	 1234,
	'Брюс',
	'Еккель',
	'БрюсЕккель@gmail.com',
     58,
     null 
);

insert into book
value(
	default,
    'Досконалий код',
    'Переклад з англійської-Code Complete - книга з розробки програмного забезпечення, написана Стівом МакКоннеллом та опублікована в 1993 році Microsoft Press, заохочуючи розробників продовжувати програмування коду та виправлення та розробка великих моделей фронту та водоспаду. ',
    '1993-07-03',
    'Програмування',
	'ІМ-0011678',
	 789,
	'Стів',
	'Макконел',
	'СтівМакконел@gmail.com',
     58,
     null 
);

-- 4. Потрібно написати наступні запити:

-- + витягнути всі книги
-- + витягнути книги з id 5, 10, 13
-- + витягнути всі книги де кількість сторінок більше 150
-- + витягнути книги, де автори старше 30 років
-- + витягнути книги, в яких автори не мають нагород
-- + витягнути книгу по email автора
-- + витягнути книгу по isbn 
-- + витягнути всіх книги які належать до певної категорії 
-- + витягнути книги в яких кількість сторінок більше 200 та вік автора більше 25
-- + витягнути книги, в яких категорія "комедія" або "драма"(назви категорії можете змінити)
-- + витягнути книги та посортувати за назвою
-- + витягнути книги та посортувати за email автора
-- + витягнути книги та посортувати за кількістю сторінок(проти алфавіту)
-- + витягнути унікальні значення категорій
-- + витягнути унікальні імена авторів
-- + витягнути книги які було написано після '2000-01-01'
-- + витягнути книги які було написано до '2010-01-01'

select * from book.book;

select * from book where book_id in (2, 1, 6);

select * from book where number_pages > 1100;

select * from book where age_autor > 50;

select * from book where awards_autor is not null;

SELECT * FROM book WHERE email_autor = 'НадіяБалик@gmail.com';

SELECT * FROM book WHERE isbn = 'ІМ-00006418';

SELECT * FROM book WHERE category = 'Програмування';

select * from book where number_pages > 1300 and age_autor < 50;

select * from book where category = 'Довідник' or category = 'Python';

SELECT * FROM book ORDER BY name_book ASC;

SELECT * FROM book ORDER BY email_autor ASC;

SELECT * FROM book ORDER BY number_pages DESC;

SELECT distinct category from book;

SELECT distinct name_autor from book;

SELECT * from book where data_publication > '2005-08-01';

SELECT * from book where data_publication < '2010-08-01';

