create database lesson_4_practice;

use lesson_4_practice;

create table country(
country_id int auto_increment primary key,
country_name varchar(25) not null,
population double not null
);

create table capital(
capital_id int auto_increment primary key,
capital_name varchar(25) not null,
foreign key(capital_id) references country(country_id)
);

create table city(
city_id int auto_increment key,
city_name varchar(25) not null,
city_square double not null,
country_id int not null,
foreign key(country_id) references country(country_id)
);

create table market(
market_id int auto_increment primary key,
market_name varchar(25) not null
);

create table city_market(
city_id int not null,
market_id int not null,
constraint id primary key(city_id, market_id),
foreign key(city_id) references city(city_id),
foreign key(market_id) references market(market_id)
);

insert into country(country_name, population) values
('Ukraine', 32000000),
('Italy', 29000000),
('France', 35000000);

insert into capital(capital_name) values
('Kyiv'),
('Rome'),
('Paris');

insert into city(city_name, city_square, country_id) values
('Lviv', 45454, 1),
('Milan', 89798, 2),
('Leon', 9834, 3);

insert into market(market_name) values
('Auchan'),
('Metro'),
('Walker'),
('Ikea');

insert into city_market(city_id, market_id) values
(1, 1),
(1, 2),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 4);