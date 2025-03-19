use CaseStudy1

Select * from Fact
Select * from Locations
Select * from Product

---Tasks to be performed:

---1. Display the number of states present in the LocationTable. 

select Count(State) as [No. of States] from Locations

---2. How many products are of regular type?

select Count(product) as [No. of Regular Products]
from Product where type='Regular'

---3. How much spending has been done on marketing of product ID 1?

Select sum(Marketing) as [Marketing Product]
from Fact where ProductId=1

---4. What is the minimum sales of a product?

select min(sales) as [Minimum Sales] from Fact

---5. Display the max Cost of Good Sold (COGS). 

select max(COGS) as [Maximum COGS] from Fact

---6. Display the details of the product where product type is coffee. 

select * from Product where Product_type='coffee'

---7. Display the details where total expenses are greater than 40. 

select * from Fact where Total_Expenses>40

---8. What is the average sales in area code 719?

select avg(Sales) as [Average Sales]
from Fact where area_code = 719

---9. Find out the total profit generated by Colorado state. 

select sum(F.profit) as [Total Profit of Colorado] from
Fact F Inner Join Locations L
on F.Area_Code = L.Area_code
where L.state = 'Colorado';

---10. Display the average inventory for each product ID. 

select ProductId,avg(inventory) as Inventory_Price
from Fact
group by ProductId
order by ProductId;

---11. Display state in a sequential order in a Location Table.

select distinct state from Locations
order by state

---12. Display the average budget of the Product where the average budget margin should be greater than 100. 

select Area_Code,avg(Budget_margin) as [Avg budget Margin] 
from Fact
group by Area_code
having (avg(budget_margin)>100)
order by Area_code

---13. What is the total sales done on date 2010-01-01?

select sum(Sales) as [Total Sales]
from Fact where Date = '2010-01-01'

---14. Display the average total expense of each product ID on an individual date. 

select ProductId,Date,avg(Total_expenses) as [Avg. Expense]
from Fact
group by ProductId,Date
order by ProductId,Date;

---15. Display the table with the following attributes such as date, productID, product_type, product, sales, profit, state, area_code. 

select F.date, F.productID, P.product_type, P.Product, F.Sales, F.Profit, L.State, F.Area_code
from Fact F
inner join Locations L 
on F.Area_Code=L.Area_Code
inner join Product P on F.ProductId = P.ProductId

---16. Display the rank without any gap to show the sales wise rank.

select Sales,Dense_rank() over (order by sales desc) from Fact

---17. Find the state wise profit and sales. 

select L.State,sum(F.Profit) as Profit ,sum(F.Sales) as Sales 
from Fact F
inner join Locations L on F.Area_Code=L.Area_Code
group by State
order by State

---18. Find the state wise profit and sales along with the productname. 

select L.State,P.Product,sum(F.Profit) as Profit ,sum(F.Sales) as Sales 
from Fact F
inner join Locations L on F.Area_Code=L.Area_Code
inner join Product P on F.ProductId=P.ProductId
group by P.Product,State
order by P.Product,State

---19. If there is an increase in sales of 5%, calculate the increasedsales. 

select sales, (sales*1.05) as Increased_Sales
from Fact

---20. Find the maximum profit along with the product ID and producttype. 

select f.ProductId,p.Product_Type, max(Profit) as [profit]
from Fact f
inner join Product p 
on f.ProductId=p.ProductId
group by f.ProductId,p.Product_Type
order by f.ProductId,p.Product_Type

---21. Create a stored procedure to fetch the result according to the product type from Product Table. 

create procedure usp_product(@type varchar(20))
as
select * from Product where Product_Type=@type

exec usp_product 'coffee'

---22. Write a query by creating a condition in which if the total expenses is less than 60 then it is a profit or else loss. 

select Total_Expenses,
iif(total_expenses<60,'profit','loss') as [Result]
from Fact

---23. Give the total weekly sales value with the date and product ID details. Use roll-up to pull the data in hierarchical order. 

select ProductId,datepart(week,date) as week, sum(sales) as Total_sales
from Fact
group by ProductId,datepart(week,date) with rollup
order by ProductId,datepart(week,date)

---24. Apply union and intersection operator on the tables which consist of attribute area code. 

select Area_code from Fact
union
select Area_code from Locations

select Area_code from Fact
intersect
select Area_code from Locations

---25. Create a user-defined function for the product table to fetch a particular product type based upon the user�s preference. 

create function udf_Product( @type varchar(20))
returns table
return
(
select * from Product where Product_Type=@type
);

select * from dbo.udf_Product('coffee');

---26. Change the product type from coffee to tea where product ID is 1 and undo it. 

Begin Transaction
update Product set Product_Type='Tea' where ProductId=1
select * from Product;
Rollback Transaction
select * from Product;

---27. Display the date, product ID and sales where total expenses are between 100 to 200. 

select ProductId,Date,Sales 
from Fact where Total_Expenses between 100 and 200
order by ProductId,Date;

---28. Delete the records in the Product Table for regular type. 

delete from Product
where Type = 'Regular';

select * from Product;

---29. Display the ASCII value of the fifth character from the columnProduct.

select Product, substring(Product,5,1) as Character, 
ASCII(substring(Product,5,1)) as ASCII
from Product;