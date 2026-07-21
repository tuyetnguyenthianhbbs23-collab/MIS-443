# MIS443 – School Database Project

## Student Information

**Student Name:** Nguyen Thi Anh Tuyet

**Student ID:** 2332300334

**Course:** MIS443 – Business Data Management

---

# Project Overview

This project demonstrates how to create and manage a relational database using PostgreSQL and pgAdmin. The project includes database creation, table creation, importing CSV data, and executing SQL queries.

The database contains four related tables:

- Students
- Professors
- Courses
- Enrollments

---

# Project Structure

```
MIS443_Lab4_2332300334
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

Before running this project, install the following software.

- PostgreSQL
- pgAdmin 4

---

# Database Setup

## Step 1. Create the Database

Open pgAdmin.

Open Query Tool.

Open the file

```
01_create_database.sql
```

Execute the script.

The script creates a database named

```
school_db
```

After execution,

Right-click **Databases**

↓

Select **Refresh**

You should now see

```
school_db
```

under Databases.

---

## Step 2. Connect to the Database

Expand

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

Choose

```
Query Tool
```

**Important**

All remaining SQL scripts must be executed inside the **school_db** database.

---

## Step 3. Create Tables

Open

```
02_create_tables.sql
```

Run the script.

This script creates four tables:

- students
- professors
- courses
- enrollments

It also creates all primary key and foreign key constraints.

After execution,

Expand

```
school_db

↓

Schemas

↓

public

↓

Tables
```

You should see

```
students

professors

courses

enrollments
```

---

## Step 4. Import CSV Data

The CSV files are located in

```
data/
```

Files included

```
students.csv

professors.csv

courses.csv

enrollments.csv
```

### Method 1 (Recommended)

Import using pgAdmin.

For each table,

Right-click the table

↓

Import/Export Data

↓

Import

↓

Select the corresponding CSV file

↓

Format = CSV

Header = Yes

Delimiter = ,

Repeat for all four tables.

Import order:

1. students
2. professors
3. courses
4. enrollments

---

### Method 2 (COPY Command)

The file

```
03_import_data.sql
```

contains COPY commands.

If the CSV files are stored in another folder,

update the file paths before running the script.

Example

```sql
COPY students(...)
FROM 'D:/MIS443/data/students.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);
```

**Note**

On some Windows computers,

the COPY command may return

```
Permission denied
```

because PostgreSQL Server cannot access protected folders (such as OneDrive or Documents).

If this happens,

please use **Import/Export Data** in pgAdmin instead.

---

## Step 5. Execute SQL Queries

Open

```
04_queries.sql
```

Run the script.

The file contains sixteen SQL queries.

The queries demonstrate:

- Filtering
- Sorting
- Aggregate Functions
- GROUP BY
- HAVING
- INNER JOIN
- NULL Handling

The query results will be displayed in the Data Output panel.

---

# Database Schema

The project contains four related tables.

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

Relationships

- Students → Enrollments
- Courses → Enrollments
- Professors → Courses

---

# Files Description

| File | Description |
|------|-------------|
| 01_create_database.sql | Creates the database |
| 02_create_tables.sql | Creates all tables and relationships |
| 03_import_data.sql | Imports CSV data into the tables |
| 04_queries.sql | Contains all required SQL queries |
| students.csv | Student data |
| professors.csv | Professor data |
| courses.csv | Course data |
| enrollments.csv | Enrollment data |
| MIS443_Report.docx | Project report |

---

# Expected Output

After completing all steps,

the project should contain:

✓ Database created successfully

✓ Four tables created

✓ CSV data imported

✓ SQL queries executed successfully

✓ Query results displayed correctly

---

# Troubleshooting

## Error

```
relation "students" does not exist
```

Solution

Run

```
02_create_tables.sql
```

before importing data.

---

## Error

```
Permission denied
```

Solution

Use pgAdmin Import/Export Data instead of the COPY command.

---

## Error

```
Foreign key constraint violation
```

Solution

Import CSV files in the following order:

1. students

2. professors

3. courses

4. enrollments

---

# Author

Nguyen Thi Anh Tuyet

Student ID: 2332300334

MIS443 – Business Data Management
