create schema if not exists company_constraints;

-- restrição atribuida a um dominio
-- create domain D_num as int check(D_num > 0 and D_num < 21); exemplo que de que o mysql não suporta 

use company_constraints;
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
    constraint chk_salary_employee check (Salary > 2000.0), /*na empresa não tem nenhum salário abaixo de 2000, assim o "check" não deixa inserir valores menores. nome para identificar chk_salary_employee*/
    -- primary key (Ssn)
    constraint pk_employee primary key (Ssn) /*nomeando a PK para saber de quem é*/
);
desc employee;

use company_constraints;
create table if not exists departament (
	Dname varchar (15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date date,
    Dept_create_data date,
    constraint chk_date_dept check (Dept_create_data < Mgr_start_date),
    -- primary key (Dnumber),
    constraint pk_dept primary key (Dnumber),
    -- unique (Dname),
    constraint unique_name_dept unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);
desc departament;

create table  if not exists dept_locations (
	Dnumber int not null,
    Dlocation varchar(15) not null,
    -- primary key (Dnumber, Dlocation),
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    -- foreign key (Dnumber) references departament (Dnumber)
    constraint fk_dept_locations foreign key (Dnumber) references departament (Dnumber)
);
desc dept_locations;

create table if not exists project (
	Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    -- unique (Pname),
    constraint unique_project unique (Pname),
    -- foreign key (Dnum) references departament (Dnumber)
    constraint fk_project foreign key (Dnum) references departament (Dnumber)
);
desc project;

create table if not exists works_on (
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno), -- maneira de definiar chave primaria composta por Essn e Pno 
    -- foreign key (Essn) references employee (Ssn), -- exemplo de chave primária sendo estrangeira
    constraint fk_works_on_essn foreign key (Essn) references employee (Ssn),
    -- foreign key (Pno) references project (Pnumber)   
     constraint fk_works_on_pno foreign key (Pno) references project (Pnumber) 
);
desc works_on;

create table if not exists dependent (
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    sex char, -- F ou M
    Relationship varchar(8),
    Age int not null,
    constraint chk_agew_dependent check (Age < 22),
    primary key (Essn, Dependent_name), /*primary key composta*/
    -- foreign key (Essn) references employee (Ssn)
    constraint fk_dependent foreign key (Essn) references employee (Ssn)
);
desc dependent;

use company_constraints;
show tables; -- mostra as tabelas criadas
desc departament;
desc employee;
desc works_on;
desc dependent;

/*Inserir a nova coluna na tabela "departament"*/
ALTER TABLE departament ADD Dept_create_date date;

/*Inserir a nova coluna na tabela "dependent"*/
ALTER TABLE dependent ADD Bdate date;

show character set;

-- -----------------------------------------------------------
/*IMPORTANTE: como verificar todas as CONSTRAINTS (que são as primary key e foreign key) do banco "company"*/
select * from information_schema.table_constraints
	where constraint_schema = 'company_constraints';
    
-- -----------------------------------------------------------
/*IMPORTANTE: como verificar todas as CONSTRAINTS REFERENTIAL (que são as primary key) do banco "company"*/
select * from information_schema.referential_constraints
	where constraint_schema = 'company_constraints';
    
-- -----------------------------------------------------------
    use company_constraints;
    show tables;
    
 /**Deletar um banco inteiro com primary key */
drop database company_constraints;

-- -----------------------------------------------------------
/* Alterações no banco de dados*/
--
alter table employee
	add constraint fk_employee
    foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;

--
'def', 'company_constraints', 'departament_ibfk_1', 'company_constraints', 'departament', 'FOREIGN KEY', 'YES'
alter table departament drop constraint departament_ibfk_1; 
alter table departament 
			add constraint fk_dept foreign key(Mgr_ssn) references employee (Ssn)
            on update cascade;

--
alter table dept_locations drop constraint fk_dept_locations;
alter table dept_locations
		add constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
        on delete cascade
        on update cascade;

--
alter table works_on drop constraint fk_works_on_essn;
alter table works_on drop constraint fk_works_on_pno;
alter table works_on
			add constraint fk_employee_works_on foreign key (Essn) references employee (Ssn),
            add constraint fk_project_works_on foreign key (Pno) references project (Pnumber)
            on delete cascade
            on update cascade;
            

