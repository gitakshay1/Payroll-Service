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
