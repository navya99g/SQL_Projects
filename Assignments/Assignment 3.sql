---Assignment 3

---Task: 1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero. 

create procedure usp_NonZero_Tablebooking_Jomato
as begin
Select RestaurantName, RestaurantType, CuisinesType
From Jomato as J
where J.TableBooking <> 0
end;

Exec dbo.usp_NonZero_Tablebooking_Jomato;

---Task: 2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it. 

Begin transaction
update Jomato
set CuisinesType='Cafeteria' where CuisinesType='Cafe'
select RestaurantName,RestaurantType,CuisinesType from Jomato where RestaurantType='Cafe'

Rollback transaction;

---Task: 3. Generate a row number column and find the top 5 areas with the highest rating of restaurants. 

select Rank, Area, Round(Rating,2) as AreaRating
from
	(select 
	Area, Rating,RestaurantName,
	Row_number() over (order by Rating desc) as Rank
	from Jomato ) as Area_Ranked
where rank <= 5;

---Task: 4. Use the while loop to display the 1 to 50. 

declare @counter int
set @counter = 1

While @counter < 51
begin
Select * from Jomato where OrderId=@counter
set @counter = @counter + 1
end

---Task: 5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants. 

Create view vw_Top5_Jomato as
select * from
	(select Row_number() over (order by Rating desc) as Rank,
	  RestaurantName, RestaurantType, CuisinesType,AverageCost, OnlineOrder, TableBooking, Delivery_time, Area,LocalAddress,Round(Rating,2) as Rating, No_of_Rating
	from Jomato ) as Restaurant_Ranked
where rank <= 5;

select * from vw_Top5_Jomato

---Task: 6. Create a trigger that give an message whenever a new record is inserted.

create Trigger tr_Insert_Jomato on Jomato
after insert
as begin
Select 'Order ' + cast(OrderId as varchar(20)) + ' is placed at ' + cast(getdate() as varchar(50)) from inserted
end

begin transaction
insert into Jomato values (7777,'Znew','Cafe',3.2,10,100,0,0,'Cafe','HSR','HSR',50)
Select * from Jomato order by OrderId desc
rollback
