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

