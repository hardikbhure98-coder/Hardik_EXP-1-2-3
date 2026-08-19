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
