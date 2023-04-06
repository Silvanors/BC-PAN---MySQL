/*Verificando se existe databases e criando o banco de dados "first_example"*/

show databases;
create database if not exists first_example;
use first_example;

/*Criando a tabela "person" e seus atributos*/
CREATE TABLE person (
person_id smallint unsigned,
fname varchar(20),
lname varchar(20),
gender enum('M','F'),
birth_date DATE,
street varchar(30),
city varchar(20),
state varchar(20),
country varchar(20),
postal_code varchar(20),
constraint pk_person primary key (person_id)
);
/*descrever a tabela "person"*/
desc person;

/*Criando a tabela "favorite_food" e seus atributos*/
create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    /*Ao usar o foreign key devemos informar o campo que será a chave estrangeira 
    e em seguida na referência devemos informar a tabela e o campo que será a chave estrageira*/
    constraint fk_favorite_food_person_id foreign key (person_id) references person(person_id)
);
/*descrever a tabela "favorite_food"*/
desc favorite_food;

/*desc person;

--drop table person;*/


show databases; /*há outros bancos de dados no MySQL*/

/*forma de mostrar/recuperar as constraints que foram colocadas no banco de dados específico*/
select * from information_schema.table_constraints /*se rodar somente esta linha mostra a tabela constraints no banco informartion_schema*/
where constraint_schema = 'first_example';

/*forma de mostrar/recuperar as constraints que foram colocadas numa tabela específica*/
select * from information_schema.table_constraints
where table_name = 'person';

/*Interir informações na tabela "person"*/
insert into person values ('3','Carolina', 'Silva', 'F', '1980-08-21','rua X','Samambia-Sul','DF', 'Brasil', '61-12345678'),
						  ('4','Carolina', 'Silva', 'F', '1980-08-21','rua X','Samambia-Sul','DF', 'Brasil', '61-12345678');

select * from person;

/* deletar alguma linha (instâncias) */
delete from person where person_id=5 or person_id=4;

select * from person;

/*Inserir valores na tabela "favorite_food"*/
insert into favorite_food values (1,'Carolina'),
						  (2,'Carne assada'),
                          (3,'fetuccine');
                          
select * from favorite_food;







