-- Create Database
CREATE DATABASE library;

-- Use the database
USE library;

-- Create Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Insert Data into Branch Table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES 
(1, 101, '123 Main St, Downtown', '9876543210'),
(2, 102, '456 Elm St, Uptown', '9123456789'),
(3, 103, '789 Oak St, Midtown', '9234567890');

-- Create Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Insert Data into Employee Table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
VALUES 
(1, 'John Smith', 'Manager', 60000.00, 1),
(2, 'Jane Doe', 'Librarian', 35000.00, 2),
(3, 'Emily Davis', 'Librarian', 45000.00, 3),
(4, 'Michael Brown', 'Assistant Librarian', 30000.00, 1),
(5, 'Sarah Johnson', 'Manager', 65000.00, 2);

-- Create Books Table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Insert Data into Books Table (Updated)
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES 
('978-1-23456-789-0', 'The Adventures of Sherlock Holmes', 'Mystery', 35.00, 'yes', 'Arthur Conan Doyle', 'Penguin Classics'),
('978-1-34567-890-1', 'The Theory of Relativity', 'Science', 45.00, 'no', 'Albert Einstein', 'Science Press'),
('978-1-45678-901-2', 'Mastering the Art of French Cooking', 'Cooking', 28.00, 'yes', 'Julia Child', 'Cookbook World'),
('978-1-56789-012-3', 'The Pragmatic Programmer', 'Technology', 55.00, 'yes', 'David Thomas', 'Tech Books Inc'),
('978-1-67890-123-4', 'The Great Gatsby', 'Literature', 22.00, 'yes', 'F. Scott Fitzgerald', 'Classic Reads'),
('978-1-23456-789-9', 'A History of the World in 100 Objects', 'History', 40.00, 'yes', 'Neil MacGregor', 'Viking Press');

-- Create Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Insert Data into Customer Table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES 
(1, 'Alice Williams', '101 Pine St, Downtown', '2021-11-12'),
(2, 'Bob Martinez', '202 Maple St, Uptown', '2022-03-25'),
(3, 'Charlie Brown', '303 Birch St, Midtown', '2020-07-15'),
(4, 'David Lee', '404 Cedar St, Downtown', '2023-01-10');

-- Create IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    ISBN_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN)
);

-- Insert Data into IssueStatus Table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, ISBN_book) 
VALUES 
(1, 1, 'The Adventures of Sherlock Holmes', '2023-02-01', '978-1-23456-789-0'),
(2, 2, 'The Pragmatic Programmer', '2023-04-15', '978-1-56789-012-3'),
(3, 3, 'The Great Gatsby', '2023-06-10', '978-1-67890-123-4');

-- Create ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    ISBN_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN)
);

-- Insert Data into ReturnStatus Table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2) 
VALUES 
(1, 1, 'The Adventures of Sherlock Holmes', '2023-03-01', '978-1-23456-789-0'),
(2, 2, 'The Pragmatic Programmer', '2023-05-01', '978-1-56789-012-3');

-- Queries

-- 1. Retrieve the book title, category, and rental price of all available books
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books
SELECT b.Book_title, c.Customer_name
FROM Books b
JOIN IssueStatus i ON b.ISBN = i.ISBN_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- 4. Display the total count of books in each category
SELECT Category, COUNT(*) AS Total_books
FROM Books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs. 50,000
SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch
SELECT Branch_no, COUNT(*) AS Employee_count
FROM Employee
GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

-- 9. Retrieve book_title from the book table containing history
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Employee_count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.ISBN_book = b.ISBN
WHERE b.Rental_Price > 25;
