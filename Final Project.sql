 CREATE DATABASE University;
OUTPUT:
Query OK, 1 row affected (0.171 sec)

USE University;
OUTPUT:
Database changed

1. CREATE STUDENT TABLE

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);
OUTPUT:
Query OK, 0 rows affected (0.605 sec)

2. CREATE COURSES TABLE

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT
);
OUTPUT:
Query OK, 0 rows affected (0.300 sec)

3. CREATE INSTRUCTOR TABLE

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2)
);
OUTPUT:
Query OK, 0 rows affected (0.321 sec)

4. CREATE ENROLLMENTS TABLE

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE
);
OUTPUT:
Query OK, 0 rows affected (0.352 sec)

5. CREATE DEPARTMENTS TABLE

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);
OUTPUT:
Query OK, 0 rows affected (0.278 sec)

INSERT DATA INTO DEPARTMENTS TABLE

INSERT INTO Departments
VALUES (1, 'Computer Science');

INSERT INTO Departments
VALUES (2, 'Mathematics');
OUTPUT:
Query OK, 1 row affected (0.060 sec)

INSERT DATA INTO STUDENTS TABLE

INSERT INTO Students
VALUES (1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01');

INSERT INTO Students
VALUES (2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');
OUTPUT:
Query OK, 1 row affected (0.101 sec)

Insert DATA INTO COURSES TABLE

INSERT INTO Courses
VALUES (101, 'Introduction to SQL', 1, 3);

INSERT INTO Courses
VALUES (102, 'Data Structures', 2, 4);
OUTPUT:
Query OK, 1 row affected (0.100 sec)

Insert DATA INTO INSTRUCTORS TABLE

INSERT INTO Instructors
VALUES (1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 60000);

INSERT INTO Instructors
VALUES (2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 55000);
OUTPUT:
Query OK, 1 row affected (0.094 sec)

Insert DATA INTO ENROLLMENTS TABLE

INSERT INTO Enrollments
VALUES (1, 1, 101, '2022-08-01');

INSERT INTO Enrollments
VALUES (2, 2, 102, '2021-08-01');
OUTPUT:
Query OK, 1 row affected (0.107 sec)

1. CRUD OPERATIONS ON TABLE

READ STUDENTS TABLE

SELECT * FROM Students;
OUTPUT:
+-----------+-----------+----------+----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com   | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com | 1999-05-25 | 2021-08-01     |
+-----------+-----------+----------+----------------------+------------+----------------+
2 rows in set (0.138 sec)

UPDATE STUDENT E-MAIL

UPDATE Students
SET Email = 'john.updated@email.com'
WHERE StudentID = 1;
OUTPUT:
Query OK, 1 row affected (0.209 sec)
Rows matched: 1  Changed: 1  Warnings: 0

DELETE AN ENROLLMENT

DELETE FROM Enrollments
WHERE EnrollmentID = 99;
OUTPUT:
Query OK, 0 rows affected (0.090 sec)

2. Find Students Who Enrolled After 2022

SELECT *FROM Students
WHERE EnrollmentDate > '2022-12-31';
OUTPUT:
Empty set (0.065 sec)

3. Find Courses from Mathematics Department

SELECT c.*FROM Courses c
JOIN Departments d
ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;
OUTPUT:
+----------+-----------------+--------------+---------+
| CourseID | CourseName      | DepartmentID | Credits |
+----------+-----------------+--------------+---------+
|      102 | Data Structures |            2 |       4 |
+----------+-----------------+--------------+---------+
1 row in set (0.108 sec)

4. Count Students in Each Course

SELECT CourseID, COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 5;
OUTPUT:
Empty set (0.131 sec)

5. Find Students Enrolled in Both Courses

SELECT s.*
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Introduction to SQL'

INTERSECT

SELECT s.*
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Data Structures';
OUTPUT:
Empty set (0.132 sec)

6. Find Students Enrolled in Either Course

SELECT DISTINCT s.*
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');
OUTPUT:
+-----------+-----------+----------+------------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                  | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+------------------------+------------+----------------+
|         1 | John      | Doe      | john.updated@email.com | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com   | 1999-05-25 | 2021-08-01     |
+-----------+-----------+----------+------------------------+------------+----------------+
2 rows in set (0.128 sec)

7. Calculate Average Course Credits

SELECT AVG(Credits) AS AverageCredits
FROM Courses;
OUTPUT:
+----------------+
| AverageCredits |
+----------------+
|         3.5000 |
+----------------+
1 row in set (0.101 sec)

8. Find Maximum Instructor Salary

SELECT MAX(i.Salary) AS MaxSalary
FROM Instructors i
JOIN Departments d
ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';
OUTPUT:
+-----------+
| MaxSalary |
+-----------+
|  60000.00 |
+-----------+
1 row in set (0.094 sec)

9. Count Students in Each Department

SELECT d.DepartmentName, COUNT(e.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Courses c
ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;
OUTPUT:
+------------------+--------------+
| DepartmentName   | StudentCount |
+------------------+--------------+
| Computer Science |            1 |
| Mathematics      |            1 |
+------------------+--------------+
2 rows in set (0.090 sec)

10. INNER JOIN: Students and Their Courses

SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID;
OUTPUT:
+-----------+----------+---------------------+
| FirstName | LastName | CourseName          |
+-----------+----------+---------------------+
| John      | Doe      | Introduction to SQL |
| Jane      | Smith    | Data Structures     |
+-----------+----------+---------------------+
2 rows in set (0.011 sec)

11. LEFT JOIN: All Students and Their Courses

SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID
LEFT JOIN Courses c
ON e.CourseID = c.CourseID;
OUTPUT:
+-----------+----------+---------------------+
| FirstName | LastName | CourseName          |
+-----------+----------+---------------------+
| John      | Doe      | Introduction to SQL |
| Jane      | Smith    | Data Structures     |
+-----------+----------+---------------------+
2 rows in set (0.012 sec)

12. Subquery: Students in Courses with More Than 10 Students

SELECT FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);
OUTPUT:
Empty set (0.082 sec)

13. Extract Enrollment Year

SELECT FirstName, LastName, YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;
OUTPUT:
+-----------+----------+----------------+
| FirstName | LastName | EnrollmentYear |
+-----------+----------+----------------+
| John      | Doe      |           2022 |
| Jane      | Smith    |           2021 |
+-----------+----------+----------------+
2 rows in set (0.094 sec)

14. Concatenate Instructor Name

SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;
OUTPUT:
+---------------+
| FullName      |
+---------------+
| Alice Johnson |
| Bob Lee       |
+---------------+
2 rows in set (0.081 sec)

15. Running Total of Students Enrolled

SELECT EnrollmentID, CourseID, StudentID,
       ROW_NUMBER() OVER (ORDER BY EnrollmentID) AS RunningTotalStudents
FROM Enrollments;
OUTPUT:
+--------------+----------+-----------+----------------------+
| EnrollmentID | CourseID | StudentID | RunningTotalStudents |
+--------------+----------+-----------+----------------------+
|            1 |      101 |         1 |                    1 |
|            2 |      102 |         2 |                    2 |
+--------------+----------+-----------+----------------------+
2 rows in set (0.124 sec)

16. Label Students as Senior or Junior

SELECT FirstName, LastName, EnrollmentDate,
       CASE
           WHEN DATEDIFF(CURRENT_DATE, EnrollmentDate) > (365 * 4)
           THEN 'Senior'
           ELSE 'Junior'
       END AS StudentCategory
FROM Students;
OUTPUT:
+-----------+----------+----------------+-----------------+
| FirstName | LastName | EnrollmentDate | StudentCategory |
+-----------+----------+----------------+-----------------+
| John      | Doe      | 2022-08-01     | Senior          |
| Jane      | Smith    | 2021-08-01     | Senior          |
+-----------+----------+----------------+-----------------+
2 rows in set (0.120 sec)