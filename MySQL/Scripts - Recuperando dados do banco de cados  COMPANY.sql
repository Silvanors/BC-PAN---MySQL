use company_constraints;

/* Recuperando dados com Queries SQL*/

-- gerente e seu departamento
select * from employee;
select Ssn, Fname, Dname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

-- 
select Ssn, Fname, Dependent_name, Relationship from employee, dependent where Essn = Ssn;

--
select Bdate, Address from employee
	where Fname = 'Joao' and Minit = 'V' and Lname ='RODRIGUES';
    
-- Recuperando departamento específico
select * from departament where Dname = 'Research';

select Fname, Lname, Address from employee, departament
	where Dname = 'Research' and Dnumber =  Dno;
    
-- 
select * from project, works_on where Pnumber = Pno;

--
select Pname, Essn, Hours from project, works_on, employee where Pnumber = Pno and Essn = Ssn;

--
/*Usando alias nas consultas*/

select * from departament;
select * from dept_locations;

--
-- select * from departament, dept_locations where Dnumber = Dnumber;
-- Retirar a ambiguidade através do alias ou AS Statement
select Dname, l.Dlocation as Departament_name
		from departament as d, dept_locations as l
        where d.Dnumber = l.Dnumber;
        
-- Concatenação
select concat(Fname, ' ', Lname) as employee from employee;

--