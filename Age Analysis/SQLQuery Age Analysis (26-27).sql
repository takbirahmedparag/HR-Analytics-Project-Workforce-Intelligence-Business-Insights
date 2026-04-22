/*
Age Analysis
26.Calculate employee age
27.Employees by age group:
Below 20
20–39
30–39
40-49
above 50
*/
--26.Calculate employee age
Select Employee_ID,FristName,LastName,Department,
Datediff(Year,Birthdate,Getdate()) AS employee_age
From dbo. HR_dataset


--27.Employees by age group:
Select Employee_ID,FristName,LastName,Department,
Datediff(Year,Birthdate,Getdate()) AS employee_ageage_segment,age_segment

From dbo. HR_dataset