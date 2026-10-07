[README (3).md](https://github.com/user-attachments/files/33153405/README.3.md)
# 🎓 University Course Management System

## 📌 Project Description

This project is a MySQL database system that is used to manage university students, courses, instructors, departments, and enrollments. It stores all the data in related tables and uses SQL queries to add, update, search, and analyze the information.

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Command Line Client

## 📂 Database Name

`University`

## 📋 Tables Used

**1. Students**
Stores the details of every student. Important columns: `student_id`, `first_name`, `last_name`, `email`, `enrollment_date`, `department_id`.

**2. Courses**
Stores the courses offered by the university. Important columns: `course_id`, `course_name`, `credits`, `department_id`, `instructor_id`.

**3. Instructors**
Stores the details of the instructors. Important columns: `instructor_id`, `first_name`, `last_name`, `salary`, `department_id`.

**4. Enrollments**
Connects students with the courses they have joined. Important columns: `enrollment_id`, `student_id`, `course_id`, `enrollment_date`.

**5. Departments**
Stores the university departments. Important columns: `department_id`, `department_name`.

## ⚙️ Project Features

- Creating the database and tables
- Inserting sample data
- CRUD operations (Create, Read, Update, Delete)
- Retrieving students based on enrollment date
- Finding courses by department
- Counting students in courses
- Finding students enrolled in multiple courses
- Calculating average course credits
- Finding maximum instructor salary
- Counting students by department
- Using INNER JOIN
- Using LEFT JOIN
- Using subqueries
- Extracting year from dates
- Concatenating names
- Using window functions
- Using CASE statements

## 🔍 SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- INSERT
- SELECT
- UPDATE
- DELETE
- WHERE
- JOIN
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- LIMIT
- DISTINCT
- IN
- INTERSECT
- Aggregate functions such as COUNT(), AVG(), MAX()
- Subqueries
- YEAR()
- CONCAT()
- DATEDIFF()
- CASE
- ROW_NUMBER()

## 🗃️ Sample Data

The project contains sample records for:

- Students: John Doe, Jane Smith, Alice Johnson, Bob Lee
- Departments: Computer Science, Mathematics
- Courses: Introduction to SQL, Data Structures

## ▶️ How to Run the Project

1. Open MySQL Command Line Client.
2. Enter the MySQL password.
3. Create the database:
   ```sql
   CREATE DATABASE University;
   ```
4. Select the database:
   ```sql
   USE University;
   ```
5. Create all five tables (Students, Courses, Instructors, Enrollments, Departments).
6. Insert the sample data.
7. Run the queries one by one.
8. Check the output after each query.

## 📁 Project Structure

```
University-Course-Management-System/
│
├── Final Project.sql
└── README.md
```

`Final Project.sql` contains the database creation, table creation, sample data, and all the SQL queries used in this project.

## 📊 Expected Result

This project shows how SQL can be used to store, update, retrieve, and analyze university course-related information. After running the queries, we can see student lists, course details, enrollment counts, and other useful results from the data.

## 👩‍💻 Author

Lisa Patel

⭐ Thank you for taking the time to read about my project. I hope it helps you understand how SQL can be used to manage university data.
