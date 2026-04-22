/*
Workforce Overview
5.Total employees by department
6.Total employees by gender
7.Total employees by education level
8.Total employees by state & city
*/

--5.Total employees by department
Select Department,Count(Employee_ID)
From dbo. HR_dataset
Group By Department


--6.Total employees by gender
Select Gender,Count(Employee_ID) AS total_number_employee
From dbo. HR_dataset
Group By Gender


--7.Total employees by education level
Select Education_Level,Count(Employee_ID) AS total_number_employee
From dbo. HR_dataset
Group By Education_Level

Select *
From dbo. HR_dataset

--8.Total employees by state & city
Select State,City,Count(Employee_ID)
From dbo. HR_dataset
Group By State,City 