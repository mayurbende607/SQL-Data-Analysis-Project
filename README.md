# SQL Data Analysis Project (MySQL)

## 📌 Project Overview
This project is a **MySQL-based SQL Data Analysis system** designed to demonstrate both fundamental and advanced SQL concepts.  
It simulates a real-world **student–course enrollment system** and is ideal for learning, interviews, and portfolio projects.

---

## 🗄️ Database Details
- **Database Name:** aug_test
- **Database Type:** MySQL

---

## 📂 Project Structure
SQL-Data-Analysis-Project/
│
├── Screenshot
├── 1_create_tables.sql
├── 2_insert_data.sql
├── 3_queries.sql
├── README.md


---

## 🧱 Tables Description

### 1. Students
Stores student personal and academic details.
- student_id (Primary Key)
- name
- gender
- age
- city_id
- joining_date

### 2. Courses
Stores course information.
- course_id (Primary Key)
- course_name
- category

### 3. Enrollments
Junction table connecting students and courses.
- enrollment_id (Primary Key)
- student_id (Foreign Key)
- course_id (Foreign Key)
- enrollment_date
- grade

### 4. Cities
Stores city information.
- city_id (Primary Key)
- city_name
- state_id

### 5. States
Stores state information.
- state_id (Primary Key)
- state_name

---

## ⚙️ SQL Files Explanation

### 1_create_tables.sql
- Creates the database and all required tables
- Defines primary key and foreign key relationships

### 2_insert_data.sql
- Inserts sample data into all tables
- Provides realistic records for query execution

### 3_queries.sql
Contains **30+ SQL queries**, including:
- INNER JOIN and LEFT JOIN
- Aggregate functions (COUNT, AVG, MIN)
- GROUP BY and HAVING clauses
- String functions (SUBSTRING, CONCAT, UPPER)
- Subqueries using ANY and ALL
- Views creation and usage
- Stored procedures

---

## 🔍 SQL Operations Covered
- Student and course enrollment analysis
- City-wise and state-wise student count
- Gender-based grouping
- Course popularity analysis
- Recently joined students
- Advanced filtering using subqueries
- Reusable logic using views and procedures

---

## 🧠 Advanced Concepts Used
- Views
- Stored Procedures
- Subqueries
- GROUP_CONCAT
- ANY / ALL operators
- HAVING clause

---

## ▶️ How to Run the Project
1. Open MySQL Workbench
2. Execute `1_create_tables.sql`
3. Execute `2_insert_data.sql`
4. Execute `3_queries.sql`

---
## 📸 Project Screenshots

### MySQL Query Execution
![MySQL Query](screenshots/3query.png)


---


## 🎯 Purpose of the Project
- SQL interview preparation
- Academic and college submission
- Hands-on SQL practice
- GitHub portfolio project

---

## 👤 Author
**Mayur Bende**

---

## ⭐ Conclusion
This project demonstrates strong SQL fundamentals along with advanced querying techniques using MySQL.  
It is suitable for students, freshers, and anyone preparing for SQL-based roles.

Feel free to ⭐ star the repository if you find it useful!
