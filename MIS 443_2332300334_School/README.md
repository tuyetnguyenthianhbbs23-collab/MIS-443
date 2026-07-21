# 🎓 School Database Management System
## 📖 About the Project

This project recreates the **School Database** from **SQL Practice Online** using PostgreSQL and pgAdmin.

The project demonstrates the complete workflow of building and managing a relational database, including database creation, table design, CSV data import, and SQL query execution.

The database models a simple university management system consisting of four entities:

- 👨‍🎓 Students
- 👩‍🏫 Professors
- 📚 Courses
- 📝 Enrollments

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| PostgreSQL | Relational Database Management System |
| pgAdmin 4 | Database Administration |
| GitHub | Version Control & Project Repository |
| Microsoft Word | Project Documentation |

---

## 🗺️ Entity Relationship Diagram

The following ERD illustrates the relationships between all database tables.

<p align="center">
  <img src="ERD.png" alt="School Database ERD" width="900">
</p>

---

## 📂 Project Files

| File | Description |
|------|-------------|
| `01_create_database.sql` | Creates the PostgreSQL database |
| `02_create_tables.sql` | Creates all tables, primary keys, and foreign keys |
| `03_import_data.sql` | Imports CSV datasets into the database |
| `04_queries.sql` | Contains all required SQL queries |
| `students.csv` | Student dataset |
| `professors.csv` | Professor dataset |
| `courses.csv` | Course dataset |
| `enrollments.csv` | Enrollment dataset |
| `ERD.png` | Entity Relationship Diagram |
| `MIS443_Report.docx` | Project report |

---

## 🚀 Getting Started

### Step 1 — Create the Database

Open **pgAdmin 4** and execute:

```sql
01_create_database.sql
```

This script creates the database named **school_db**.

---

### Step 2 — Create the Tables

Connect to **school_db**, then execute:

```sql
02_create_tables.sql
```

This script creates all required tables and defines the relationships between them.

---

### Step 3 — Import the Data

Import the CSV files into their corresponding tables in the following order:

1. `students.csv`
2. `professors.csv`
3. `courses.csv`
4. `enrollments.csv`

You can either:

- Execute `03_import_data.sql`, or
- Use **Import/Export Data** in pgAdmin.

> **Note:** If the `COPY` command returns a **Permission denied** error (commonly on Windows or OneDrive folders), use **Import/Export Data** in pgAdmin instead.

---

### Step 4 — Execute SQL Queries

Run:

```sql
04_queries.sql
```

This script contains all SQL queries completed for the assignment, including:

- SELECT
- WHERE
- ORDER BY
- DISTINCT
- Aggregate Functions (`COUNT`, `AVG`)
- GROUP BY
- HAVING
- INNER JOIN
- NULL Handling

Query results will be displayed in the **Data Output** panel of pgAdmin.

---

## 🌐 Original SQL Practice

This project is based on the **School Database** exercises provided by **SQL Practice Online**.

🔗 https://www.sql-practice.online/practice/school?engine=postgresql

---

## 👤 Author

**Nguyen Thi Anh Tuyet**  
**Student ID:** 2332300334  
**Course:** MIS443 – Business Data Management  
**Eastern International University**
