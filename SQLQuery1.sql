create database payroll_service

use payroll_service

Create Table employee_payroll(
Id int identity (1,1) primary key,
Name varchar(200),
Salary float,
StartDate date);

insert into employee_payroll (Name, Salary, StartDate) values
('Bharath', 50000.00, '2021-5-26'),
('Susmitha', 45000.00, '2021-06-26'),
('Raman', 60000.00, '2021-06-09'),
('Mukesh', 40000.00, '2021-03-05');

Select * from employee_payroll

select salary from employee_payroll where Name = 'Bharath';
select * from employee_payroll where StartDate between cast ('2021-06-09' as date) and GETDATE();

Alter Table employee_payroll
Add Gender varchar(1)

Update employee_payroll 
set Gender ='M' where Name='Bharath' or Name='Raman' or Name='Mukesh'
Update employee_payroll 
set Gender='F' where name='Susmitha'

Select * from employee_payroll

Alter Table employee_payroll
Alter Column Salary int

Select SUM(Salary) From employee_payroll Where Gender='M' Group by Gender

Select SUM(Salary) From employee_payroll Where Gender='F' Group by Gender

Select AVG(Salary) From employee_payroll Where Gender='M' Group by Gender

Select AVG(Salary) From employee_payroll Where Gender='F' Group by Gender

Select MIN(Salary) From employee_payroll Where Gender='M' Group by Gender

Select MIN(Salary) From employee_payroll Where Gender='F' Group by Gender

Select MAX(Salary) From employee_payroll Where Gender='M' Group by Gender

Select MAX(Salary) From employee_payroll Where Gender='F' Group by Gender

Select COUNT(Salary) From employee_payroll Where Gender='M' Group by Gender

Select COUNT(Salary) From employee_payroll Where Gender='F' Group by Gender

Alter Table employee_payroll
Add Phone varchar(13), Address varchar(20) null Default ('Maharashtra') With Values, Department varchar(20) Not null Default ('HR')

Update employee_payroll Set Phone='8796325944' Where Name='Bharath'
Update employee_payroll Set Phone='9862548354' Where Name='Susmitha'
Update employee_payroll Set Phone='6758496321' Where Name='Raman'
Update employee_payroll Set Phone='8875946254' Where Name='Mukesh'

Update employee_payroll Set Department='HR' Where Name='Bharath'
Update employee_payroll Set Department='Admin' Where Name='Susmitha'
Update employee_payroll Set Department='Accounts' Where Name='Raman'
Update employee_payroll Set Department='Operations' Where Name='Mukesh'

Select * from employee_payroll

Exec Sp_Rename 'employee_payroll.Salary', 'Basic_pay', 'Column'

alter table employee_payroll add 
Deductions float not null default 0.00,
Taxable_Pay float not null default 0.00, 
Income_Tax float not null default 0.00,
Net_Pay float not null default 0.00;

insert into employee_payroll (Name, Basic_pay, Startdate, Gender, Phone, Department, Deductions, Taxable_Pay, Income_Tax, Net_Pay) values ('Terisa', '50000', '2021-5-26', 'F', '6897515482', 'Sales', '0', '0', '0', '0')

insert into employee_payroll (Name, Basic_pay, Startdate, Gender, Phone, Department, Deductions, Taxable_Pay, Income_Tax, Net_Pay) values ('Terisa', '60000', '2021-6-21', 'F', '9865874896', 'Marketting', '0', '0', '0', '0')

Select * from employee_payroll