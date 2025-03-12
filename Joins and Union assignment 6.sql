-- Step 1: Create the Database and Tables
CREATE DATABASE CountryData;
USE CountryData;

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
-- Step 1: Perform Inner Join, Left Join, and Right Join
-- Inner Join
SELECT * FROM Country
INNER JOIN Persons ON Country.Id = Persons.Country_Id;

-- Left Join
SELECT * FROM Country
LEFT JOIN Persons ON Country.Id = Persons.Country_Id;

-- Right Join
SELECT * FROM Country
RIGHT JOIN Persons ON Country.Id = Persons.Country_Id;

-- Step 2: List All Distinct Country Names
SELECT Country_name FROM Country
UNION
SELECT Country_name FROM Persons;

-- Step 3: List All Country Names (Including Duplicates)
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

-- Step 4: Round the Ratings of All Persons
-- Select with Rounded Ratings
SELECT Id, Fname, Lname, Population, ROUND(Rating) AS RoundedRating, Country_Id, Country_name
FROM Persons;

-- Update Ratings to Rounded Values
UPDATE Persons
SET Rating = ROUND(Rating);