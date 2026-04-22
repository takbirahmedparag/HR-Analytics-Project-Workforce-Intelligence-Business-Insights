/*
Tenure Analysis
28.Calculate years in company
29.Average tenure
30.Longest-serving employees
*/
--28.Calculate years in company
Select 
Year (Min(Hiredate)) AS first_year_of_company,
Year (Max(Hiredate)) AS last_year_of_company,
Datediff(Year,(Min(Hiredate)),(Max(Hiredate))) As lifesend_of_company
From dbo. HR_dataset 



--29.Average tenure
Select Employee_ID,
Avg(Datediff(Year,Hiredate,Termdate)) AS avarage_tenure
From dbo. HR_dataset
Group By Employee_ID
Order By Avg(Datediff(Year,Hiredate,Termdate)) DESC



--30.Longest-serving employees
Select Employee_ID,FristName,LastName,
Max(datediff(Year,Hiredate,Termdate)) AS longest_serving_employee
FROM dbo.HR_dataset
Group By Employee_ID,FristName,LastName
Order By Max(datediff(Year,Hiredate,Termdate)) DESC


--30.Longest-serving employees
Select 
    Employee_ID,
    FristName,
    LastName,
Datediff(Year,Hiredate,coalesce (Termdate,Getdate())) AS longest_serving_employee
FROM dbo.HR_dataset
Order By Datediff(Year,Hiredate,coalesce (Termdate,Getdate())) DESC
