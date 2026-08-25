USE hardik;
DROP TABLE IF EXISTS faculty;
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS department;


CREATE TABLE IF NOT EXISTS department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO department (dept_id, dept_name)
VALUES
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Mechanical');
CREATE TABLE student (
roll_no INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
aadhar_no VARCHAR(12) UNIQUE,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES department (dept_id)
);
CREATE TABLE course (
course_id INT PRIMARY KEY,
course_name VARCHAR(50) NOT NULL,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES department (dept_id)
);
CREATE TABLE enrollment (
roll_no INT,
course_id INT,
semester INT CHECK (semester BETWEEN 1 AND 8),
grade CHAR(2),
PRIMARY KEY (roll_no , course_id , semester),
FOREIGN KEY (roll_no) REFERENCES student  (roll_no),
FOREIGN KEY (course_id) REFERENCES course (course_id)
);
CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    dept_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary FLOAT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO faculty
(faculty_id, dept_id, first_name, last_name, salary)
VALUES
(101, 1, 'Rahul', 'Sharma', 55000),
(102, 2, 'Priya', 'Patil', 60000),
(103, 1, 'Amit', 'Verma', 58000),
(104, 3, 'Neha', 'Joshi', 62000),
(105, 2, 'Sanjay', 'Deshmukh', 57000);

SELECT * FROM faculty;
College Database Management System

Project Overview

This project contains a MySQL database for managing college departments, students, courses, enrollments, and faculty.

Database name:

hardik

The database is designed using relational database concepts and is normalized up to Third Normal Form (3NF).

Tables

1. Department

Stores information about college departments.

Columns:

dept_id - Primary key

dept_name - Unique department name

Sample departments:

Computer Science

Electronics

Mechanical

2. Student

Stores student information.

Columns:

roll_no - Primary key

name

email - Unique

aadhar_no - Unique

dept_id - Foreign key referencing department

3. Course

Stores course information.

Columns:

course_id - Primary key

course_name

dept_id - Foreign key referencing department

4. Enrollment

Stores the courses taken by students.

Columns:

roll_no - Foreign key referencing student

course_id - Foreign key referencing course

semester - Semester number from 1 to 8

grade

Primary key:

(roll_no, course_id, semester)

5. Faculty

Stores faculty information.

Columns:

faculty_id - Primary key

dept_id - Foreign key referencing department

first_name

last_name

salary

Relationships

One department can have many students.

One department can offer many courses.

One department can have many faculty members.

One student can enroll in many courses.

One course can have many students.

The Enrollment table creates the many-to-many relationship between students and courses.

Normalization

First Normal Form (1NF)

The database satisfies 1NF because:

Each table has a primary key.

All column values are atomic.

There are no repeating groups.

Each field contains a single value.

Second Normal Form (2NF)

The database satisfies 2NF because:

It is already in 1NF.

There are no partial dependencies.

In the Enrollment table, grade depends on the complete composite key (roll_no, course_id, semester).

Third Normal Form (3NF)

The database satisfies 3NF because:

It is already in 2NF.

There are no transitive dependencies.

Department details are stored only in the department table and referenced using dept_id.

Student, course, and faculty details depend on their respective primary keys.

Functional Dependencies

Department:
dept_id → dept_name

Student:
roll_no → name, email, aadhar_no, dept_id

Course:
course_id → course_name, dept_id

Enrollment:
(roll_no, course_id, semester) → grade

Faculty:
faculty_id → dept_id, first_name, last_name, salary

Database Structure

                   DEPARTMENT
                 /     |                      /      |                      ↓       ↓        ↓
           STUDENT   COURSE   FACULTY
              \        /
               \      /
                ↓    ↓
                ENROLLMENT

Sample Faculty Data

Faculty ID

Department

First Name

Last Name

Salary

101

1

Rahul

Sharma

55000

102

2

Priya

Patil

60000

103

1

Amit

Verma

58000

104

3

Neha

Joshi

62000

105

2

Sanjay

Deshmukh

57000

Constraints Used

The database uses:

Primary keys

Foreign keys

Unique constraints

NOT NULL

CHECK

Composite primary key

Conclusion

The College Database Management System is organized as a relational database with separate tables for departments, students, courses, enrollments, and faculty.

The database is normalized up to 3NF, which helps reduce data redundancy, improve data consistency, and maintain clear relationships between entities.

How to Run

Open MySQL Workbench or MySQL Command Line.

Select or create the hardik database.

Run the SQL script.

Execute:

SELECT * FROM faculty;

to verify the faculty records.
