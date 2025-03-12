-- Step 1: Create the Database and Tables
CREATE DATABASE CountryDB;
USE CountryDB;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area FLOAT
);

-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50)
);

-- Step 2: Insert 10 Rows into Each Table
-- Insert into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'United States', 331002651, 9372610),
(2, 'India', 1380004385, 3287263),
(3, 'China', 1439323776, 9706961),
(4, 'Brazil', 212559417, 8515767),
(5, 'Russia', 145934462, 17098242),
(6, 'Japan', 126476461, 377975),
(7, 'Germany', 83783942, 357022),
(8, 'France', 65273511, 551695),
(9, 'United Kingdom', 67886011, 242495),
(10, 'Italy', 60461826, 301340);

-- Insert into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'Muhammed', 'Yaseen', 100000, 4.5, 1, 'United States'),
(2, 'Vishnu', 'Subramanian', 200000, 4.7, 2, 'India'),
(3, 'Alisha', 'Alan', 150000, 4.3, 3, 'China'),
(4, 'Bob', 'Brown', 120000, 4.1, 4, 'Brazil'),
(5, 'Charlie', 'Davis', 90000, 4.2, 5, 'Russia'),
(6, 'David', 'Bekham', 80000, 4.0, 6, 'Japan'),
(7, 'Eva', 'Wilson', 70000, 3.9, 7, 'Germany'),
(8, 'James', 'Albert', 60000, 3.8, 8, 'France'),
(9, 'Grace', 'Taylor', 50000, 3.7, 9, 'United Kingdom'),
(10, 'Robert', 'Andrews', 40000, 3.6, 10, 'Italy');

-- Step 3: Write SQL Queries

-- 1. Print the first three characters of Country_name from the Country table
SELECT SUBSTRING(Country_name, 1, 3) AS First_Three_Chars
FROM Country;

-- 2. Concatenate Fname and Lname from the Persons table
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM Persons;

-- 3. Count the number of unique country names from the Persons table
SELECT COUNT(DISTINCT Country_name) AS Unique_Country_Count
FROM Persons;

-- 4. Print the maximum population from the Country table
SELECT MAX(Population) AS Max_Population
FROM Country;

-- 5. Print the minimum population from the Persons table
SELECT MIN(Population) AS Min_Population
FROM Persons;

-- 6. Insert 2 new rows into the Persons table with Lname as NULL, then count Lname
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Ivy', NULL, 30000, 3.5, 1, 'United States'),
(12, 'Jack', NULL, 35000, 3.4, 2, 'India');

SELECT COUNT(Lname) AS Lname_Count -- Counts non-NULL Lname values
FROM Persons;

-- 7. Find the number of rows in the Persons table
SELECT COUNT(*) AS Total_Rows
FROM Persons;

-- 8. Show the population of the Country table for the first 3 rows
SELECT Population
FROM Country
LIMIT 3;

-- 9. Print 3 random rows of countries
SELECT Country_name
FROM Country
ORDER BY RAND()
LIMIT 3;

-- 10. List all persons ordered by their rating in descending order
SELECT *
FROM Persons
ORDER BY Rating DESC;

-- 11. Find the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

-- 12. Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;