---Case Study 2

--Simple Queries:

---1. List all the employee details. 
Select * from Employee;

---2. List all the department details. 
Select * from Department;

---3. List all job details. 
select * from Job;

---4. List all the locations. 
select * from Location;

---5. List out the First Name, Last Name, Salary, Commission for allEmployees.
select first_name, Last_name, Salary, Comm as Commission from Employee;

---6. List out the Employee ID, Last Name, Department ID for all employees and alias
---Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id". 
select 
	Employee_ID as 'ID of the Employee',
	Last_Name as 'Name of the Employee', 
	Department_ID as 'Dep_id'
from Employee;

---7. List out the annual salary of the employees with their names only.
select
	concat(First_Name, ' ', Last_Name) as 'Employee Name',
	Salary * 12 as "Annual Salary"
from Employee;

---WHERE Condition:

---1. List the details about "Smith". 
Select * from Employee where Last_name='Smith';

---2. List out the employees who are working in department 20. 
Select * From Employee where Department_Id = 20;

---3. List out the employees who are earning salaries between 3000 and 4500. 
Select *
	from Employee
	where Salary between 3000 and 4500;

---4. List out the employees who are working in department 10 or 20. 
Select * From Employee where Department_id in (10,20);

---5. Find out the employees who are not working in department 10 or 30. 
Select * From Employee where Department_id not in (10,30);

---6. List out the employees whose name starts with 'S'.
select * from Employee where Last_name like 'S%';

---7. List out the employees whose name starts with 'S' and ends with 'H'.
select * from Employee where Last_name like 's%h';

---8. List out the employees whose name length is 4 and start with 'S'. 
select * from Employee where LEN(Last_name)=4 and Last_name like 'S%';

---9. List out employees who are working in department 10 and draw salaries more than 3500. 
select * from Employee where Department_id=10 and Salary >3500;

---10. List out the employees who are not receiving commission.
select * from Employee where Comm is null;

---ORDER BY Clause:

---1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 
Select Employee_Id, Last_name from Employee order by Employee_Id;

---2. List out the Employee ID and Name in descending order based onsalary. 
Select Employee_Id, Last_name from Employee order by Salary desc;

---3. List out the employee details according to their Last Name in ascending-order.
Select * from Employee order by Last_name asc;

---4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order
Select * from Employee order by Last_Name Asc, Department_Id desc;

---GROUP BY and HAVING Clause:

---1. How many employees are in different departments in the organization?
Select DEPARTMENT_ID,Count(EMPLOYEE_ID) as "NO. of Employees" 
from Employee group by DEPARTMENT_ID; 

---2. List out the department wise maximum salary, minimum salary and average salary of the employees. 
Select DEPARTMENT_ID, 
	Max(SALARY) as "Maximum Salary", 
	Min(SALARY) as "Minimum Salary", 
	Avg(SALARY) as "Average Salary"
from Employee group by DEPARTMENT_ID; 

---3. List out the job wise maximum salary, minimum salary and average salary of the employees. 
Select 
	job_id,
	Max(SALARY) as "Maximum Salary", 
	Min(SALARY) as "Minimum Salary", 
	avg(SALARY) as "Average Salary"
from EMPLOYEE group by JOB_ID order by [Maximum Salary] desc

---4. List out the number of employees who joined each month in ascending order. 
select Month([HIRE_DATE]) as "Hiring_Month",Count(EMPLOYEE_ID) as "Employees_joined"
from EMPLOYEE 
group by MONTH(HIRE_DATE)
order by [Hiring_Month];

---5. List out the number of employees for each month and year in ascending order based on the year and month. 
select 
	Year([HIRE_DATE]) as "Hiring_Year", 
	Month([HIRE_DATE]) as "Hiring_Month",
	Count(EMPLOYEE_ID) as "Employees_joined"
from EMPLOYEE 
	group by YEAR(HIRE_DATE), MONTH(HIRE_DATE)
	order by [Hiring_Year], [Hiring_Month];

