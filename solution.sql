CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Drop old tables if they already exist
DROP VIEW IF EXISTS StudentDetails;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

INSERT INTO Department VALUES
(101, 'Computer Science'),
(102, 'Information Technology'),
(103, 'Commerce');

INSERT INTO Student VALUES
(1, 'Arun', 101),
(2, 'Divya', 102),
(3, 'Karthik', 101),
(4, 'Nisha', 103);

INSERT INTO Course VALUES
(201, 'Database Management System'),
(202, 'Python Programming'),
(203, 'Computer Networks');

INSERT INTO Enrollment VALUES
(1, 1, 201),
(2, 1, 202),
(3, 2, 201),
(4, 3, 203),
(5, 4, 204);
