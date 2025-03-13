-- Step 1: Create the Database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Step 2: Create the Worker Table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);

-- Step 3: Insert 10 Sample Entries into the Worker Table
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(1, 'John', 'Doe', 5000, '2023-10-01 09:00:00', 'HR'),
(2, 'Jane', 'Smith', 6000, '2023-10-02 10:00:00', 'IT'),
(3, 'Alice', 'Johnson', 5500, '2023-10-03 11:00:00', 'HR'),
(4, 'Bob', 'Brown', 7000, '2023-10-04 12:00:00', 'Finance'),
(5, 'Charlie', 'Davis', 4500, '2023-10-05 13:00:00', 'IT'),
(6, 'Eva', 'Wilson', 8000, '2023-10-06 14:00:00', 'Finance'),
(7, 'Frank', 'Moore', 6500, '2023-10-07 15:00:00', 'HR'),
(8, 'Grace', 'Taylor', 7500, '2023-10-08 16:00:00', 'IT'),
(9, 'Henry', 'Anderson', 9000, '2023-10-09 17:00:00', 'Finance'),
(10, 'Ivy', 'Thomas', 5000, '2023-10-10 18:00:00', 'HR');

-- Step 4: Create Stored Procedures

-- Change delimiter to allow procedure creation
DELIMITER //

-- 1. Stored Procedure to Add a New Record to the Worker Table
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

-- 2. Stored Procedure to Retrieve Salary by Worker ID
CREATE PROCEDURE GetSalaryByWorkerId(
    IN p_Worker_Id INT,
    OUT p_Salary INT(15)
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //

-- 3. Stored Procedure to Update Department by Worker ID
CREATE PROCEDURE UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //

-- 4. Stored Procedure to Retrieve Number of Workers in a Department
CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END //

-- 5. Stored Procedure to Retrieve Average Salary by Department
CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END //

-- Reset delimiter
DELIMITER ;

-- Step 5: Procedure Calls

-- 1. Call AddWorker to insert a new record
CALL AddWorker(11, 'Jack', 'White', 8500, '2023-10-11 19:00:00', 'IT');

-- 2. Call GetSalaryByWorkerId to retrieve salary for Worker_Id = 1
SET @salary = 0;
CALL GetSalaryByWorkerId(1, @salary);
SELECT @salary AS Salary;

-- 3. Call UpdateDepartment to update the department for Worker_Id = 1
CALL UpdateDepartment(1, 'IT');

-- 4. Call GetWorkerCountByDepartment to get the number of workers in 'HR' department
SET @workerCount = 0;
CALL GetWorkerCountByDepartment('HR', @workerCount);
SELECT @workerCount AS WorkerCount;

-- 5. Call GetAverageSalaryByDepartment to get the average salary in 'HR' department
SET @avgSalary = 0;
CALL GetAverageSalaryByDepartment('HR', @avgSalary);
SELECT @avgSalary AS AverageSalary;

-- Verify the Worker table after all operations
SELECT * FROM Worker;