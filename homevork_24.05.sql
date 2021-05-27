drop database if exists library;
create database library;

use library;

create table if not exists book(
    id INT NOT NULL AUTO_INCREMENT,
	book_name varchar(120) not null,
    books_description text,
    publishing_date date not null default "2018-01-01",
    category varchar(30) not null,
    isbn varchar(20) not null unique,
    pages_number int not null,
    author_first_name varchar(45) not null,
    author_second_name varchar(45) not null,
    author_email varchar(50) not null unique,
    author_age tinyint not null,
    author_birthday_date date not null,
    author_awards varchar(120), 
	PRIMARY KEY (id),
	UNIQUE INDEX id_UNIQUE (id ASC) VISIBLE
);

insert into book (book_name, books_description, publishing_date, category, isbn, pages_number, author_first_name, author_second_name, author_email, author_age, author_birthday_date, author_awards)values 
	("Misery", "Misery Chastain is dead. Paul Sheldon has just killed her - with relief, with joy. Misery has made him rich; she was the heroine of a string of bestsellers. And now he wants to get on to some real writing. That's when the car accident happens, and he wakes up in pain in a strange bed. But it isn't hospital. Annie Wilkes has pulled him from the wreck, brought him to her remote mountain home, splinted and set his mangled legs. The good news is that Annie was a nurse and has pain-killing drugs. The bad news is that she has long been Paul's Number One Fan. And when she finds out what Paul had done to Misery, she doesn't like it. She doesn't like it at all. Paul Sheldon used to write for a living. Now he's writing to stay alive.", 
    "1987-07-08", "Psychological horror", "1234567890", 389, "Stephen", "King", "stephenking@gmail.com", 73, "1941-09-21", "World Fantasy Award—Short Fiction"),
    ("The Count of Monte Cristo", "On the day of his wedding, Edmond Dantes, master mariner, is arrested in Marseille on trumped-up charges and spirited away to the cellars of the Chateau d'If, an impregnable sea fortress in which he is imprisoned indefinitely. Escaping from the chateau by a series of daring manoeuvres, he unearths a great treasure on the island of Monte Cristo, buried there by a former fellow prisoner who bequeaths to him the secret of its whereabouts. Thus armed with unimaginable wealth and embittered by his long imprisonment, he resolves to devote his life to tracking down and punishing those responsible.", 
    "1844-08-28", "Historical novel", "09876554321", 1436, "Alexandre", "Dumas", "dumas@gmail.com", 68, "1802-07-24", null),
    ("Gone with the Wind", "Margaret Mitchell’s page-turning, sweeping American epic has been a classic for over eighty years. Beloved and thought by many to be the greatest of the American novels, Gone with the Wind is a story of love, hope and loss set against the tense historical background of the American Civil War. The lovers at the novel’s centre – the selfish, privileged Scarlett O’Hara and rakish Rhett Butler – are magnetic: pulling readers into the tangled narrative of a struggle to survive that cannot be forgotten.", 
    "1936-06-30", "Historical novel", "0192873746", 1143, "Margaret", "Mitchell", "mitchel@gmail.com", 48, "1900-11-08", null),
    ("And then there were none", "Ten...Ten strangers are lured to an isolated island mansion off the Devon coast by a mysterious U.N.Owen. Nine... At dinner a recorded message accuses each of them in turn of having a guilty secret, and by the end of the night one of the guests is dead. Eight... Stranded by a violent storm, and haunted by an ancient nursery rhyme counting down one by one... as one by one... they begin to die. Seven... Which amongst them is the killer and will any of them survive?", 
    "1939-11-06", "Crime", "5647382901", 283, "Agatha", "Christie", "agatha_christie@gmail.com", 75, "1890-09-15", null),
    ("A Game of Thrones", "Summers span decades. Winter can last a lifetime. And the struggle for the Iron Throne has begun. As Warden of the north, Lord Eddard Stark counts it a curse when King Robert bestows on him the office of the Hand. His honour weighs him down at court where a true man does what he will, not what he must … and a dead enemy is a thing of beauty. The old gods have no power in the south, Stark’s family is split and there is treachery at court. Worse, the vengeance-mad heir of the deposed Dragon King has grown to maturity in exile in the Free Cities. He claims the Iron Throne.", 
    "1996-08-01", "Epic fantasy", "4638295730", 892, "George R.R.", "Martin", "martin@gmail.com", 72, "1948-09-20", null),
    ("The Hunters and the Hunted", "The hero of the novel, like thousands and thousands of those who fell into the clutches of the NKVD, is doomed to disappear, to disappear. But not such Hryhoriy Mnohohrishny, a descendant of the glorious Cossack family, to submit to fate. He is led by faith in his own strength and truth. This helps him to withstand any circumstances, to regain his freedom, and with it his life.", 
    "1954-01-01", "Adventure novel", "5544332211", 329, "Ivan", "Bagryanyj", "bagryanyj@gmail.com", 56, "1906-10-02", null),
    ("Pippi Longstocking", "A girl for whom any framework is cramped is a dreamer, a rebel, a joker. Incredibly strong. Incredibly generous. And a little lonely. Do you want to be friends with her? Then unfold the book of the famous Swedish writer Astrid Lindgren and dive into the adventures of Pippi Longstocking - the daughter of the captain, who became the real king.", 
    "1945-11-01", "Children's novel", "1987775599", 236, "Astrid", "Lindgren", "pippi@gmail.com", 94, "1907-10-24", null),
    ("The 7 Habits of Highly Effective People", "This is a book for those who want to become the best in their professional activities, maximize their creative potential and change their lives for the better forever.", 
    default, "Nonfiction", "2244668800", 456, "Stephen R.", "Covey", "covey@gmail.com", 79, "1922-10-24", null),
    ("The Green Mile", "The Green Mile: those who walk it do not return, because at the end of that walk is the room in which sits Cold Mountain Penitentiary's electric chair. In 1932 the newest resident on death row is John Coffey, a giant black man convicted of the brutal murder of two little girls. But nothing is as it seems with John Coffey, and around him unfolds a bizarre and horrifying story. Evil murderer or holy innocent - whichever he is - Coffey has strange powers which may yet offer salvation to others, even if they can do nothing to save him.", 
    "1996-03-28", "Dark Fantasy", "7443882990", 468, "Stephen", "King", "horror_king@gmail.com", 73, "1947-09-21", "World Fantasy Award—Short Fiction"),
    ("1984", "While the totalitarian system that provoked him into writing it has since passed into oblivion, his harrowing cautionary tale of a man trapped in a political nightmare has had the opposite fate: its relevance and power to disturb our complacency seem to grow decade by decade. In Winston Smith's desperate struggle to free himself from an all-encompassing, malevolent state, Orwell zeroed in on tendencies apparent in every modern society, and made vivid the universal predicament of the individual.", 
    "1949-06-08", "Utopian", "3241765849", 283, "George", "Orwell", "totalitar@gmail.com", 46, "1903-06-25", null);
    
SELECT * FROM book;

select * from book where id=5 or 10 or 13;

select * from book where pages_number>150;

select * from book where author_age>30;

select * from book where author_awards is null;

select * from book where author_email="totalitar@gmail.com";

select * from book where isbn="0192873746";

select * from book where category="Historical novel";

select * from book where pages_number>200 and author_age>25;

select * from book where category="Dark Fantasy" or "Epic fantasy";

select * from book order by book_name;

select * from book order by author_email;

select * from book order by pages_number DESC;

select distinct category from book;

select distinct author_first_name from book;

select * from book where publishing_date>"2000-01-01";

select * from book where publishing_date<"2010-01-01";