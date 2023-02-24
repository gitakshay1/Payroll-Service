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

Create Table Employee(
EmpId int identity(1,1) Primary key,
Name varchar(20) not null,
Gender varchar(1) not null,
Phone varchar(13) not null,
Address varchar(20) null Default ('Maharashtra'),
StartDate date not null,
DeptId int not null
)

Select * from Employee

Create Table Payroll(
SalaryId int identity(1,1) Primary key,
EmpId int,
Basic_pay money not null,
Deductions money not null,
Taxable_pay money not null,
Income_tax money not null,
Net_pay money not null
)

Select * from Payroll

Create Table Department(
DeptId int identity(1,1) Primary key,
DeptName varchar(20) not null
)

Select * from Department

Alter Table Employee
Add Foreign key (DeptId)
References Department(DeptId)

Alter Table Payroll
Add Foreign key (EmpId)
References Employee(EmpId)

Insert into Department(DeptName) values ('Hr'), ('Admin'), ('Accounts'), ('Operations'), ('Production'), ('Sales'), ('Marketting')

Insert into Employee(Name, Gender, Phone, StartDate, DeptId) 
values 
('Bharath', 'M', '1111111111', '2021-05-26', '1'),
('Susmitha', 'F', '2222222222', '2021-07-25', '2'),
('Sriram', 'M', '3333333333', '2021-03-11', '3'),
('Nagoor', 'M', '4444444444', '2021-04-02', '4'),
('Anusha', 'F', '5555555555', '2021-01-11', '5'),
('Terisa', 'F', '6666666666', '2021-06-26', '6'),
('Terisa', 'F', '7777777777', '2021-08-26', '7')

Select * from Employee

Insert into Payroll(EmpId, Basic_pay, Deductions, Taxable_pay, Income_tax, Net_pay)
values
('1', '50000', '3000', '47000', '2000', '45000'),
('2', '45000', '3000', '42000', '2000', '40000'),
('3', '40000', '3000', '37000', '2000', '35000'),
('4', '35000', '3000', '32000', '2000', '30000'),
('5', '30000', '3000', '27000', '2000', '25000'),
('6', '25000', '3000', '22000', '2000', '20000'),
('7', '20000', '3000', '17000', '2000', '15000')

Select * from Payroll

Select Sum(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='M' 
Group by Employee.Gender

Select Sum(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='F' 
Group by Employee.Gender

Select Avg(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='M' 
Group by Employee.Gender

Select Avg(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='F' 
Group by Employee.Gender

Select Min(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='M' 
Group by Employee.Gender

Select Min(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='F' 
Group by Employee.Gender

Select Max(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='M' 
Group by Employee.Gender

Select Max(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='F' 
Group by Employee.Gender

Select Count(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='M' 
Group by Employee.Gender

Select Count(Payroll.Basic_pay) 
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Gender='F' 
Group by Employee.Gender

Select * 
From Employee e, Department d, Payroll p
Where e.EmpId=p.EmpId and e.DeptId=d.DeptId

Select Basic_pay
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where Name='Susmitha'

Select Basic_pay
From Payroll 
Join Employee 
on Employee.EmpId=Payroll.EmpId 
Where StartDate Between '2021-5-25' And '2021-8-30'