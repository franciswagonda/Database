

– 1. Create database named “BSIT”
CREATE DATABASE BSIT;

– 2. Activate the created database
USE BSIT;

– 3. Create DEPARTMENT table
CREATE TABLE DEPARTMENT (
DeptNo INT PRIMARY KEY,
DName VARCHAR(50),
Loc VARCHAR(50)
);

– Create EMPLOYEE table
CREATE TABLE EMPLOYEE (
EmpNo VARCHAR(10) PRIMARY KEY,
Ename VARCHAR(50),
Job VARCHAR(50),
Salary DECIMAL(10,2),
DeptNo INT,
FOREIGN KEY (DeptNo) REFERENCES DEPARTMENT(DeptNo)
);

– Insert data into DEPARTMENT table
INSERT INTO DEPARTMENT (DeptNo, DName, Loc) VALUES
(10, ‘SALES’, ‘KAMPALA’),
(40, ‘MARKETING’, ‘ENTEBBE’),
(30, ‘ACCOUNTING’, ‘MUKONO’);

– Insert data into EMPLOYEE table
INSERT INTO EMPLOYEE (EmpNo, Ename, Job, Salary, DeptNo) VALUES
(‘E001’, NULL, ‘Clerk’, 40000, 30),
(‘E002’, ‘Agaba’, ‘Manager’, 16000, 30),
(‘E003’, ‘Mary’, ‘SalesLady’, 20000, 10),
(‘E004’, ‘Timo’, ‘Clerk’, 40000, 30),
(‘E005’, ‘Simon’, ‘Manager’, 60000, 40),
(‘E006’, ‘Mark’, ‘Manager’, 45000, 10),
(‘E007’, ‘Solomon’, ‘Teacher’, 30000, 30);

– ============================================
– FORMULATED SQL STATEMENTS (i-iv)
– Two different statements per condition
– ============================================

– i. Retrieving all columns and all rows
– Statement 1:
SELECT * FROM EMPLOYEE;

– Statement 2:
SELECT EmpNo, Ename, Job, Salary, DeptNo FROM EMPLOYEE;

– ii. Retrieving specific columns and all rows
– Statement 1:
SELECT Ename, Job FROM EMPLOYEE;

– Statement 2:
SELECT EmpNo, Salary, DeptNo FROM EMPLOYEE;

– iii. Retrieving all columns and specific rows
– Statement 1:
SELECT * FROM EMPLOYEE WHERE Salary > 30000;

– Statement 2:
SELECT * FROM EMPLOYEE WHERE DeptNo = 30;

– iv. Retrieving specific columns and specific rows
– Statement 1:
SELECT Ename, Job FROM EMPLOYEE WHERE Salary > 30000;

– Statement 2:
SELECT EmpNo, Ename, Salary FROM EMPLOYEE WHERE Job = ‘Manager’;

– ============================================
– SECTION 2: Additional Queries
– ============================================

– a) Retrieve the different databases running on your machine
SHOW DATABASES;

– b) Activate any database and retrieve all tables
USE BSIT;
SHOW TABLES;

– c) Retrieve details of staff who work as managers
SELECT * FROM EMPLOYEE WHERE Job = ‘Manager’;

– d) Retrieve the first two columns and rows from the employee table
SELECT EmpNo, Ename FROM EMPLOYEE LIMIT 2;

– e) Evoke the relational schema of the dept table
DESCRIBE DEPARTMENT;
– OR
SHOW COLUMNS FROM DEPARTMENT;
– Notice: This shows the structure including column names, data types,
– keys (Primary Key), null constraints, and default values

– f) Retrieve details of employees who work as managers and belong to deptno 30
SELECT * FROM EMPLOYEE WHERE Job = ‘Manager’ AND DeptNo = 30;

– g) Add one additional row to the dept table
INSERT INTO DEPARTMENT (DeptNo, DName, Loc)
VALUES (50, ‘PRO’, ‘Rubaga’);

– h) Ensure the value captured in (g) has affiliate values in child table
INSERT INTO EMPLOYEE (EmpNo, Ename, Job, Salary, DeptNo)
VALUES (‘E008’, ‘John’, ‘Coordinator’, 35000, 50);

– i) Retrieve the number of rows in the employee table
SELECT COUNT(*) AS NumberOfEmployees FROM EMPLOYEE;