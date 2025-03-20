# **SQL Assignments - Intellipaat Certification** 🛠️📊  

## **📌 Overview**  
This repository contains **SQL assignments** completed as part of my **SQL Certification from Intellipaat**. The assignments cover essential **SQL concepts** like **data manipulation, joins, constraints, functions, transactions, stored procedures, views, and triggers**.  

Each assignment is structured to demonstrate real-world SQL problem-solving techniques applied to **sales and restaurant datasets**.  

---

## **📂 Assignments Summary**  

### **1️⃣ Assignment 1: Sales Data Analysis**  
📌 **Objective**: Managing a database of Salesmen, Customers, and Orders to perform queries on sales performance.  

📌 **Key Concepts Covered**:  
- **Database Design**: `CREATE TABLE`, `INSERT`, `ALTER TABLE`  
- **Constraints**: `PRIMARY KEY`, `FOREIGN KEY`, `DEFAULT`, `NOT NULL`  
- **Joins & Set Operations**: `INNER JOIN`, `RIGHT JOIN`, `UNION`  
- **Filtering & Aggregations**: `LIKE`, `BETWEEN`, `SUM()`, `GROUP BY`  

📌 **Key Queries**:  
✔ Fetching **sales details** for a specific customer.  
✔ Extracting **matching Salesman & Customer details**.  
✔ Using **set operations** to retrieve unique `SalesmanId`.  
✔ Using **joins** to analyze **Order details** based on purchase range.  

📌 **File**: [`Assignment1.sql`](https://github.com/navya99g/SQL_Case_Study/blob/main/Assignment/Assignment%201.sql) 

---

### **2️⃣ Assignment 2: Zomato Restaurant Analysis**  
📌 **Objective**: Analyzing restaurant data from **Zomato** using **functions, string operations, and aggregations**.  

📌 **Key Concepts Covered**:  
- **User-Defined Functions (UDFs)**  
- **String Operations**: `STUFF()`, `LIKE`  
- **Conditional Statements**: `CASE` (for categorizing ratings)  
- **Math Functions**: `CEIL()`, `FLOOR()`, `ABS()`  
- **Aggregations**: `GROUP BY` with `ROLLUP`  

📌 **Key Queries**:  
✔ Creating a **UDF** to modify restaurant names dynamically.  
✔ Identifying **top-rated restaurants** based on cuisine type.  
✔ Categorizing restaurants into **Excellent, Good, Average, and Bad** based on ratings.  
✔ Using **ROLLUP** to analyze **total cost distribution** by restaurant type.  

📌 **File**: [`Assignment2.sql`](./Assignment%202.sql)  

---

### **3️⃣ Assignment 3: Advanced SQL - Transactions, Views & Triggers**  
📌 **Objective**: Implementing **transactions, stored procedures, triggers, and views** for advanced database management.  

📌 **Key Concepts Covered**:  
- **Stored Procedures** (`CREATE PROCEDURE`)  
- **Transactions** (`BEGIN TRANSACTION`, `ROLLBACK`, `COMMIT`)  
- **Row Numbering** (`ROW_NUMBER()`)  
- **Loops in SQL** (`WHILE`)  
- **Views** (`CREATE VIEW`)  
- **Triggers** (`CREATE TRIGGER`)  

📌 **Key Queries**:  
✔ **Stored Procedure** to filter restaurants based on table booking.  
✔ **Transaction Handling** for updating cuisine type and rolling back changes.  
✔ **Trigger** to notify users when a new order is placed.  
✔ **View** to store **top 5 highest-rated restaurants**.  

📌 **File**: [`Assignment3.sql`](https://github.com/navya99g/SQL_Case_Study/blob/main/Assignment/Assignment%203.sql)  

---