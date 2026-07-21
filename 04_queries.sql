/*
========================================================
File: 04_queries.sql

Purpose:
SQL Practice Questions

Completed:
Question 1 - Question 16
========================================================
*/

--Q1: Return the complete student roster from the students table.
SELECT * FROM students;
--Q2: Return students who are majoring in Computer Science
SELECT * FROM students
WHERE major = 'Computer Science';
--Q3: Return all courses ordered by credit hours from highest to lowest.
SELECT course_name, credits
FROM courses
ORDER BY credits DESC;
-- 4. Return students who are expected to graduate in 2026.
SELECT first_name, last_name, major
FROM students
WHERE graduation_year = 2026;
-- 5. Count the total number of courses available.
SELECT COUNT(*) AS total_courses
FROM courses;
-- 6. Calculate the average number of credits per course.
SELECT AVG(credits) AS average_credits
FROM courses;
-- 7. Return students who enrolled after December 31, 2022.
SELECT first_name, last_name, enrollment_date
FROM students
WHERE enrollment_date > '2022-12-31';
-- 8. Return professors who work in the Computer Science department.
SELECT first_name, last_name, hire_date
FROM professors
WHERE department = 'Computer Science';
-- 9. Return students whose email addresses contain the university.edu domain.
SELECT first_name, last_name, email, major
FROM students
WHERE email LIKE '%university.edu';
-- 10. A department administrator wants to see which professors are teaching which courses. Show each professor's name, department, and the courses they are responsible for. Order by professor last name, then course name.
SELECT
    p.first_name,
    p.last_name,
    p.department,
    c.course_name
FROM professors p
JOIN courses c
ON p.professor_id = c.professor_id
ORDER BY p.last_name ASC, c.course_name ASC;
-- 11. The curriculum office wants to know how many different academic majors are represented in the student body. Write a query that lists each unique major offered — no duplicates. Exclude students who have not yet declared a major. Order alphabetically.
SELECT DISTINCT major
FROM students
WHERE major IS NOT NULL
ORDER BY major ASC;
-- 12. The admissions department needs to identify students who enrolled during the 2022–2023 academic period for a program evaluation. Find all students whose enrollment_date falls within that range (inclusive). Show first name, last name, enrollment_date, and major. Order by enrollment_date, then last name.
SELECT first_name,
       last_name,
       enrollment_date,
       major
FROM students
WHERE enrollment_date BETWEEN '2022-01-01' AND '2023-12-31'
ORDER BY enrollment_date ASC, last_name ASC;
-- 13. Academic advisors need to contact students who have not yet chosen a major so they can schedule advising sessions. Find all students whose major has not been declared (stored as NULL). Show first name, last name, and email.
SELECT first_name,
       last_name,
       email
FROM students
WHERE major = 'NULL';
-- 14. Return student names together with their enrolled courses and grades.
SELECT
    s.first_name,
    s.last_name,
    c.course_name,
    e.grade
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id
ORDER BY s.last_name, c.course_name;
-- 15. Count the number of students enrolled in each course.
SELECT
    c.course_name,
    COUNT(e.student_id) AS enrollment_count
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY c.course_name ASC;
-- 16. Return courses with more than one student enrolled.
SELECT
    c.course_name,
    COUNT(e.student_id) AS enrollment_count
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.student_id) > 1
ORDER BY c.course_name ASC;