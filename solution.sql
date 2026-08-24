CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Drop old tables if they already exist
DROP VIEW IF EXISTS StudentDetails;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Department;

-- Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

-- Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL
);

-- Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

-- Insert Department values
INSERT INTO Department VALUES
(101, 'Computer Science'),
(102, 'Information Technology'),
(103, 'Commerce');

-- Insert Student values
INSERT INTO Student VALUES
(1, 'Arun', 101),
(2, 'Divya', 102),
(3, 'Karthik', 101),
(4, 'Nisha', 103);

-- Insert Course values
INSERT INTO Course VALUES
(201, 'Database Management System'),
(202, 'Python Programming'),
(203, 'Computer Networks');

-- Insert Enrollment values
INSERT INTO Enrollment VALUES
(1, 1, 201),
(2, 1, 202),
(3, 2, 201),
(4, 3, 203),
(5, 4, 202);

-- Create the view
CREATE VIEW StudentDetails AS
SELECT
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
INNER JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
INNER JOIN Course
    ON Enrollment.CourseID = Course.CourseID
INNER JOIN Department
    ON Student.DepartmentID = Department.DepartmentID;

-- Display the view
SELECT * FROM StudentDetails;
