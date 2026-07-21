# School Database Management System

## Overview

This project was developed for the **MIS443 – Business Data Management** course.

The objective of this project is to demonstrate the process of creating a relational database in PostgreSQL, importing data from CSV files, and executing SQL queries to retrieve meaningful information.

The database models a simple university system consisting of students, professors, courses, and enrollments.

---

# Project Structure

```
School_Database_Project
│
├── README.md
│
├── sql
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_import_data.sql
│   └── 04_queries.sql
│
├── data
│   ├── students.csv
│   ├── professors.csv
│   ├── courses.csv
│   └── enrollments.csv
│
└── report
    └── MIS443_Report.docx
```

---

# Software Requirements

Before running this project, make sure the following software is installed.

- PostgreSQL
- pgAdmin 4

---

# How to Run This Project

## Step 1 – Create the Database

Open **pgAdmin**.

Open **Query Tool**.

Run

```
01_create_database.sql
```

This script creates the database named

```
school_db
```

After execution,

Right-click **Databases**

↓

Select **Refresh**

---

## Step 2 – Connect to the Database

Open

```
Databases

↓

school_db
```

Right-click

```
school_db
```

↓

Select

```
Query Tool
```

From this step onward, all SQL scripts must be executed inside **school_db**.

---

## Step 3 – Create Tables

Run

```
02_create_tables.sql
```

This script creates four tables.

- students
- professors
- courses
- enrollments

The script also creates all primary key and foreign key constraints.

---

## Step 4 – Import CSV Files

CSV files are stored inside the **data** folder.

```
students.csv

professors.csv

courses.csv

enrollments.csv
```

Import the files in the following order.

1. students
2. professors
3. courses
4. enrollments

### Option 1 (Recommended)

Use **Import/Export Data** in pgAdmin.

For each table

Right-click table

↓

Import/Export Data

↓

Import

↓

Choose the corresponding CSV file.

---

### Option 2

Run

```
03_import_data.sql
```

If the CSV files are stored in another directory,

update the file paths inside the COPY commands.

> **Note**
>
> On some Windows systems, PostgreSQL may not have permission to access files stored in protected folders (such as OneDrive or Documents). If a **Permission denied** error occurs, import the CSV files using **pgAdmin Import/Export Data** instead.

---

## Step 5 – Execute SQL Queries

Run

```
04_queries.sql
```

The file contains sixteen SQL queries that demonstrate:

- Data filtering
- Sorting
- Aggregate functions
- GROUP BY
- HAVING
- JOIN operations
- NULL handling

Query results will appear in the **Data Output** panel.

---

# Database Schema

The database consists of four related tables.

```
Students
      │
      │ student_id
      ▼
Enrollments
      ▲
      │ course_id
      │
Courses
      ▲
      │ professor_id
      │
Professors
```

---

# Project Files

| File | Description |
|------|-------------|
|01_create_database.sql|Creates the database|
|02_create_tables.sql|Creates tables and relationships|
|03_import_data.sql|Imports data from CSV files|
|04_queries.sql|Contains all required SQL queries|
|students.csv|Student dataset|
|professors.csv|Professor dataset|
|courses.csv|Course dataset|
|enrollments.csv|Enrollment dataset|
|MIS443_Report.docx|Project report|

---

# Expected Output

After completing all steps successfully, the project should contain:

- A PostgreSQL database named **school_db**
- Four relational tables
- Imported data from all CSV files
- Successfully executed SQL queries
- Correct query results displayed in pgAdmin

---

# Common Issues

### Error

```
relation "students" does not exist
```

**Solution**

Run **02_create_tables.sql** before importing data.

---

### Error

```
Permission denied
```

**Solution**

Import CSV files using **pgAdmin Import/Export Data**, or update the file path in **03_import_data.sql**.

---

### Error

```
Foreign key constraint violation
```

**Solution**

Import the CSV files in the following order:

1. students
2. professors
3. courses
4. enrollments

---

# Author

**Student Name:** Nguyen Thi Anh Tuyet

**Student ID:** 2332300334

**Course:** MIS443 – Business Data Management
