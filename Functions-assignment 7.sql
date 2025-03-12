-- Step 1: Create the Database and Tables
CREATE DATABASE Country;
USE Country;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area FLOAT
);

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

-- Step 3: Add and Populate DOB Column
ALTER TABLE Persons
ADD COLUMN DOB DATE;

UPDATE Persons
SET DOB = '1990-05-15'
WHERE Id = 1;

UPDATE Persons
SET DOB = '1985-08-22'
WHERE Id = 2;

UPDATE Persons
SET DOB = '1995-03-10'
WHERE Id = 3;

UPDATE Persons
SET DOB = '1980-11-30'
WHERE Id = 4;

UPDATE Persons
SET DOB = '1992-07-04'
WHERE Id = 5;

UPDATE Persons
SET DOB = '1988-09-18'
WHERE Id = 6;

UPDATE Persons
SET DOB = '1998-12-25'
WHERE Id = 7;

UPDATE Persons
SET DOB = '1983-02-14'
WHERE Id = 8;

UPDATE Persons
SET DOB = '1991-06-20'
WHERE Id = 9;

UPDATE Persons
SET DOB = '1987-04-05'
WHERE Id = 10;

-- Step 4: Create Function to Calculate Age
DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //

DELIMITER ;

-- Step 5: Fetch Age of All Persons
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

-- Step 6: Find Length of Each Country Name
SELECT Country_name, LENGTH(Country_name) AS Name_Length
FROM Country;

-- Step 7: Extract First Three Characters of Country Names
SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Characters
FROM Country;

-- Step 8: Convert Country Names to Uppercase and Lowercase
SELECT Country_name, UPPER(Country_name) AS Uppercase_Name
FROM Country;

SELECT Country_name, LOWER(Country_name) AS Lowercase_Name
FROM Country;