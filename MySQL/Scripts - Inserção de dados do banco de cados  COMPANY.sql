-- Inserção de dados no bd company

use company_constraints;
show tables;

select * from employee;
select * from departament;
select * from dependent;
select * from dept_locations;
select * from project;
select * from works_on;
delete from employee where Super_ssn is null;
insert into employee values  ('Joao', 'v', 'RODRIGUES', '123456789','1980-01-01', '512-cj-08-casa 19', 'M', '40000',123456789,5);
							 ('Malia', 'C', 'MENDONÇA', 333445555,'1980-01-01', '512-cj-08-casa 19', 'M', 430000, 333445555, 5),

 insert into employee values
                            ('Alex', 'V', 'SALES', 999887777,'1980-01-01', '512-cj-08-casa 19', 'M', 350000, 999887777, 4),
                            ('Roben', 'B', 'WILLIANS', 987654321,'1980-01-01', '512-cj-08-casa 19', 'M', 30000, null, 4),
                            ('Silvano', 'R', 'SILVA', 666884444,'1980-01-01', '512-cj-08-casa 19', 'M', 25000, 666884444, 5),
                            ('Andre', 'R', 'SSILVA', 987987987,'1980-01-01', '512-cj-08-casa 19', 'M', 55000, 987987987, 4),
                            ('Luciana', 'R', 'SILVA', 888665555,'1980-01-01', '512-cj-08-casa 19', 'M', 30000, 888665555, 1);
                            
--
use company_constraints;
drop table dependent;
create table if not exists dependent (
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    sex char, -- F ou M
    Bdate date,
    Relationship varchar(8),
    primary key (Essn, Dependent_name), /*primary key composta*/
    -- foreign key (Essn) references employee (Ssn)
    constraint fk_dependent foreign key (Essn) references employee (Ssn)
);

insert into dependent values (333445555,'Alice', 'F', '1996-04-05', 'Daughter'),
							 (333445555,'Theodore', 'M', '1993-10-05', 'Son'),
                             (333445555,'Joy', 'F', '1996-04-05', 'Spouse'),
                             (987654321,'Abner', 'M', '1996-04-05', 'Son'),
                             (123456789,'Michel', 'M', '1996-04-05', 'Daughter'),
                             (123456789,'Alice', 'F', '1996-04-05', 'Daughter'),
                             (123456789,'Elizabeth', 'F', '1996-04-05', 'Spouse');

                            
                            