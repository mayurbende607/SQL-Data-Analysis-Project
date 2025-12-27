-- ============================================================
-- File: 3_queries.sql
-- Database: aug_test
-- Purpose: SQL queries, views, and stored procedures
-- ============================================================

USE aug_test;

-- ============================================================
-- 1. List student names along with their enrolled course names and grades
-- ============================================================
SELECT s.name AS student_name,
       c.course_name,
       e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id;

-- ============================================================
-- 2. Display student name, city name, and state name
-- ============================================================
SELECT s.name AS student_name,
       ci.city_name,
       st.state_name
FROM states st
JOIN cities ci ON st.state_id = ci.state_id
JOIN students s ON s.city_id = ci.city_id;

-- ============================================================
-- 3. Find students who have not enrolled in any course
-- ============================================================
SELECT s.name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- Alternative method
SELECT name
FROM students
WHERE student_id NOT IN (SELECT student_id FROM enrollments);

-- ============================================================
-- 4. List all courses with total number of students enrolled
-- ============================================================
SELECT c.course_name,
       COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- ============================================================
-- 5. Show each state and total number of enrollments
-- ============================================================
SELECT st.state_name,
       COUNT(e.enrollment_id) AS total_enrollments
FROM states st
JOIN cities ci ON st.state_id = ci.state_id
JOIN students s ON s.city_id = ci.city_id
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY st.state_name;

-- ============================================================
-- 6. Show average age of students in each city
-- ============================================================
SELECT ci.city_name,
       AVG(s.age) AS average_age
FROM cities ci
JOIN students s ON ci.city_id = s.city_id
GROUP BY ci.city_name;

-- ============================================================
-- 7. Display courses with more than 2 enrollments
-- ============================================================
SELECT c.course_name,
       COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING enrollment_count > 2;

-- ============================================================
-- 8. Students grouped by gender with count
-- ============================================================
SELECT gender,
       COUNT(*) AS total_students
FROM students
GROUP BY gender;

-- ============================================================
-- 9. Top 3 most recently joined students
-- ============================================================
SELECT name,
       joining_date
FROM students
ORDER BY joining_date DESC
LIMIT 3;

-- ============================================================
-- 10. Number of students in each state with age > 21
-- ============================================================
SELECT st.state_name,
       COUNT(s.student_id) AS total_students
FROM students s
JOIN cities ci ON s.city_id = ci.city_id
JOIN states st ON st.state_id = ci.state_id
WHERE s.age > 21
GROUP BY st.state_name;

-- ============================================================
-- 11. First 3 letters of each student name
-- ============================================================
SELECT SUBSTRING(name, 1, 3) AS short_name
FROM students;

-- ============================================================
-- 12. Combine student name and city
-- ============================================================
SELECT CONCAT_WS(' - ', s.name, ci.city_name) AS student_city
FROM students s
JOIN cities ci ON s.city_id = ci.city_id;

-- ============================================================
-- 13. Replace 'Programming' with 'Coding' in course names
-- ============================================================
SELECT REPLACE(course_name, 'Programming', 'Coding') AS updated_course_name
FROM courses;

-- ============================================================
-- 14. Display all student names in uppercase
-- ============================================================
SELECT UPPER(name) AS student_name
FROM students;

-- ============================================================
-- 15. Students whose name has 'a' as second character
-- ============================================================
SELECT name
FROM students
WHERE name LIKE '_a%';

-- ============================================================
-- 16. Create view: student name, course name, grade
-- ============================================================
CREATE OR REPLACE VIEW student_course_view AS
SELECT s.name,
       c.course_name,
       e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id;

-- ============================================================
-- 17. Students with grade 'A' using view
-- ============================================================
SELECT *
FROM student_course_view
WHERE grade = 'A';

-- ============================================================
-- 18. Create view: state name and student count
-- ============================================================
CREATE OR REPLACE VIEW state_student_count AS
SELECT st.state_name,
       COUNT(s.student_id) AS student_count
FROM states st
JOIN cities ci ON st.state_id = ci.state_id
JOIN students s ON s.city_id = ci.city_id
GROUP BY st.state_name;

-- ============================================================
-- 19. States having more than 1 student
-- ============================================================
SELECT *
FROM state_student_count
WHERE student_count > 1;

-- ============================================================
-- 20. Drop view
-- ============================================================
DROP VIEW IF EXISTS state_student_count;

-- ============================================================
-- 21. Stored Procedure: List all courses of a student
-- ============================================================
DELIMITER //
CREATE PROCEDURE get_student_courses(IN studentId INT)
BEGIN
    SELECT c.course_name,
           s.name
    FROM enrollments e
    JOIN courses c ON e.course_id = c.course_id
    JOIN students s ON s.student_id = e.student_id
    WHERE e.student_id = studentId;
END //
DELIMITER ;

-- CALL get_student_courses(1);

-- ============================================================
-- 22. Stored Procedure: Students and grades for a course
-- ============================================================
DELIMITER //
CREATE PROCEDURE get_course_students(IN courseId INT)
BEGIN
    SELECT c.course_name,
           s.name,
           e.grade
    FROM enrollments e
    JOIN students s ON e.student_id = s.student_id
    JOIN courses c ON e.course_id = c.course_id
    WHERE c.course_id = courseId;
END //
DELIMITER ;

-- CALL get_course_students(201);

-- ============================================================
-- 23. Students older than ANY student from Mumbai
-- ============================================================
SELECT s.name,
       s.age
FROM students s
WHERE s.age > ANY (
    SELECT s2.age
    FROM students s2
    JOIN cities c ON c.city_id = s2.city_id
    WHERE c.city_name = 'Mumbai'
);

-- ============================================================
-- 24. Students older than ALL students from Bhopal
-- ============================================================
SELECT s.name,
       s.age
FROM students s
WHERE s.age > ALL (
    SELECT s2.age
    FROM students s2
    JOIN cities c ON c.city_id = s2.city_id
    WHERE c.city_name = 'Bhopal'
);

-- ============================================================
-- 25. Number of courses per student (descending order)
-- ============================================================
SELECT s.name,
       COUNT(e.course_id) AS course_count
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.name
ORDER BY course_count DESC;

-- ============================================================
-- 26. Student name, city, and concatenated course names
-- ============================================================
SELECT s.name,
       ci.city_name,
       GROUP_CONCAT(c.course_name SEPARATOR ', ') AS courses_enrolled
FROM students s
JOIN cities ci ON s.city_id = ci.city_id
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.name, ci.city_name;

-- ============================================================
-- 27. States where all students are older than 20
-- ============================================================
SELECT st.state_name
FROM students s
JOIN cities ci ON s.city_id = ci.city_id
JOIN states st ON st.state_id = ci.state_id
GROUP BY st.state_name
HAVING MIN(s.age) > 20;

-- ============================================================
-- 28. Student names with course count per city
-- ============================================================
SELECT s.name,
       ci.city_name,
       COUNT(e.course_id) AS total_courses
FROM students s
JOIN cities ci ON ci.city_id = s.city_id
JOIN enrollments e ON e.student_id = s.student_id
GROUP BY s.name, ci.city_name;

-- ============================================================
-- 29. Courses where all enrolled students are older than 21
-- ============================================================
SELECT c.course_name
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON s.student_id = e.student_id
GROUP BY c.course_name
HAVING MIN(s.age) > 21;

-- ============================================================
-- 30. First 3 letters of course + last 2 letters of student name
-- ============================================================
SELECT CONCAT(
           SUBSTRING(c.course_name, 1, 3),
           ' ',
           RIGHT(s.name, 2)
       ) AS combined_text
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;
