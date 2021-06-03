create database shopping;
use shopping;
create table shopping.country(
country_id int,
country_name varchar(25),
population double,
primary key (country_id)
);
create table shopping.capital(
capital_id int,
capital_name varchar(25),
foreign key(capital_id) references country(country_id),
primary key(capital_id)
);
create table shopping.city(
city_id int,
city_name varchar(25),
city_square double,
country_id int,
primary key(city_id),
foreign key(country_id) references country(country_id)
);
create table shopping.market(
market_id int,
market_name varchar(25),
primary key(market_id)
);
create table shopping.city_market(
city_id int,
market_id int,
foreign key(city_id) references city(city_id),
foreign key(market_id) references market(market_id),
primary key(city_id, market_id)
);