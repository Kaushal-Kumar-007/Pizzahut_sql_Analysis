# 🍕 Pizza Sales Analysis Using SQL

## 📌 Project Overview

This project focuses on analyzing a **Pizza Sales Dataset** using **SQL** to uncover business insights related to revenue, customer ordering patterns, pizza categories, and sales performance.

The analysis includes:
- Revenue analysis
- Top-selling pizzas
- Category-wise sales
- Order trends
- Time-based analysis
- Window functions
- Aggregate functions
- Joins and subqueries

The project demonstrates strong understanding of:
- SQL querying
- Data analysis
- Business intelligence concepts
- Relational database management

---

# 🎯 Business Objective

The main objective of this project is to help a pizza business:
- Track sales performance
- Identify best-selling pizzas
- Understand customer ordering behavior
- Analyze category-wise revenue
- Monitor peak ordering hours
- Improve business decision-making using SQL insights

---

# 🧰 Technologies Used

- SQL
- MySQL
- Relational Database Management System (RDBMS)

---

# 📂 Database Schema

The project uses multiple related tables:

## 1️⃣ Orders Table

| Column Name | Description |
|---|---|
| Order_ID | Unique order identifier |
| Order_date | Date of order |
| Order_time | Time of order |

---

## 2️⃣ Order Details Table

| Column Name | Description |
|---|---|
| order_details_id | Unique order details ID |
| order_id | Order reference ID |
| pizza_id | Pizza identifier |
| quantity | Quantity ordered |

---

## 3️⃣ Pizzas Table

| Column Name | Description |
|---|---|
| pizza_id | Pizza identifier |
| pizza_type_id | Pizza type reference |
| size | Pizza size |
| price | Pizza price |

---

## 4️⃣ Pizza Types Table

| Column Name | Description |
|---|---|
| pizza_type_id | Pizza type identifier |
| name | Pizza name |
| category | Pizza category |

---

# 🧮 SQL Concepts Used

This project includes practical implementation of:

- SELECT statements
- WHERE clause
- GROUP BY
- ORDER BY
- HAVING clause
- Aggregate Functions
- INNER JOIN
- Subqueries
- Window Functions
- Ranking Functions
- Date & Time Functions

---

# 📊 Business Questions Solved

## ✅ Category-wise Pizza Price Analysis

Analyzed pizza sizes and total sales contribution.

### SQL Concepts Used:
- GROUP BY
- HAVING
- SUM()

---

## ✅ Total Pizza Categories

Counted total pizza categories available.

### SQL Concepts Used:
- COUNT()
- GROUP BY

---

## ✅ Total Revenue Generated

Calculated total revenue from pizza sales.

### SQL Concepts Used:
- SUM()
- INNER JOIN

---

## ✅ Highest Priced Pizza

Identified the most expensive pizza.

### SQL Concepts Used:
- MAX()
- JOIN
- ORDER BY

---

## ✅ Most Common Pizza Size Ordered

Analyzed customer preference by pizza size.

### SQL Concepts Used:
- COUNT()
- GROUP BY
- ORDER BY

---

## ✅ Top 5 Most Ordered Pizza Types

Identified the pizzas with highest order quantity.

### SQL Concepts Used:
- SUM()
- GROUP BY
- LIMIT

---

## ✅ Category-wise Quantity Ordered

Calculated total quantity sold per pizza category.

### SQL Concepts Used:
- JOIN
- SUM()
- GROUP BY

---

## ✅ Hourly Order Distribution

Analyzed order frequency by hour.

### SQL Concepts Used:
- HOUR()
- COUNT()

---

## ✅ Average Pizzas Ordered Per Day

Calculated average pizzas sold daily.

### SQL Concepts Used:
- Subqueries
- AVG()
- GROUP BY

---

## ✅ Top 3 Pizza Types by Revenue

Identified highest revenue-generating pizzas.

### SQL Concepts Used:
- SUM()
- ORDER BY
- LIMIT

---

## ✅ Revenue Contribution by Category

Calculated percentage contribution of each pizza category.

### SQL Concepts Used:
- Subqueries
- Percentage Calculations
- ROUND()

---

## ✅ Cumulative Revenue Analysis

Tracked cumulative revenue over time.

### SQL Concepts Used:
- Window Functions
- OVER()
- ORDER BY

---

## ✅ Top 3 Revenue-Generating Pizzas per Category

Ranked pizzas within each category.

### SQL Concepts Used:
- RANK()
- PARTITION BY
- Window Functions

---

# 📈 Key Insights

- Certain pizza categories contribute significantly more revenue.
- Large-sized pizzas are ordered more frequently.
- Peak ordering hours can help optimize operations.
- A few pizza types generate major revenue contribution.
- Revenue trends can help businesses forecast future sales.

---

# 📚 Sample SQL Queries

## Total Revenue Generated

```sql
SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS Total_Revenue
FROM
    order_details AS od
INNER JOIN
    pizzas AS p 
ON od.pizza_id = p.pizza_id;
```

---

## Top 5 Most Ordered Pizza Types

```sql
SELECT 
    pizza_types.name,
    SUM(order_details.quantity) AS quantity
FROM
    pizza_types
JOIN pizzas 
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details 
    ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;
```

---

## Cumulative Revenue Analysis

```sql
SELECT order_date, 
SUM(revenue) OVER(ORDER BY order_date) AS cumulative_revenue
FROM
(
    SELECT 
        orders.order_date,
        SUM(order_details.quantity * pizzas.price) AS revenue
    FROM order_details
    JOIN pizzas 
        ON order_details.pizza_id = pizzas.pizza_id
    JOIN orders
        ON orders.Order_ID = order_details.order_id
    GROUP BY orders.Order_date
) AS sales;
```

---

# 📁 Project Structure

```bash
Pizza-Sales-SQL-Analysis/
│
├── Acing_Assignmeni 03.sql
├── README.md
└── Dataset Files
```

---

# ▶️ How to Run the Project

## 1️⃣ Create Database

```sql
CREATE DATABASE pizzahut;
USE pizzahut;
```

---

## 2️⃣ Import Dataset Tables

Import:
- orders
- order_details
- pizzas
- pizza_types

---

## 3️⃣ Run SQL File

Execute:

```sql
Acing_Assignmeni 03.sql
```

---

# 📚 What I Learned

Through this project, I learned:
- Writing optimized SQL queries
- Data analysis using SQL
- Working with relational databases
- Using joins and subqueries
- Implementing window functions
- Solving real-world business problems using SQL

---

# 👩‍💻 Author

**Kaushal Kumar**  
Aspiring Data Analyst | SQL & Power BI Enthusiast

---

# ⭐ If You Like This Project

Please consider giving this repository a ⭐ on GitHub.
