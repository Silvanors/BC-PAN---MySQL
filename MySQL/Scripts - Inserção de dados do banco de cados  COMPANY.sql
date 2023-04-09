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
insert into employee values  ('Joao', 'v', 'RODRIGUES', '123456789','1980-01-01', '512-cj-08-casa 19', 'M', '40000',123456789,5),
							 ('Malia', 'C', 'MENDONÇA', 333445555,'1980-01-01', '512-cj-08-casa 19', 'M', 430000, 333445555, 5);

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

insert into dependent values (666884444,'Alice', 'F', '1996-04-05', 'Daughter'),
							 (888665555,'Theodore', 'M', '1993-10-05', 'Son'),
                             (888665555,'Joy', 'F', '1996-04-05', 'Spouse'),
                             (987654321,'Abner', 'M', '1996-04-05', 'Son'),
                             (123456789,'Michel', 'M', '1996-04-05', 'Daughter'),
                             (123456789,'Alice', 'F', '1996-04-05', 'Daughter'),
                             (123456789,'Elizabeth', 'F', '1996-04-05', 'Spouse');
--
insert into departament values ('Research', 5, 666884444, '1988-05-22', '1986-05-22'),
							   ('Administration', 4, 987654321, '1995-01-01', '1994-01-01'),
                               ('Headquarters', 1, 888665555, '1981-06-19', '1980-05-19');

--
insert into dept_locations values (1, 'Houston'),
                                  (4, 'Starfford'),
                                  (5, 'Ballaire'),
                                  (5, 'Sugarland'),
                                  (5, 'Houston');
--
insert into project values ('Product X', 1, 'Bellaire', 5),
                            ('Product Y', 2, 'Sugarland', 5),
                            ('Product Z', 3, 'Houston', 5),
                            ('Computerization', 10,  'Stafford', 4),
                            ('Reorganization', 20,  'Houston', 1),
                            ('Newbenefits', 30,  'Stafford', 4);
--
insert into works_on values (888665555, 1, 30.0),
                            (987987987, 2, 10.0),
                            (987987987, 3, 10.0),
                            (987987987, 4, 5.0),
                            (987987987, 5, 20.0),
                            (987987987, 6, 15.0),
                            (987987987, 7, 0.0),
                            (666884444, 8, 32.5),
                            (987987987, 9, 10.0),
                            (999887777, 10, 7.5),
                            (666884444, 11, 40.0),
                            (666884444, 12, 20.0),
                            (666884444, 13, 20.0),
                            (666884444, 14, 10.0),
                            (666884444, 15, 10.0),
                            (666884444, 16, 10.0);