---6. List out the Department ID having at least four employees. 
Select 
	DEPARTMENT_ID,
	Count(EMPLOYEE_ID) as 'No. of Employees' 
from EMPLOYEE 
	group by DEPARTMENT_ID 
	having COUNT(EMPLOYEE_ID)>=4;

---7. How many employees joined in the month of January?
select 
	Count(EMPLOYEE_ID) as "Employees_joined"
from EMPLOYEE 
Where MONTH(HIRE_DATE)=1;

---8. How many employees joined in the month of January or September?
select 
	Count(EMPLOYEE_ID) as "Employees_joined_JanOrSept"
from EMPLOYEE 
where MONTH(HIRE_DATE) in (1,6);

---9. How many employees joined in 1985?
select 
	Count(EMPLOYEE_ID) as "Employees_joined_1985"
from EMPLOYEE 
where Year(HIRE_DATE)=1985;

---10. How many employees joined each month in 1985?
select 
	Month([Hire_Date]) as "Hired_Month_1985",
	Count(EMPLOYEE_ID) as "Employees_joined_1985"
from EMPLOYEE 
where Year(HIRE_DATE)=1985
group by MOnth(Hire_date);

---11. How many employees joined in March 1985?
select 
	Count(*) as "Employees_joined_March1985"
from EMPLOYEE 
where Year(HIRE_DATE)=1985 and MONTH(HIRE_DATE)=3;

---12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
select DEPARTMENT_ID, Count(EMPLOYEE_ID) as EmployeesJoined
from EMPLOYEE
where Month(Hire_date) = 4 and Year(HIRE_DATE)=1985
group by DEPARTMENT_ID
Having Count(EMPLOYEE_ID)>=3;

---Joins:

---1. List out employees with their department names. 
Select d.Name,EMPLOYEE_ID,LAST_NAME,FIRST_NAME 
from EMPLOYEE e inner Join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id
Order by d.Name, e.LAST_NAME;

---2. Display employees with their designations. 
Select  e.JOB_ID,j.Designation,LAST_NAME,FIRST_NAME 
from EMPLOYEE e left join JOB j on e.JOB_ID=j.Job_ID
order by e.JOB_ID, e.Last_Name;

---3. Display the employees with their department names and regional groups. 
Select d.Name,l.City,e.EMPLOYEE_ID,e.LAST_NAME,e.FIRST_NAME from EMPLOYEE e 
	left join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id
	left join Location l on d.Location_Id=l.Location_ID
	order by d.Name,e.LAST_NAME

---4. How many employees are working in different departments? Display with department names.
Select d.Name,Count(EMPLOYEE_ID) as "No. of Employees" 
from Employee e join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id 
group by d.Name; 

---5. How many employees are working in the sales department?
Select d.Name,Count(EMPLOYEE_ID) as "No. of Employees"
from EMPLOYEE e inner Join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id
where d.Name='Sales'
group by d.Name; 

---6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order. 
Select d.Name,Count(EMPLOYEE_ID) as "No. of Employees"
from EMPLOYEE e Join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id
group by d.Name
having Count(EMPLOYEE_ID)>=5
order by d.Name;

---7. How many jobs are there in the organization? Display with designations. 
Select * from JOB j left join EMPLOYEE e on j.JOB_ID=e.Job_ID;

---8. How many employees are working in "New York"?
Select l.City,count(e.EMPLOYEE_ID) as 'No. of Employees' from EMPLOYEE e 
	right join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id
	right join Location l on d.Location_Id=l.Location_ID
	where l.City='New York'
	group by l.City;

---9. Display the employee details with salary grades. Use conditional statement to create a grade column. 
Alter table Employee add GRADE varchar(1);

Update EMPLOYEE
set GRADE =
	case 
		when SALARY>=4000 then 'A'
		when SALARY>=2000 then 'B'
		else 'C'
	end;
	
Select * from EMPLOYEE;

---10. List out the number of employees grade wise. Use conditional statement to create a grade column. 
Select Grade, count('Employee_id') as "No. of Employee" from Employee group by Grade;

