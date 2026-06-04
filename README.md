Library Management System using SQL

Project Description

The Library Management System is a database project developed using SQL to demonstrate fundamental and advanced database operations. The project simulates a real-world library environment where books are categorized, students can borrow books, and records are maintained efficiently.

This project was completed as part of the SQL Developer Internship tasks and focuses on database creation, data manipulation, data retrieval, and data analysis using SQL queries.

Objectives

The main objectives of this project are:

- Design a relational database for a library.
- Create tables using SQL DDL commands.
- Establish relationships between tables using Primary Keys and Foreign Keys.
- Insert, update, and delete records using DML commands.
- Retrieve information using SQL queries.
- Perform data analysis using aggregate functions.
- Use grouping and filtering techniques to summarize data.

---

Database Structure

The project consists of four tables:

1. Categories

Stores different categories of books available in the library.

Example Categories:
- Fiction
- Science
- History

 2. Books

Stores details of books available in the library.

Relationship:
- Each book belongs to one category.

 3. Students
Stores student information.

 4. IssuedBooks

Stores information about books issued to students.

Relationships:
- One student can issue multiple books.
- One book can be issued to different students over time.

Task 2: Data Manipulation Operations

This task demonstrates the use of Data Manipulation Language (DML) commands.

Operations Performed

Insert Records

Sample data was inserted into:

- Categories
- Books
- Students
- IssuedBooks

Update Records

Updated:

- Student email address
- Publication year of a book

Delete Records

Deleted:

- An issued book record from the IssuedBooks table

Concepts Covered

- INSERT INTO
- UPDATE
- DELETE
- NULL Values
- Data Integrity

 SQL Query Operations

This task demonstrates retrieving data using SQL queries.

Queries Implemented

Display All Records

```sql
SELECT * FROM Books;
```

Select Specific Columns

```sql
SELECT title, publication_year
FROM Books;
```

WHERE Clause

```sql
SELECT *
FROM Books
WHERE publication_year > 2000;
```

AND Operator

```sql
SELECT *
FROM Books
WHERE publication_year > 1980
AND category_id = 1;
```

OR Operator

```sql
SELECT *
FROM Categories
WHERE category_name='Science'
OR category_name='History';
```

LIKE Operator

```sql
SELECT *
FROM Books
WHERE title LIKE '%History%';
```

 BETWEEN Operator

```sql
SELECT *
FROM Books
WHERE publication_year BETWEEN 1988 AND 2012;
```

ORDER BY

```sql
SELECT *
FROM Books
ORDER BY publication_year DESC;
```

LIMIT

```sql
SELECT *
FROM Books
LIMIT 2;
```

DISTINCT

```sql
SELECT DISTINCT publication_year
FROM Books;
```

JOIN

```sql
SELECT
Students.student_name,
Books.title,
IssuedBooks.issue_date
FROM IssuedBooks
JOIN Students
ON Students.student_id = IssuedBooks.student_id
JOIN Books
ON Books.book_id = IssuedBooks.book_id;
```

Concepts Covered

- Data Retrieval
- Filtering
- Sorting
- Pattern Matching
- Joins
- Query Optimization Basics

Aggregate Functions and Grouping

This task demonstrates how SQL can be used for data summarization and analysis.

Aggregate Functions Used

COUNT()

Counts total records.

```sql
SELECT COUNT(*) AS TotalBooks
FROM Books;
```

SUM()

Calculates the total publication years.

```sql
SELECT SUM(publication_year)
FROM Books;
```

 AVG()

Calculates average publication year.

```sql
SELECT AVG(publication_year)
FROM Books;
```

 MAX()

Finds the latest publication year.

```sql
SELECT MAX(publication_year)
FROM Books;
```

---

GROUP BY Operations

Grouped books according to categories.

```sql
SELECT
Categories.category_name,
COUNT(Books.book_id)
FROM Categories
LEFT JOIN Books
ON Categories.category_id = Books.category_id
GROUP BY Categories.category_name;
```

---

HAVING Clause

Filtered grouped results.

```sql
SELECT
Categories.category_name,
COUNT(Books.book_id)
FROM Categories
LEFT JOIN Books
ON Categories.category_id = Books.category_id
GROUP BY Categories.category_name
HAVING COUNT(Books.book_id) >= 1;
```

---

Key SQL Concepts Demonstrated

Database Design

- Relational Database
- Entity Relationships
- Data Modeling

SQL Commands

DDL (Data Definition Language)

- CREATE TABLE

DML (Data Manipulation Language)

- INSERT
- UPDATE
- DELETE

DQL (Data Query Language)

- SELECT

Aggregate Functions

- COUNT()
- SUM()
- AVG()
- MAX()

Clauses

- WHERE
- GROUP BY
- HAVING
- ORDER BY
- LIMIT

Joins

- INNER JOIN
- LEFT JOIN


Tools Used

- SQL Fiddle
- MySQL SQL Syntax
- GitHub

Repository Contents

Library-Management-System-SQL
│
├── Task4 ueries.sql
├── README.md
└── Task4 outputs
    
Learning Outcomes

After completing this project, I gained practical experience in:

- Creating and managing relational databases.
- Designing table relationships using keys.
- Performing CRUD operations.
- Writing complex SQL queries.
- Combining data using joins.
- Analyzing data using aggregate functions.
- Summarizing information with GROUP BY and HAVING.
- Organizing and documenting SQL projects using GitHub.


 Conclusion

This project successfully demonstrates the implementation of SQL concepts through a Library Management System. It covers database creation, record management, querying, joins, aggregation, and grouping techniques. The project serves as a practical example of how SQL is used to manage and analyze data efficiently in real-world applications.

Author
P Preethi
