USE login;
SELECT * from employee_table
DROP TABLE employee_table;
CREATE TABLE employee_tb
(
	employee_id INT PRIMARY KEY,
	Name VARCHAR(20),
	Fathers_name VARCHAR(20),
	Mobile_No INT,
	Address VARCHAR(50),
	Department VARCHAR(20),
	Salary NUMERIC(10,2)
);
SELECT * FROM employee_tb
DROP TABLE employee_tb;
CREATE TABLE employee_tbl
(
	employee_id INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(20),
	Fathers_name VARCHAR(20),
	Mobile_No INT,
	Address VARCHAR(50),
	Department VARCHAR(20),
	Salary NUMERIC(10,2)
);
SELECT * FROM employee_tbl
ALTER TABLE employee_tbl
ALTER COLUMN Mobile_No VARCHAR(10);
SELECT * FROM employee_tbl
UPDATE employee_tbl SET Name = "SHARUKHTA" WHERE employee_id = 2;
DROP TABLE employee_tbl;
CREATE TABLE employee_tbl
(
	id INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(20),
	Fathers_name VARCHAR(20),
	Mobile_No VARCHAR(20),
	Address VARCHAR(50),
	Department VARCHAR(20),
	Salary NUMERIC(10,2)
);
SELECT * FROM employee_tbl
UPDATE employee_tbl SET Name = "SARATH" WHERE id = 2;
DROP TABLE employee_tbl;
CREATE TABLE employee_tbl
(
	employee_id INT PRIMARY KEY IDENTITY(1,1),
	Employee_name VARCHAR(20),
	Fathers_name VARCHAR(20),
	Mobile_No VARCHAR(20),
	Employee_address VARCHAR(50),
	Department VARCHAR(20),
	Salary NUMERIC(10,2)
);
SELECT * FROM employee_tbl
INSERT INTO employee_tbl (Employee_name ,Fathers_name ,Mobile_No ,Employee_address ,Department ,Salary)
VALUES
('Sharuk','Jaleel','9446625055','Thrissur','Sales',32000.22);
SELECT * FROM employee_tbl
UPDATE employee_tbl SET Employee_name = 'Sarath' WHERE employee_id = '1';
SELECT * FROM employee_tbl