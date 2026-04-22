/*
Manager / Org Analysis
31.Employees per department
32.Workforce distribution
*/
--31.Employees per department
Select Department,Count(Employee_ID) As number_of_employee
FROM dbo.HR_dataset
Group By Department


--32.Workforce distribution
Select Gender,Count(Employee_ID) As number_of_employee
FROM dbo.HR_dataset
Group By Gender

Select State,Count(Employee_ID) As number_of_employee
FROM dbo.HR_dataset
Group By State

Select City,Count(Employee_ID) As number_of_employee
FROM dbo.HR_dataset
Group By City


Select Department,Count(Employee_ID) As number_of_employee
FROM dbo.HR_dataset
Group By Department


Select Job_Title,Count(Employee_ID) As number_of_employee
FROM dbo.HR_dataset
Group By Job_Title
