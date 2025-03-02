-- 1. Create the Managers database
CREATE DATABASE Managers;

-- 2. Use the Managers database
USE Managers;

-- 3. Create the Managers table with the specified fields and constraints
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY, 
    First_name VARCHAR(255) NOT NULL, 
    Last_name VARCHAR(255) NOT NULL, 
    DOB DATE NOT NULL, 
    Age INT CHECK (Age >= 18),  -- Check constraint for age (age should be 18 or above)
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Automatically sets the timestamp when the record is inserted or updated
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),  -- Gender must be 'M' or 'F'
    Department VARCHAR(255) NOT NULL, 
    Salary DECIMAL(10, 2) NOT NULL  -- Salary cannot be NULL
);

-- 4. Insert 10 rows into the Managers table with the given data
INSERT INTO Managers (Manager_Id, First_name, Last_name, DOB, Age, Gender, Department, Salary)
VALUES 
(1, 'John', 'Davis', '1980-05-15', 45, 'M', 'HR', 35000.00),
(2, 'Aaliya', 'Khan', '1990-08-20', 35, 'F', 'Finance', 27000.00),
(3, 'Mhd', 'Ansar', '1975-02-10', 50, 'M', 'IT', 40000.00),
(4, 'Sanika', 'Sundar', '1985-06-30', 40, 'F', 'Marketing', 32000.00),
(5, 'Lamiya', 'Jibin', '1982-11-25', 43, 'F', 'IT', 42000.00),
(6, 'Jasir', 'Hussain', '2000-03-15', 33, 'M', 'Finance', 25000.00),
(7, 'Nila', 'Santhosh', '1988-09-10', 37, 'F', 'HR', 28000.00),
(8, 'Karthik', 'Sankar', '1987-07-05', 38, 'M', 'Marketing', 31000.00),
(9, 'Ethan', 'Thomas', '1988-12-10', 42, 'M', 'IT', 45000.00),
(10, 'Amritha', 'Suresh', '1995-01-25', 30, 'F', 'HR', 24000.00);

-- 5. Query that retrieves the name and date of birth of the manager with Manager_Id = 1
SELECT First_name, Last_name, DOB 
FROM Managers 
WHERE Manager_Id = 1;

-- 6. Query to display the annual income of all managers (assuming salary is monthly)
SELECT Manager_Id, First_name, Last_name, (Salary * 12) AS Annual_Income
FROM Managers;

-- 7. Query to display records of all managers except ‘Aaliya’
SELECT * 
FROM Managers 
WHERE First_name != 'Aaliya';

-- 8. Query to display details of managers whose department is IT and earn more than 25000 per month
SELECT * 
FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;

-- 9. Query to display details of managers whose salary is between 10000 and 35000
SELECT * 
FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;
