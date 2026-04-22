/*
EDA (Understanding Data)
1.Total number of employees
2.List all departments
3.List all job titles
4.Check null values (Termdate, Salary, etc.)
*/
--1.Total number of employees
Select Count(Employee_ID) As total_number_of_employee
From dbo. HR_dataset
--2.List all departments
Select  Distinct Department
From dbo. HR_dataset


--3.List all job titles
Select  Distinct Job_title
From dbo. HR_dataset



--4.Check null values (Termdate, Salary, etc.)
Select *
From dbo. HR_dataset
Where Termdate IS NUll
--Total number of Running employee in company
Select Count(*) As total_number_of_active_employee
From dbo. HR_dataset
Where Termdate IS NUll

Select  *
From dbo. HR_dataset
Where Salary IS NUll