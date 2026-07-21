/*
========================================================
File: 02_create_tables.sql

Purpose:
Create all tables and relationships.

Instructions:
1. Connect to database "practice".
2. Run this script.
========================================================
*/

-- Drop existing tables to avoid duplication errors on re-execution
DROP TABLE IF EXISTS enrollments CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS professors CASCADE;
DROP TABLE IF EXISTS students CASCADE;

-- Create Students table
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    enrollment_date DATE,
    graduation_year INTEGER,
    major VARCHAR(100)
);

-- Create Professors table
CREATE TABLE professors (
    professor_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(100),
    hire_date DATE
);

-- Create Courses table
CREATE TABLE courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100),
    credits INTEGER,
    department VARCHAR(100),
    professor_id INTEGER,
    CONSTRAINT fk_professor
		FOREIGN KEY (professor_id)
        REFERENCES professors(professor_id)
);

-- Create Enrollments table
CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id VARCHAR(10),
    semester VARCHAR(20),
    year INTEGER,
    grade VARCHAR(2),
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    CONSTRAINT fk_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);
      