-- ============================================================
-- File: 2_insert_data.sql
-- Purpose: Insert sample data into aug_test database
-- ============================================================

USE aug_test;

-- ================= States =================
INSERT INTO States VALUES
(1, 'Madhya Pradesh'),
(2, 'Maharashtra');

-- ================= Cities =================
INSERT INTO Cities VALUES
(101, 'Bhopal', 1),
(102, 'Indore', 1),
(103, 'Mumbai', 2),
(104, 'Pune', 2);

-- ================= Students =================
INSERT INTO Students VALUES
(1, 'Amit', 'Male', 21, 101, '2023-01-15'),
(2, 'Priya', 'Female', 22, 102, '2023-02-10'),
(3, 'Rohan', 'Male', 20, 103, '2023-03-05'),
(4, 'Neha', 'Female', 23, 104, '2023-01-25'),
(5, 'Vikram', 'Male', 21, 101, '2023-04-18');

-- ================= Courses =================
INSERT INTO Courses VALUES
(201, 'SQL Basics', 'Database'),
(202, 'Python Programming', 'Programming'),
(203, 'Data Science', 'Analytics'),
(204, 'Machine Learning', 'AI');

-- ================= Enrollments =================
INSERT INTO Enrollments VALUES
(301, 1, 201, '2023-01-20', 'A'),
(302, 1, 202, '2023-01-25', 'B'),
(303, 2, 201, '2023-02-15', 'A'),
(304, 3, 203, '2023-03-10', 'B'),
(305, 4, 202, '2023-01-30', 'A'),
(306, 4, 204, '2023-02-05', 'C'),
(307, 5, 201, '2023-04-20', 'B');
