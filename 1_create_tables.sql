-- ============================================================
-- File: 1_create_tables.sql
-- Purpose: Create database and tables for SQL project
-- ============================================================

CREATE DATABASE IF NOT EXISTS aug_test;
USE aug_test;

-- ================= Students Table =================
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    city_id INT,
    joining_date DATE
);

-- ================= Courses Table =================
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50)
);

-- ================= Enrollments Table =================
CREATE TABLE IF NOT EXISTS Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- ================= Cities Table =================
CREATE TABLE IF NOT EXISTS Cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(50),
    state_id INT
);

-- ================= States Table =================
CREATE TABLE IF NOT EXISTS States (
    state_id INT PRIMARY KEY,
    state_name VARCHAR(50)
);
