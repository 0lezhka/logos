create database if not exists it_system;

use it_system;

create table if not exists team_lead(
	id int unique auto_increment primary key,
    name varchar(30) not null,
    surname varchar(40) not null,
    age char not null); 
    
create table if not exists team(
	id int unique auto_increment primary key,
    name varchar(30) not null,
    size char not null,
    class tinyint not null,
    team_lead_id int not null,
    foreign key(team_lead_id) references team_lead(id));
    
create table if not exists project(
	id int unique auto_increment primary key,
    name varchar(30) not null,
    details text,
    budget double not null,
    importance char not null,
    team_lead_id int not null unique,
    foreign key(team_lead_id) references team_lead(id)); 
    
create table if not exists task(
	id int unique auto_increment primary key,
    name varchar(30) not null); 
    
create table if not exists project_task(
	project_id int,
    task_id int,
    primary key(project_id, task_id),
    foreign key(project_id) references project(id),
    foreign key(task_id) references task(id));

-- 1) Вивести всіх тім лідів, які молодші 25 років.  
select id, name, surname from team_lead where age < 25;

-- 2) Вивести всі проекти в яких ім’я проекту закінчується на “la” і бюджет проекту більший 10000 
select id, name from project where name like '%la' and budget > 10000;

-- 3) Відсортувати всі команди за полем class 
select id, name from team order by class ASC;

-- 4) Вивести всю інформацію про проект з найбільшим бюджетом. 
select * from project where budget = (select max(budget) from project);

--  5) Вивести стільки кімнат (class) є в офісі
select distinct count(class) from team;

--  6) Вивести загальну суму бюджету для всіх проектів. 
select sum(budget) from project;

-- 7) Вивести всі команди у яких розмір команди від 10 до 20
select id, name from team where size between 10 and 20;

--  8) Перейменувати поле age в таблиці team_lead на поле team_lead_age. 
alter table team_lead rename column age to team_lead_age;

-- 9) Вивести всі команди у яких team_lead Андрій. 
select id, name from team join team_lead on team.team_lead_id=team_lead.id where team_lead.name='Андрій';

-- 10)Вивести всі таски для проекту з ім’ям “Adidas”. 
select task.id, task.name from task join project_task on task.id=project_task.task_id 
join project on project_task.project_id=project.id
where project.name = 'Adidas';

-- 11) Вивести всі проекти, для яких є таска “Find Java Developer” 
select project.id, project.name from project join project_task on project.id=project_task.project_id 
join task on project_task.task_id=task.id
where task.name = 'Find Java Developer';

-- 12)Вивести команду, яка працює над проектом “Bank Project” 
select team.id, team.name from team join team_lead on team.team_lead_id=team_lead.id
join project on team_lead.id=project.team_lead_id
where project.name = 'Bank Project';

-- 13)Вивести проект, над яким працює команда “First team” 
select project.id, project.name from project join team_lead on project.team_lead_id=team_lead.id
join team on team_lead.id=team.team_lead_id
where team.name = 'First team';

-- 14)Вивести тім ліда, який має проект “Online store”
select team_lead.id, team_lead.name, team_lead.surname from team_lead join project on team_lead.id=project.team_lead_id
where project.name = 'Online store';