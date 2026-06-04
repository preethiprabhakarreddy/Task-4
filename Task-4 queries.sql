-- CREATE TABLES

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20),
    publication_year INT,
    category_id INT,
    FOREIGN KEY (category_id)
    REFERENCES Categories(category_id)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE IssuedBooks (
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    due_date DATE,
    FOREIGN KEY (student_id)
    REFERENCES Students(student_id),
    FOREIGN KEY (book_id)
    REFERENCES Books(book_id)
);


-- INSERT DATA

INSERT INTO Categories VALUES
(1, 'Fiction'),
(2, 'Science'),
(3, 'History');

INSERT INTO Books VALUES
(1, 'The Alchemist', '9780061122415', 1988, 1),
(2, 'A Brief History of Time', NULL, 1988, 2),
(3, 'Sapiens', '9780062316097', 2011, 3);

INSERT INTO Students VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com'),
(2, 'Priya Patel', NULL);

INSERT INTO IssuedBooks VALUES
(1, 1, 1, '2025-08-01', '2025-08-15'),
(2, 2, 2, '2025-08-05', NULL);

-- =========================
-- UPDATE DATA
-- =========================

UPDATE Students
SET email = 'priya@gmail.com'
WHERE student_id = 2;

UPDATE Books
SET publication_year = 2012
WHERE book_id = 3;


-- DELETE DATA
DELETE FROM IssuedBooks
WHERE issue_id = 2;

-- Display all Categories
SELECT * FROM Categories;

-- Display all Books
SELECT * FROM Books;

-- Display all Students
SELECT * FROM Students;

-- Display all IssuedBooks
SELECT * FROM IssuedBooks;

-- Select specific columns
SELECT title, publication_year
FROM Books;

-- WHERE
SELECT *
FROM Books
WHERE publication_year > 2000;

-- AND
SELECT *
FROM Books
WHERE publication_year > 1980
AND category_id = 1;

-- OR
SELECT *
FROM Categories
WHERE category_name = 'Science'
OR category_name = 'History';

-- LIKE
SELECT *
FROM Books
WHERE title LIKE '%History%';

-- BETWEEN
SELECT *
FROM Books
WHERE publication_year BETWEEN 1988 AND 2012;

-- ORDER BY
SELECT *
FROM Books
ORDER BY publication_year DESC;

-- LIMIT
SELECT *
FROM Books
LIMIT 2;

-- DISTINCT
SELECT DISTINCT publication_year
FROM Books;

-- JOIN
SELECT
    Students.student_name,
    Books.title,
    IssuedBooks.issue_date
FROM IssuedBooks
JOIN Students
ON Students.student_id = IssuedBooks.student_id
JOIN Books
ON Books.book_id = IssuedBooks.book_id;

-- COUNT TOTAL BOOKS
SELECT COUNT(*) AS TotalBooks
FROM Books;

-- COUNT TOTAL STUDENTS
SELECT COUNT(*) AS TotalStudents
FROM Students;

-- SUM OF PUBLICATION YEARS
SELECT SUM(publication_year) AS TotalPublicationYears
FROM Books;

-- AVERAGE PUBLICATION YEAR
SELECT AVG(publication_year) AS AveragePublicationYear
FROM Books;

-- COUNT BOOKS IN EACH CATEGORY
SELECT
    Categories.category_name,
    COUNT(Books.book_id) AS NumberOfBooks
FROM Categories
LEFT JOIN Books
ON Categories.category_id = Books.category_id
GROUP BY Categories.category_name;

-- LATEST PUBLICATION YEAR BY CATEGORY
SELECT
    Categories.category_name,
    MAX(Books.publication_year) AS LatestBook
FROM Categories
JOIN Books
ON Categories.category_id = Books.category_id
GROUP BY Categories.category_name;

-- NUMBER OF ISSUED BOOKS PER STUDENT
SELECT
    Students.student_name,
    COUNT(IssuedBooks.issue_id) AS IssuedBooksCount
FROM Students
LEFT JOIN IssuedBooks
ON Students.student_id = IssuedBooks.student_id
GROUP BY Students.student_name;

-- HAVING CLAUSE
SELECT
    Categories.category_name,
    COUNT(Books.book_id) AS TotalBooks
FROM Categories
LEFT JOIN Books
ON Categories.category_id = Books.category_id
GROUP BY Categories.category_name
HAVING COUNT(Books.book_id) >= 1;

