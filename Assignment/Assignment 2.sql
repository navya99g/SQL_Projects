---Assignment 2

select * from Jomato

---Task 1: Create a user-defined functions to stuff the Chicken into ‘Quick Bites’.Eg: ‘Quick Chicken Bites’

Create function udf_StuffintoQuickBites(@word Nvarchar(100))
returns nvarchar(100)
as begin
	declare @new_word nvarchar(100);
	set @new_word = 'Quick ' + @word +' Bites';
	return @new_word;
end;

Select dbo.udf_StuffintoQuickBites('Chicken')

---Task 2: Use the function to display the restaurant name and cuisine type which has the maximum number of rating.

Create function udf_Resturant_MaxNo_Raiting( @Restaurant_type varchar(100))
returns table
as return
(select Top 1 
J.RestaurantName, J.CuisinesType 
from Jomato as J 
where J.RestaurantType=@Restaurant_type 
order by J.No_of_Rating desc);

Select * from dbo.udf_Resturant_MaxNo_Raiting('pub'); 

---Task 3: Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
---start rating, ‘Good’ if it has above 3.5 and below 4 star rating, ‘Average’ if it is above 3
---and below 3.5 and ‘Bad’ if it is below 3 star rating and

Alter table Jomato add Rating_status varchar(50);

update Jomato
set Rating_status =
	case
		when Rating > 4 then 'Excellent'
        when Rating > 3.5 AND Rating <= 4 then 'Good'
        when Rating > 3 AND Rating <= 3.5 then 'Average'
        when Rating <= 3 then 'Bad'       else 'Unknown'
    end;

Select * from Jomato

--- Task 4: Find the Ceil, floor and absolute values of the rating column and 
---display the current date and separately display the year, month_name and day.

Select 
CEILING(Rating) as Rating_Ceiling, FLOOR(Rating) as Rating_Floor, 
ABS(Rating) as Rating_Absolute, convert(date,GETDATE()) as CurrentDate,
Year(Getdate()) as Year, Datename(Month,getdate()) as Month, Day(getdate()) as Day
from Jomato

---Task 5: Display the restaurant type and total average cost using rollup.

Select RestaurantType, Avg(AverageCost) as [Total Average Cost]
from Jomato
group by RestaurantType with rollup;









---delete Jomato
---drop function dbo.udf_StuffintoQuickBites
--drop function dbo.udf_Resturant_MaxNo_Raiting