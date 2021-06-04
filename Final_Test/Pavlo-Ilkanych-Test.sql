create database if not exists it_system;
use it_system;

create table if not exists team_lead
(id int primary key,
name varchar(30) not null,
surname varchar(40) not null,
age int
);

create table if not exists team
(id int primary key,
name varchar(30) not null,
size int not null,
class int,
team_lead_id int,
constraint `team_ibfk_1`
foreign key (team_lead_id) references team_lead(id)    -- Зв"язок один до багатьохю
);

create table if not exists project
(id int primary key,
name varchar(30) not null,
details varchar(100),
budget decimal,
importance varchar(30),
foreign key (id) references team_lead(id)  -- Зв"язок один до одного.
);

create table if not exists task
(id int primary key,
name varchar(30) not null
);

create table task_project
(id_task int,
id_project int,
primary key (id_task, id_project),
foreign key (id_task) references task(id),
foreign key (id_project) references project(id)   -- Зв"язок багато до багатьох.
);

select team_lead.id from team_lead
where team_lead.age < 25;


select project.id from project
where project.name regexp "$la" and project.budget > 10000;

select * from team
order by team.class;

select * from project
where project.budget >= (select max(project.budget) from project);

select count(team.class) as qty from team;

select sum(project.budget) as sum from project;

select team.id from team
where team.size between 10 and 20;

update team_lead
set age = "team_lead_age";

select team.id from team
inner join team_lead on team.id = team_lead.id
where team_lead.name = "Андрій";

select task.id from task
inner join project on task.id = project.id
where project.name = "Adidas";

select project.id from project
inner join task on project.id = task.id
where task.name = "Find Java developer";

select team.id from team
inner join project on team.id = project.id
where project.name = "Bank Project";

select project.id from project
inner join team on project.id = team.id
where team.name = "First team";

select team_lead.id from team_lead
inner join project on team_lead.id = project.id
where project.name = "Online store";

