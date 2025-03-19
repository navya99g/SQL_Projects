CREATE TABLE Salesman (
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,    
    CustomerName VARCHAR(255),
    PurchaseAmount INT,
);
   
INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);


CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount money)

INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

Select * from Salesman
Select * from Customer
Select * from Orders

---Task 1: Insert a new record in your Orders table

Insert into Orders Values (5005,8530,103,'2024-02-03',3000)
Select * from Orders

---Task 2: Add Primary key constraint for SalesmanId column in Salesman table. Add default constraint for City column in Salesman table. 
---Add Foreign key constraint for SalesmanId column in Customer table. Add not null constraint in Customer_name column for the Customer table. 

Alter table Salesman alter Column SalesmanId int not null;

Alter table Salesman add constraint Pk_Salesman_SalesmanId Primary Key (SalesmanId);

Alter table Salesman add constraint Pf_Salesman_city Default 'Texas' for City;

Alter table Customer with nocheck add constraint FK_SalesmanId Foreign Key (SalesmanId) References Salesman(SalesmanId);

Alter table Customer alter column CustomerName varchar(255) not null


---Task 3: Fetch the data where the Customer’s name is ending with either ‘N’ also get the purchase amount value greater than 500.

Select * from Customer where CustomerName like '%N' and PurchaseAmount>500

---Task 4: Using SET operators, retrieve the first result with unique SalesmanId values from two tables,
--and the other result containing SalesmanId without duplicates from two tables.

Select Top 1 SalesmanId from (Select SalesmanId from Salesman
Union select SalesmanId from Customer) as Cs;

Select SalesmanId from Salesman
Union select SalesmanId from Customer;

---Task 5:Display the below columns which has the matching data. Orderdate, Salesman Name, Customer Name, Commission, and City 
---which has the range of Purchase Amount between 1500 to 3000. 

Select o.Orderdate, s.Name as SalesmanName, c.CustomerName, s.Commission, s.city 
from Orders o 
join Salesman s on o.SalesmanId=s.SalesmanId 
join Customer c on o.CustomerId=c.CustomerId
Where o.Amount between 1500 and 3000 ;

---Task 6: Using right join fetch all the results from Salesman and Orders table

Select * from Salesman 
Right join Orders on Salesman.SalesmanId=Orders.SalesmanId;

drop table Orders;

drop table Customer;

drop table Salesman;

