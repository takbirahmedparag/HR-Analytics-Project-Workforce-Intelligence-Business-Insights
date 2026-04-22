/*
Salary Analysis
17.Average salary
18.Salary by department
19.Salary by job title
20.Highest paid employees
21.Salary distribution (Low, Medium, High)
*/
--17.Average salary
Select AVG(Salary) AS avg_salary
From dbo. HR_dataset



--18.Salary by department
Select Department,Sum(Salary) AS Total_salary
From dbo. HR_dataset
Group By Department

Select Department,AVG(Salary) AS avg_salary
From dbo. HR_dataset
Group By Department


--19.Salary by job title
Select Job_Title,Sum(Salary) AS Total_salary
From dbo. HR_dataset
Group By Job_Title

Select Job_Title,AVG(Salary) AS avg_salary
From dbo. HR_dataset
Group By Job_Title


--20.Highest paid employees

Select Employee_ID,FristName,LastName,Max(Salary) AS highest_salary
From dbo. HR_dataset
Group By Employee_ID,FristName,LastName
Order By Max(Salary)


Select top 1 *
From
(
Select Employee_ID,FristName,LastName,Max(Salary) AS highest_salary
From dbo. HR_dataset
Group By Employee_ID,FristName,LastName
)t



--21.Salary distribution (Low, Medium, High)
Select Employee_ID,FristName,LastName,Salary,Salary_Segment
From dbo. HR_dataset
