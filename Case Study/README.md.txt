# SQL Case Studies

This repository contains various SQL case studies, each showcasing common SQL operations and queries completed as part of my SQL Certification from Intellipaat. The case studies focus on data retrieval, aggregation, filtering, joining tables, subqueries, set operators, and stored procedures, along with examples of practical applications in a business context. The data used in these case studies consists of fictional employee, department, product, and sales data.

## Structure

The repository includes two case studies:

### Case Study 1: Product and Sales Data Analysis
This case study contains SQL queries used for analyzing sales, marketing, and product data. The queries cover:
- Basic SQL operations like `SELECT`, `COUNT`, `AVG`, `SUM`, etc.
- Filtering data using `WHERE` and `HAVING` clauses.
- Joining multiple tables to fetch combined data.
- Aggregation techniques such as `GROUP BY` and `ORDER BY`.
- Creating stored procedures, user-defined functions, and conditional logic.
- Working with window functions such as `DENSE_RANK`.

**Queries include:**
- Displaying total sales and profits based on various conditions.
- Calculating averages, minimums, and maximums.
- Joining `Fact`, `Product`, and `Location` tables for combined data retrieval.
- Applying `CASE` statements and using window functions like `RANK`.
- Demonstrating data updates and transactions with rollback.

### Case Study 2: Employee and Department Data Analysis
This case study involves analyzing employee and department data from a corporate organization. The queries include:
- Listing employee, department, and job details.
- Filtering employees based on different conditions like salary, department, and joining dates.
- Using `GROUP BY` and `HAVING` to calculate aggregate statistics.
- Demonstrating SQL joins (INNER, LEFT, RIGHT) to combine data from multiple tables.
- Implementing set operators (`UNION`, `INTERSECT`) and subqueries for advanced data retrieval.
- Creating user-defined functions and updating data using SQL procedures.

**Queries include:**
- Listing employee details with associated departments and job titles.
- Using window functions and `ROW_NUMBER` to rank employees by salary.
- Performing subqueries to fetch specific data like the highest salary.
- Deleting records based on certain conditions.
- Using `ALTER` and `UPDATE` statements to manipulate data.
  
## Case Study Breakdown

### Case Study 1: Product and Sales Data
1. Basic Data Retrieval: Queries for fetching product, location, and fact data.
2. Aggregation: Calculating total sales, marketing expenses, profits, and averages.
3. Joins: Combining data from different tables like `Fact`, `Product`, and `Locations`.
4. Conditional Logic: Using `CASE` for decision-making and `IIF` for profit/loss calculations.
5. Window Functions: `DENSE_RANK` to rank sales.
6. Stored Procedures: Creating dynamic queries via stored procedures.
7. Data Modifications: Insert, Update, Delete operations with rollback functionality.

### Case Study 2: Employee and Department Data
1. Employee Details: Basic retrieval and filtering of employee data.
2. Department and Job Information: Using joins to retrieve department and job-related details.
3. Aggregation: Employee salary statistics by department and job.
4. Data Filtering: Using `WHERE`, `IN`, `BETWEEN`, and `LIKE` for refined results.
5. Joins: Combining data from `Employee`, `Department`, and `Location` tables.
6. Advanced Data Retrieval: Using subqueries and set operators for more complex queries.
7. Updates and Deletions: Performing update operations and deleting specific records.

## Usage

To use the SQL queries:
1. Clone this repository to your local machine.
2. Set up a database with the necessary tables (`Employee`, `Department`, `Product`, `Fact`, etc.).
3. Execute the SQL queries as needed based on your business requirements.

## Requirements

- SQL Server or any relational database management system (RDBMS) to run these queries.
- Sample data should be inserted into tables before executing the queries.