/*
Attrition (Very Important)
12.Total employees left (Termdate not null)
13.Attrition rate
14.Attrition by department
15.Attrition by gender
16.Attrition by job title
*/
--12.Total employees left (Termdate not null)
Select Termdate 
From dbo. HR_dataset
Where Termdate IS NOT NULL

Select Termdate,Employee_ID,Count(Employee_ID) As total_number_of_employee
From dbo. HR_dataset
Where Termdate IS NOT NULL
Group BY Termdate,Employee_ID

Select Count(Employee_ID) As total_number_of_employee_left_company
From dbo. HR_dataset
Where Termdate IS NOT NULL




--13.Attrition rate

Select Count(Employee_ID)As total_number_employee,Sum(CASE When Termdate is null then 1 Else 0 End) AS total_active_employee,
Concat(Round(Cast(Sum(CASE When Termdate is null then 1 Else 0 End) As float)*100/Count(Employee_ID),2),'%') As attrition_rate
From dbo. HR_dataset

--14.Attrition by department
Select Department,Count(Employee_ID)As total_number_employee,Sum(CASE When Termdate is null then 1 Else 0 End) AS total_active_employee,
Concat(Round(Cast(Sum(CASE When Termdate is null then 1 Else 0 End) As float)*100/Count(Employee_ID),2),'%') As attrition_rate
From dbo. HR_dataset
Group By Department

--15.Attrition by gender
Select Gender,Count(Employee_ID)As total_number_employee,Sum(CASE When Termdate is null then 1 Else 0 End) AS total_active_employee,
Concat(Round(Cast(Sum(CASE When Termdate is null then 1 Else 0 End) As float)*100/Count(Employee_ID),2),'%') As attrition_rate
From dbo. HR_dataset
Group By Gender

--16.Attrition by job title
Select Job_title,Count(Employee_ID)As total_number_employee,Sum(CASE When Termdate is null then 1 Else 0 End) AS total_active_employee,
Concat(Round(Cast(Sum(CASE When Termdate is null then 1 Else 0 End) As float)*100/Count(Employee_ID),2) ,'%')As attrition_rate,
Concat((100-Round(Cast(Sum(CASE When Termdate is null then 1 Else 0 End) As float)*100/Count(Employee_ID),2)),'%') AS total_employee_left_company

From dbo. HR_dataset
Group By Job_title