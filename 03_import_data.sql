/*
========================================================
File: 03_import_data.sql

Purpose:
Import CSV data into all tables.

Instructions:
1. Make sure all CSV files are stored in:
   D:/MIS 443 Lab 4/

2. If your CSV files are in another folder,
   update the file paths below.

3. Run this script after creating all tables.
========================================================
*/

-- table students
COPY students(student_id, first_name, last_name, email,
              enrollment_date, graduation_year, major)
FROM 'C:\Users\Admin\OneDrive\Documents\MIS 443\students.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

-- table professors
COPY professors(professor_id, first_name, last_name, email,
                department, hire_date)
FROM 'C:\Users\Admin\OneDrive\Documents\MIS 443\professors.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

-- table courses
COPY courses(course_id, course_name, credits,
             department, professor_id)
FROM 'C:\Users\Admin\OneDrive\Documents\MIS 443\courses.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

-- table enrollments
COPY enrollments(enrollment_id, student_id, course_id,
                 semester, year, grade)
FROM 'C:\Users\Admin\OneDrive\Documents\MIS 443\enrollments.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

-- Note:
-- On some Windows installations, COPY may return a permission error
-- because PostgreSQL Server cannot access files stored in OneDrive.
-- If this happens, use pgAdmin Import/Export Data to import the CSV files.