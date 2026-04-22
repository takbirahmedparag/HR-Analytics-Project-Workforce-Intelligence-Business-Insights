/*
Performance Analysis
22.Average performance rating
23.Performance by department
24.Top 5 performers
25.Low 5 performers
*/
--22.Average performance rating
Select AVG(performance_segment) As avarage_performance_rating
From
(
Select Employee_ID,FristName,LastName,Performance_Rating,
Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End AS performance_segment
From dbo. HR_dataset
)t




--23.Performance by department
Select Department,AVG(performance_segment) AS avg_performance_by_department
From
(
Select Employee_ID,FristName,LastName,Department,Performance_Rating,
Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End AS performance_segment
From dbo. HR_dataset
)t
Group By Department 



--24.Top 5 performers
Select  top 5 *
From
(
Select  Employee_ID,FristName,LastName,Performance_Rating,Max(Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End) AS highes_performance_rate
From dbo. HR_dataset
Group By Employee_ID,FristName,LastName,Performance_Rating
Having Performance_Rating = 'Excellent'
)t
Order By highes_performance_rate DESC

--24.Top 5 performers
Select Top 5 *
From
(
Select Employee_ID,FristName,LastName,Performance_Rating,
Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End AS lowest_performance_rate
From dbo. HR_dataset
Where Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End = 5
)t

--25.Low 5 performers
Select Top 5 *
From
(
Select Employee_ID,FristName,LastName,Performance_Rating,
Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End AS lowest_performance_rate
From dbo. HR_dataset
Where Case 
    When Performance_Rating = 'Excellent' then 5
    When Performance_Rating = 'Good' then 4
    When Performance_Rating = 'Satisfactory' then 3
    Else 2
End = 2
)t