---11.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
Select Grade,Count(*) as 'No. of Employees' from Employee where Salary between 2000 and 5000 group by grade; 

---12. Display all employees in sales or operation departments.
Select * from EMPLOYEE e 
	right join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id
	where d.Name in ('Sales','Operations');

---SET Operators:

---1. List out the distinct jobs in sales and accounting departments. 
select distinct j.Designation,Name as [Department] from EMPLOYEE e 
join DEPARTMENT d on d.Department_Id=e.DEPARTMENT_ID 
join JOB j on e.JOB_ID = j.Job_ID
where d.Name in ('sales' , 'accounting');

---2. List out all the jobs in sales and accounting departments. 
select j.Designation,Name as [Department] from EMPLOYEE e 
join DEPARTMENT d on d.Department_Id=e.DEPARTMENT_ID 
join JOB j on e.JOB_ID = j.Job_ID
where d.Name in ('sales' , 'accounting');

---3. List out the common jobs in research and accounting departments in ascending order.
select distinct j.Designation,Name as [Department] from EMPLOYEE e 
join DEPARTMENT d on d.Department_Id=e.DEPARTMENT_ID 
join JOB j on e.JOB_ID = j.Job_ID
where d.Name in ('research' , 'accounting')
order by j.Designation;

---Subqueries:

---1. Display the employees list who got the maximum salary.
select * from EMPLOYEE
where SALARY = (select Max(Salary) from EMPLOYEE);

---2. Display the employees who are working in the sales department. 
select * from EMPLOYEE
where DEPARTMENT_ID= (select DEPARTMENT_ID from DEPARTMENT where Name='sales');

---3. Display the employees who are working as 'Clerk'. 
select * from EMPLOYEE
where JOB_ID= (select JOB_ID from JOB where Designation='Clerk');

---4. Display the list of employees who are living in "New York". 
Select * from Employee where DEPARTMENT_ID= (select DEPARTMENT_ID 
from DEPARTMENT d join LOCATION l on d.Location_Id=l.Location_ID where city='New York');

---5. Find out the number of employees working in the sales department. 
Select count(EMPLOYEE_ID) as 'No. of Employees' from EMPLOYEE
where DEPARTMENT_ID= (select DEPARTMENT_ID from DEPARTMENT where Name='sales');

---6. Update the salaries of employees who are working as clerks on the basis of 10%.
Update EMPLOYEE set SALARY = SALARY * 1.1 -- 10% is 0.1 increment that is i+0.1i=1.1i
where JOB_ID = (select Job_ID from job where Designation='clerk');
select * from EMPLOYEE

---7. Delete the employees who are working in the accounting department. 
delete  from EMPLOYEE
where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENT where Name = 'Accounting');

---8. Display the second highest salary drawing employee details.
Select * from 
( select * , ROW_NUMBER() over (order by Salary desc) as R from EMPLOYEE) as Row
where R = 2;

---9. Display the nth highest salary drawing employee details. 
create function udf_GetnthHighSalary_Employee(@n int)
returns Table
as return(
Select * from 
( select * , DENSE_RANK() over (order by Salary desc) as R from EMPLOYEE) as Row
where R = @n
);

select * from udf_GetnthHighSalary_Employee(3)

---10. List out the employees who earn more than every employee in department 30. 
select * from EMPLOYEE where SALARY >(
Select Max(SALARY) from EMPLOYEE where DEPARTMENT_ID=30
);

---11. List out the employees who earn more than the lowest salary in department. 
Select * from EMPLOYEE e where Salary > (
Select Min(SALARY) from EMPLOYEE where DEPARTMENT_ID=e.DEPARTMENT_ID
);

---12. Find out which department has no employees. 
select Name from DEPARTMENT
where Department_Id not in (select Department_Id from EMPLOYEE);

---13. Find out the employees who earn greater than the average salary for their department.
Select * from EMPLOYEE e where Salary > (
Select Avg(SALARY) from EMPLOYEE where DEPARTMENT_ID=e.DEPARTMENT_ID
);