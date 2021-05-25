drop database if exists library;
create database library;

use library;

create table if not exists book(
	book_name varchar(120) not null,
    books_description varchar(1000) default "Опис відсутній",
    publishing_date date not null default "2018-01-01",
    author varchar(60) not null,
    category varchar(30) not null
);

insert into book (book_name, publishing_date, author, category, books_description) values 
	("Misery", "1987-07-08", "Stephen King", "Psychological horror",
    "Misery Chastain is dead. Paul Sheldon has just killed her - with relief, with joy. Misery has made him rich; she was the heroine of a string of bestsellers. And now he wants to get on to some real writing. That's when the car accident happens, and he wakes up in pain in a strange bed. But it isn't hospital. Annie Wilkes has pulled him from the wreck, brought him to her remote mountain home, splinted and set his mangled legs. The good news is that Annie was a nurse and has pain-killing drugs. The bad news is that she has long been Paul's Number One Fan. And when she finds out what Paul had done to Misery, she doesn't like it. She doesn't like it at all. Paul Sheldon used to write for a living. Now he's writing to stay alive."),
    ("The Count of Monte Cristo", "1844-08-28", "Alexandre Dumas", "Historical novel", 
    "On the day of his wedding, Edmond Dantes, master mariner, is arrested in Marseille on trumped-up charges and spirited away to the cellars of the Chateau d'If, an impregnable sea fortress in which he is imprisoned indefinitely. Escaping from the chateau by a series of daring manoeuvres, he unearths a great treasure on the island of Monte Cristo, buried there by a former fellow prisoner who bequeaths to him the secret of its whereabouts. Thus armed with unimaginable wealth and embittered by his long imprisonment, he resolves to devote his life to tracking down and punishing those responsible."),
    ("Gone with the Wind", "1936-06-30", "Margaret Mitchell", "Historical novel",
    "Margaret Mitchell’s page-turning, sweeping American epic has been a classic for over eighty years. Beloved and thought by many to be the greatest of the American novels, Gone with the Wind is a story of love, hope and loss set against the tense historical background of the American Civil War. The lovers at the novel’s centre – the selfish, privileged Scarlett O’Hara and rakish Rhett Butler – are magnetic: pulling readers into the tangled narrative of a struggle to survive that cannot be forgotten."),
    ("And then there were none", "1939-11-06", "Agatha Christie", "Crime", "Ten...Ten strangers are lured to an isolated island mansion off the Devon coast by a mysterious U.N.Owen. Nine... At dinner a recorded message accuses each of them in turn of having a guilty secret, and by the end of the night one of the guests is dead. Eight... Stranded by a violent storm, and haunted by an ancient nursery rhyme counting down one by one... as one by one... they begin to die. Seven... Which amongst them is the killer and will any of them survive?"),
    ("A Game of Thrones", "1996-08-01", "George R.R. Martin", "Epic fantasy", 
    "Summers span decades. Winter can last a lifetime. And the struggle for the Iron Throne has begun. As Warden of the north, Lord Eddard Stark counts it a curse when King Robert bestows on him the office of the Hand. His honour weighs him down at court where a true man does what he will, not what he must … and a dead enemy is a thing of beauty. The old gods have no power in the south, Stark’s family is split and there is treachery at court. Worse, the vengeance-mad heir of the deposed Dragon King has grown to maturity in exile in the Free Cities. He claims the Iron Throne."),
    ("The Hunters and the Hunted", "1954-01-01", "Ivan Bagryanyj", "Adventure novel", 
    "The hero of the novel, like thousands and thousands of those who fell into the clutches of the NKVD, is doomed to disappear, to disappear. But not such Hryhoriy Mnohohrishny, a descendant of the glorious Cossack family, to submit to fate. He is led by faith in his own strength and truth. This helps him to withstand any circumstances, to regain his freedom, and with it his life."),
    ("Pippi Longstocking", "1945-11-01", "Astrid Lindgren", "Children's novel", 
    "A girl for whom any framework is cramped is a dreamer, a rebel, a joker. Incredibly strong. Incredibly generous. And a little lonely. Do you want to be friends with her? Then unfold the book of the famous Swedish writer Astrid Lindgren and dive into the adventures of Pippi Longstocking - the daughter of the captain, who became the real king."),
    ("The 7 Habits of Highly Effective People", "1989-01-01", "Stephen R. Covey", "Nonfiction", 
    "This is a book for those who want to become the best in their professional activities, maximize their creative potential and change their lives for the better forever."),
    ("The Green Mile", "1996-03-28", "Stephen King", "Dark Fantasy", 
    "The Green Mile: those who walk it do not return, because at the end of that walk is the room in which sits Cold Mountain Penitentiary's electric chair. In 1932 the newest resident on death row is John Coffey, a giant black man convicted of the brutal murder of two little girls. But nothing is as it seems with John Coffey, and around him unfolds a bizarre and horrifying story. Evil murderer or holy innocent - whichever he is - Coffey has strange powers which may yet offer salvation to others, even if they can do nothing to save him."),
    ("1984", "1949-06-08", "George Orwell", "Utopian", 
    "While the totalitarian system that provoked him into writing it has since passed into oblivion, his harrowing cautionary tale of a man trapped in a political nightmare has had the opposite fate: its relevance and power to disturb our complacency seem to grow decade by decade. In Winston Smith's desperate struggle to free himself from an all-encompassing, malevolent state, Orwell zeroed in on tendencies apparent in every modern society, and made vivid the universal predicament of the individual.")
    