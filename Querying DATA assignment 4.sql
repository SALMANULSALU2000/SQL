-- 1. Create the database
CREATE DATABASE CountryWithPopulation;

-- 2. Switch to the CountryWithPopulation database
USE CountryWithPopulation;

-- 3. Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY, 
    Country_name VARCHAR(255) NOT NULL, 
    Population INT NOT NULL, 
    Area INT NOT NULL
);

-- 4. Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY, 
    Fname VARCHAR(255) NOT NULL, 
    Lname VARCHAR(255) NOT NULL, 
    Population INT NOT NULL, 
    Rating DECIMAL(3, 2) NOT NULL, 
    Country_Id INT, 
    Country_name VARCHAR(255), 
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- 5. Insert 10 rows into the Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES 
(1, 'USA', 331002651, 9833517),
(2, 'India', 1380004385, 3287263),
(3, 'Canada', 37742154, 9984670),
(4, 'UK', 67886011, 243610),
(5, 'Australia', 25499884, 7692024),
(6, 'Germany', 83783942, 357022),
(7, 'France', 67081000, 643801),
(8, 'Italy', 60245946, 301340),
(9, 'Japan', 126476461, 377975),
(10, 'Brazil', 212559417, 8515767);

-- 6. Insert 10 rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES 
(1, 'Gabrial', 'Andrews', 331002651, 4.7, 1, 'USA'),
(2, 'Alice', 'Smith', 1380004385, 4.8, 2, 'India'),
(3, 'Bob', 'Brown', 37742154, 4.3, 3, 'Canada'),
(4, 'Charlie', 'Davis', 67886011, 4.9, 4, 'UK'),
(5, 'Ansab', 'Mathews', 25499884, 3.5, 5, 'Australia'),
(6, 'Emma', 'Wilson', 83783942, 4.6, 6, 'Germany'),
(7, 'Freddy', 'Andrews', 67081000, 4.4, 7, 'France'),
(8, 'Grace', 'Taylor', 60245946, 4.1, 8, 'Italy'),
(9, 'Harry', 'Anderson', 126476461, 4.9, 9, 'Japan'),
(10, 'Ivy', 'Thomas', 212559417, 5.0, 10, 'Brazil');

-- 7. List the distinct country names from the Persons table
SELECT DISTINCT Country_name 
FROM Persons;

-- 8. Select first names and last names from the Persons table with aliases
SELECT Fname AS First_Name, Lname AS Last_Name 
FROM Persons;

-- 9. Find all persons with a rating greater than 4.0
SELECT * 
FROM Persons 
WHERE Rating > 4.0;

-- 10. Find countries with a population greater than 10 lakhs (1 million)
SELECT * 
FROM Country 
WHERE Population > 1000000;

-- 11. Find persons who are from 'USA' or have a rating greater than 4.5
SELECT * 
FROM Persons 
WHERE Country_name = 'USA' OR Rating > 4.5;

-- 12. Find all persons where the country name is NULL
SELECT * 
FROM Persons 
WHERE Country_name IS NULL;

-- 13. Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT * 
FROM Persons 
WHERE Country_name IN ('USA', 'Canada', 'UK');

-- 14. Find all persons not from the countries 'India' and 'Australia'
SELECT * 
FROM Persons 
WHERE Country_name NOT IN ('India', 'Australia');

-- 15. Find all countries with a population between 5 lakhs and 20 lakhs
SELECT * 
FROM Country 
WHERE Population BETWEEN 500000 AND 20000000;

-- 16. Find all countries whose names do not start with 'C'
SELECT * 
FROM Country 
WHERE Country_name NOT LIKE 'C%';
