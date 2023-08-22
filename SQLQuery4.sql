CREATE DATABASE oracle;
USE oracle;
CREATE TABLE register
(
	id INT PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(20),
    dob DATE,
    age INT,
    gender VARCHAR(20),
    phone VARCHAR(10),
    email VARCHAR(20),
    address VARCHAR(20),
    state VARCHAR(50),
    city VARCHAR(50),
    uname VARCHAR(20),
    psw VARCHAR(20)
);
SELECT * FROM register
INSERT INTO register
(id, fname, lname, dob, age, gender, phone, email, address, state, city, uname, psw)
VALUES
(1, 'Sharuk', 'TA', '2000-07-02', 23, 'Male', '1234567890', 'sharuk@example.com', '123 Main St', 'California', 'Los Angeles', 'johndoe', 'password123'),
(2, 'Sarath', 'Sagar', '1985-05-20', 28, 'Male', '9876543210', 'sarath@example.com', '456 Elm St', 'New York', 'New York City', 'janesmith', 'securepass456');
SELECT * FROM register
SELECT age,dob FROM register
UPDATE register 
set
	fname = 'Sharuk',
	lname = 'TA',
	age = '23',
	gender = 'male'
WHERE id = 1;
SELECT * FROM register
INSERT INTO register
(id, fname, lname, dob, age, gender, phone, email, address, state, city, uname, psw)
VALUES
(3, 'Smith', 'TA', '2000-07-02', 23, 'Male', '1234567890', 'SMITH@example.com', '123 Main St', 'California', 'Los Angeles', 'johndoe', 'password123');
SELECT * FROM register
CREATE TABLE employee
(
	id INT PRIMARY KEY,
	firstname VARCHAR(20),
	lastname VARCHAR(20),
	gender VARCHAR(20),
	age INT,
	salary NUMERIC(10,2),
	department VARCHAR(20)
);
SELECT * FROM employee
INSERT INTO employee 
(id,firstname,lastname,gender,age,salary,department)
VALUES
(1,'Rohan','Singh','male',26,23000.0,'software'),
(2,'Ritu','Mohan','female',29,13230.0,'investment'),
(3,'John','Max','male',31,54010.3,'accounts'),
(4,'Carl','Joy','male',49,36607.6,'senior software'),
(5,'Mithra','Das','female',37,66000.0,'manager'),
(6,'Rahul','TK','male',28,10000.3,'marketing');
SELECT * FROM employee
SELECT firstname,salary FROM employee WHERE salary = (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee));
SELECT department , COUNT(*) AS TOTAL_EMPLOYEES FROM employee GROUP BY department;
UPDATE employee set department = 'accounts' WHERE id = '2';
SELECT * FROM employee
SELECT department , COUNT(*) AS TOTAL_EMPLOYEES FROM employee GROUP BY department;

