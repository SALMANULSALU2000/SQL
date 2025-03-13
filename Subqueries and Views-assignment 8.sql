-- Create the database
CREATE DATABASE Product;
USE Product;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population BIGINT,
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
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert 10 rows into the Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331002651, 9372610),
(2, 'India', 1380004385, 3287263),
(3, 'China', 1439323776, 9706961),
(4, 'Brazil', 212559417, 8515767),
(5, 'Russia', 145934462, 17098242),
(6, 'Japan', 126476461, 377975),
(7, 'Germany', 83783942, 357022),
(8, 'France', 65273511, 551695),
(9, 'UK', 67886011, 242495),
(10, 'Canada', 37742154, 9984670);

-- Insert 10 rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 1000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 2000000, 3.8, 1, 'USA'),
(3, 'Ravi', 'Kumar', 5000000, 4.2, 2, 'India'),
(4, 'Wei', 'Zhang', 7000000, 4.0, 3, 'China'),
(5, 'Maria', 'Silva', 3000000, 3.5, 4, 'Brazil'),
(6, 'Ivan', 'Ivanov', 1500000, 3.9, 5, 'Russia'),
(7, 'Yuki', 'Tanaka', 1000000, 4.1, 6, 'Japan'),
(8, 'Hans', 'Muller', 800000, 3.7, 7, 'Germany'),
(9, 'Sophie', 'Martin', 600000, 3.6, 8, 'France'),
(10, 'Emma', 'Wilson', 900000, 4.3, 9, 'UK');

-- Queries on Country and Persons tables
-- 1. Find the number of persons in each country
SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name;

-- 2. Find the number of persons in each country sorted from high to low
SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name
ORDER BY NumberOfPersons DESC;

-- 3. Find out the average rating for Persons in respective countries if the average is greater than 3.0
SELECT Country_name, AVG(Rating) AS AvgRating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- 4. Find the countries with the same rating as the USA (using subqueries)
SELECT Country_name
FROM Persons
WHERE Rating = (
    SELECT AVG(Rating)
    FROM Persons
    WHERE Country_name = 'USA'
)
AND Country_name != 'USA';

-- 5. Select all countries whose population is greater than the average population of all nations
SELECT Country_name
FROM Country
WHERE Population > (
    SELECT AVG(Population)
    FROM Country
);

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

-- Insert sample data into the Customer table
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Ravi', 'Kumar', 'ravi.kumar@example.com', '345-678-9012', '789 Oak St', 'Mumbai', 'MH', '400001', 'India'),
(4, 'Wei', 'Zhang', 'wei.zhang@example.com', '456-789-0123', '101 Pine St', 'Beijing', 'BJ', '100000', 'China'),
(5, 'Maria', 'Silva', 'maria.silva@example.com', '567-890-1234', '202 Maple St', 'Sao Paulo', 'SP', '01000-000', 'Brazil'),
(6, 'Ivan', 'Ivanov', 'ivan.ivanov@example.com', '678-901-2345', '303 Birch St', 'Moscow', 'MOW', '101000', 'Russia'),
(7, 'Yuki', 'Tanaka', 'yuki.tanaka@example.com', '789-012-3456', '404 Cedar St', 'Tokyo', '13', '100-0001', 'Japan'),
(8, 'Hans', 'Muller', 'hans.muller@example.com', '890-123-4567', '505 Walnut St', 'Berlin', 'BE', '10115', 'Germany'),
(9, 'Sophie', 'Martin', 'sophie.martin@example.com', '901-234-5678', '606 Cherry St', 'Paris', 'IDF', '75001', 'France'),
(10, 'Emma', 'Wilson', 'emma.wilson@example.com', '012-345-6789', '707 Ash St', 'London', 'ENG', 'SW1A 1AA', 'UK');

-- Create a view named customer_info
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email
FROM Customer;

-- Select from the view
SELECT * FROM customer_info;

-- Create a view named US_Customers
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

-- Select from the view
SELECT * FROM US_Customers;

-- Create a view named Customer_details
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email, Phone_no, State
FROM Customer;

-- Select from the view
SELECT * FROM Customer_details;

-- Update phone numbers of customers who live in California for Customer_details view
UPDATE Customer
SET Phone_no = '999-999-9999'
WHERE State = 'CA';

-- Count the number of customers in each state and show only states with more than 5 customers
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- Return the number of customers in each state, based on the "state" column in the "customer_details" view
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer_details
GROUP BY State;

-- Return all columns from the "customer_details" view, sorted by the "state" column in ascending order
SELECT *
FROM Customer_details
ORDER BY State ASC;