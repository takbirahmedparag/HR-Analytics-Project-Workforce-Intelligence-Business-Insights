/*
Hiring Analysis
9.Employees hired per year
10.Employees hired per month
11.Hiring trend over time
*/
--9.Employees hired per year
Select *
From dbo. HR_dataset
--9.Employees hired per year
Select datepart(Year,Hiredate) AS Hireing_date ,Count(Employee_ID) As total_number_of_employee
From dbo. HR_dataset
Group By datepart(Year,Hiredate)
Order By datepart(Year,Hiredate)


--10.Employees hired per month
Select dateName(MONTH,Hiredate) AS Hireing_date ,Count(Employee_ID)  As total_number_of_employee
From dbo. HR_dataset
Group By dateName(Month,Hiredate)
Order By dateName(Month,Hiredate)
--10.Employees hired per month
Select FORMAT(Hiredate,'yyyy-MMM') AS Hireing_date ,Count(Employee_ID)  As total_number_of_employee
From dbo. HR_dataset
Group By FORMAT(Hiredate,'yyyy-MMM')
Order By FORMAT(Hiredate,'yyyy-MMM')


--11.Hiring trend over time
Select datepart(Year,Hiredate) AS Hireing_date ,Count(Employee_ID) As total_number_of_employee
From dbo. HR_dataset
Group By datepart(Year,Hiredate)
Order By datepart(Year,Hiredate)

--11.Hiring trend over time
Select datepart(Year,Hiredate) AS Hireing_date ,Count(Employee_ID) As total_number_of_employee,
LAG(Count(Employee_ID)) Over (Order By datepart(Year,Hiredate)) As previous_year_hareing,
(Count(Employee_ID)-LAG(Count(Employee_ID)) Over (Order By datepart(Year,Hiredate))) AS diff_current_year_previous_year,
Case 
   When (Count(Employee_ID)-LAG(Count(Employee_ID)) Over (Order By datepart(Year,Hiredate))) > 0 then 'Incrsing'
   When (Count(Employee_ID)-LAG(Count(Employee_ID)) Over (Order By datepart(Year,Hiredate))) < 0 then 'Drecresing'
   Else 'Not Change'
End As hireing_trend_segment
From dbo. HR_dataset
Group By datepart(Year,Hiredate)
Order By datepart(Year,Hiredate)