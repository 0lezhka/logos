drop database if exists library_5hometask;
create database library_5hometask;

use library_5hometask;

create table category(
	id int unique auto_increment primary key,
    category_name varchar(30) not null);
    
create table book(
	id int unique auto_increment primary key,
    book_name varchar(60) not null,
    description text not null,
    price decimal(5, 2) not null,
    isbn varchar(20) not null);
    
create table book_category(
	book_id int not null,
	category_id int not null,
    primary key(book_id, category_id),
    foreign key(book_id) references book(id),
    foreign key(category_id) references category(id));
    
create table author(
	id int unique auto_increment primary key,
    author_firstname varchar(30) not null,
    author_secondname varchar(50) not null,
    email varchar(30) not null,
    adress varchar(100) not null,
    birthdate date not null);
    
create table book_author(
	book_id int not null,
	author_id int not null,
    primary key(book_id, author_id),
    foreign key(book_id) references book(id),
    foreign key(author_id) references author(id));
    
insert into book(book_name, isbn, price, description) values
	("Misery", "1234567890", 120, "Misery Chastain is dead. Paul Sheldon has just killed her - with relief, with joy. Misery has made him rich; she was the heroine of a string of bestsellers. And now he wants to get on to some real writing. That's when the car accident happens, and he wakes up in pain in a strange bed. But it isn't hospital. Annie Wilkes has pulled him from the wreck, brought him to her remote mountain home, splinted and set his mangled legs. The good news is that Annie was a nurse and has pain-killing drugs. The bad news is that she has long been Paul's Number One Fan. And when she finds out what Paul had done to Misery, she doesn't like it. She doesn't like it at all. Paul Sheldon used to write for a living. Now he's writing to stay alive."),
    ("The Count of Monte Cristo", "09876554321", 289, "On the day of his wedding, Edmond Dantes, master mariner, is arrested in Marseille on trumped-up charges and spirited away to the cellars of the Chateau d'If, an impregnable sea fortress in which he is imprisoned indefinitely. Escaping from the chateau by a series of daring manoeuvres, he unearths a great treasure on the island of Monte Cristo, buried there by a former fellow prisoner who bequeaths to him the secret of its whereabouts. Thus armed with unimaginable wealth and embittered by his long imprisonment, he resolves to devote his life to tracking down and punishing those responsible."),
    ("Gone with the Wind", "0192873746", 246, "Margaret Mitchell’s page-turning, sweeping American epic has been a classic for over eighty years. Beloved and thought by many to be the greatest of the American novels, Gone with the Wind is a story of love, hope and loss set against the tense historical background of the American Civil War. The lovers at the novel’s centre – the selfish, privileged Scarlett O’Hara and rakish Rhett Butler – are magnetic: pulling readers into the tangled narrative of a struggle to survive that cannot be forgotten."),
    ("And then there were none", "5647382901", 120, "Ten...Ten strangers are lured to an isolated island mansion off the Devon coast by a mysterious U.N.Owen. Nine... At dinner a recorded message accuses each of them in turn of having a guilty secret, and by the end of the night one of the guests is dead. Eight... Stranded by a violent storm, and haunted by an ancient nursery rhyme counting down one by one... as one by one... they begin to die. Seven... Which amongst them is the killer and will any of them survive?"),
    ("A Game of Thrones", "4638295730", 195, "Summers span decades. Winter can last a lifetime. And the struggle for the Iron Throne has begun. As Warden of the north, Lord Eddard Stark counts it a curse when King Robert bestows on him the office of the Hand. His honour weighs him down at court where a true man does what he will, not what he must … and a dead enemy is a thing of beauty. The old gods have no power in the south, Stark’s family is split and there is treachery at court. Worse, the vengeance-mad heir of the deposed Dragon King has grown to maturity in exile in the Free Cities. He claims the Iron Throne."),
    ("The Hunters and the Hunted", "5544332211", 130, "The hero of the novel, like thousands and thousands of those who fell into the clutches of the NKVD, is doomed to disappear, to disappear. But not such Hryhoriy Mnohohrishny, a descendant of the glorious Cossack family, to submit to fate. He is led by faith in his own strength and truth. This helps him to withstand any circumstances, to regain his freedom, and with it his life."),
    ("Pippi Longstocking", "1987775599", 168, "A girl for whom any framework is cramped is a dreamer, a rebel, a joker. Incredibly strong. Incredibly generous. And a little lonely. Do you want to be friends with her? Then unfold the book of the famous Swedish writer Astrid Lindgren and dive into the adventures of Pippi Longstocking - the daughter of the captain, who became the real king."),
    ("The 7 Habits of Highly Effective People", "2244668800", 150, "This is a book for those who want to become the best in their professional activities, maximize their creative potential and change their lives for the better forever."),
    ("The Green Mile", "7443882990",  230, "The Green Mile: those who walk it do not return, because at the end of that walk is the room in which sits Cold Mountain Penitentiary's electric chair. In 1932 the newest resident on death row is John Coffey, a giant black man convicted of the brutal murder of two little girls. But nothing is as it seems with John Coffey, and around him unfolds a bizarre and horrifying story. Evil murderer or holy innocent - whichever he is - Coffey has strange powers which may yet offer salvation to others, even if they can do nothing to save him."),
    ("1984", "3241765849", 179, "While the totalitarian system that provoked him into writing it has since passed into oblivion, his harrowing cautionary tale of a man trapped in a political nightmare has had the opposite fate: its relevance and power to disturb our complacency seem to grow decade by decade. In Winston Smith's desperate struggle to free himself from an all-encompassing, malevolent state, Orwell zeroed in on tendencies apparent in every modern society, and made vivid the universal predicament of the individual.");
    
insert into category(category_name) values
	("Psychological horror"), ("Historical novel"), 
    ("Crime"), ("Epic fantasy"), ("Adventure novel"), 
    ("Children's novel"), ("Nonfiction"), 
    ("Dark Fantasy"), ("Utopian");

insert into book_category values
	(1, 1),
    (10, 9),
    (3, 2),
    (2, 2),
    (2, 5),
    (4, 3),
    (5, 4),
    (6, 5),
    (7, 6),
    (8, 7),
    (9, 8),
    (9, 3);
    
insert into author(author_firstname, author_secondname,  email, adress, birthdate) values
	("George", "Orwell", "totalitar@gmail.com", "UK", "1903-06-25"),
    ("Stephen", "King", "stephenking@gmail.com", "USA", "1941-09-21"),
	("Alexandre", "Dumas", "dumas@gmail.com", "France", "1802-07-24"),
	("Margaret", "Mitchell", "mitchel@gmail.com", "USA", "1900-11-08"),
	("Agatha", "Christie", "agatha_christie@gmail.com", "UK", "1890-09-15"),
	("George R.R.", "Martin", "martin@gmail.com", "USA", "1948-09-20"),
	("Ivan", "Bagryanyj", "bagryanyj@gmail.com", "Ukraine", "1906-10-02"),
	("Astrid", "Lindgren", "pippi@gmail.com", "Sweden", "1907-10-24"), 
	("Stephen R.", "Covey", "covey@gmail.com", "USA", "1922-10-24");
    
insert into book_author values
	(1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6),
    (6, 7),
    (7, 8),
    (8, 9),
    (9, 2),
    (10, 1);