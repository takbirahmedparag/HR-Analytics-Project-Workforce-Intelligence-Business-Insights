/*
Advanced Business Insights
33.Which department has highest attrition
34.Which job title has highest salary growth potential
35.Which group performs best (education/gender)
36.Correlation: Salary vs Performance
37.High salary but low performance employees
38.Identify retention risk employees
*/
--33.Which department has highest attrition
Select Top 1 *
From
(
Select Department,Count(Employee_ID)As total_number_employee,Sum(CASE When Termdate is null then 1 Else 0 End) AS total_active_employee,
Concat(Round(Cast(Sum(CASE When Termdate is null then 1 Else 0 End) As float)*100/Count(Employee_ID),2) ,'%')As attrition_rate,
Concat((100-Round(Cast(Sum(CASE When Termdate is null then 1 Else 0 End) As float)*100/Count(Employee_ID),2)),'%') AS total_employee_left_company
From dbo. HR_dataset
Group By Department
)t
Order By attrition_rate  DESC



--34.Which job title has highest salary growth potential
Select Job_Title,Max(Salary) AS highest_salary,Avg(Salary) AS avarage_salary,
(Max(Salary)-Avg(Salary)) AS growth_potential
From dbo. HR_dataset
Group By Job_Title
Order By growth_potential DESC



--35.Which group performs best (education/gender)


Select top 1 *
From
(
Select Department,Education_Level,
Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End AS performance_rating_segment,
Count (Performance_Rating) AS total_number_of_excellent
From dbo. HR_dataset
Group By Department,Education_Level,Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End 
Having 
Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End  = 5

)t
Order By total_number_of_excellent DESC

----35.Which group performs best (education/gender)

Select top 1 *
From
(
Select Department,Education_Level,
Avg(Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End ) AS avarage_performance
From dbo. HR_dataset
Group By Department,Education_Level
)t
Order By avarage_performance

--36.Correlation: Salary vs Performance
Select 
Employee_ID,
FristName,
LastName,
Salary,
Performance_Rating,
Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End AS Performance_rating
From dbo. HR_dataset

--37.High salary but low performance employees

Select 
Employee_ID,
FristName,
LastName,
Salary,
Performance_Rating,
Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End AS Performance_rating
From dbo. HR_dataset
Where Salary_Segment = 'High Salary' and Performance_Rating ='Needs Improvement'
Order by Salary

--38.Identify retention risk employees
Select 
Employee_ID,
FristName,
LastName,
Salary,
Performance_Rating,
Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End AS Performance_rating
From dbo. HR_dataset
Where Salary_Segment in ('High Salary','Medium Salary','Low Salary') and Performance_Rating ='Needs Improvement'
Order by Salary