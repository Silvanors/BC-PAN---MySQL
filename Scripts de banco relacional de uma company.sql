create schema if not exists company;
create table if not exists employee (
	Fname varchar(15) not null,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) not null, /*o char é usado para ter certeza que será recebido exatamente 9 caracteres, se fosse varchar receberia até 9 caracteres*/
    Bdate DATE,
    Address varchar (30),
    sex char,
    Salary decimal (10,2),
    Super_ssn char(9),
    Dno int not null,
    primary key (Ssn)
);

use company;
create table if not exists departament (
	Dname varchar (15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date date,
    primary key (Dnumber),
    unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);

create table  if not exists dept_locations (
	Dnumber int not null,
    Dlocation varchar(15) not null,
    primary key (Dnumber, Dlocation),
    foreign key (Dnumber) references departament (Dnumber)
);

create table if not exists project (
	Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    unique (Pname),
    foreign key (Dnum) references departament (Dnumber)
);

create table if not exists works_on (
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno), -- maneira de definiar chave primaria composta por Essn e Pno 
    foreign key (Essn) references employee (Ssn), -- exemplo de chave primária sendo estrangeira
    foreign key (Pno) references project (Pnumber)   
);

create table if not exists dependent (
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    sex char, -- F ou M
    Relationship varchar(8),
    primary key (Essn, Dependent_name),
    foreign key (Essn) references employee (Ssn)
);

show tables; -- mostra as tabelas criadas
desc departament;
desc employee;
desc works_on;
desc dependent;

/*Inserir a nova coluna na tabela "departament"*/
ALTER TABLE departament ADD Dept_create_date date;

/*Inserir a nova coluna na tabela "dependent"*/
ALTER TABLE dependent ADD Bdate date;


 

