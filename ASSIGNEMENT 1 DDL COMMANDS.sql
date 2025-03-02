-- Step 1: Create the database
CREATE DATABASE School;

-- Step 2: Use the School database
USE School;

-- Step 3: Create the STUDENT table
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(100),
    Marks INT,
    Grade CHAR(1)
);

-- Step 4: Insert sample data into the STUDENT table
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade)
VALUES
(101, 'Abhay', 90, 'A'),
(102, 'Jasir', 72, 'B'),
(103, 'Arya', 88, 'A'),
(104, 'Devanandh', 60, 'C'),
(105, 'Gopika', 55, 'D');

-- Step 5: Display the table using SELECT
SELECT * FROM STUDENT;

-- Step 6: Add a Contact column to the STUDENT table
ALTER TABLE STUDENT
ADD COLUMN Contact VARCHAR(15);

-- Step 7: Remove the Grade column from the STUDENT table
ALTER TABLE STUDENT
DROP COLUMN Grade;

-- Step 8: Rename the table STUDENT to CLASSTEN
RENAME TABLE STUDENT TO CLASSTEN;

-- Step 9: Delete all rows from the CLASSTEN table
TRUNCATE TABLE CLASSTEN;

-- Step 10: Remove the CLASSTEN table from the database
DROP TABLE CLASSTEN;
