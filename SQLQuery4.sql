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
SELECT * FROM employee ORDER BY salary DESC
CREATE TABLE customers
(
	customer_id INT PRIMARY KEY,
	customer_name VARCHAR(20),
	country VARCHAR(20),
	email VARCHAR(20)
);
INSERT INTO customers (customer_id,customer_name,country,email)
VALUES
(1,'Sreekumar','India','sreekumar@gmail.com'),
(2,'Bonny','US','bon@gmail.com'),
(3,'Riya','India','riya@gmail.com'),
(4,'Joseph','UK','joseph@gmail.com'),
(5,'Muhammed','UAE','mhmd@gmail.com');
CREATE TABLE orders
(
	order_id INT PRIMARY KEY,
	customer_id INT FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	order_date DATE,
	amount DECIMAL(20,2),
	order_status VARCHAR(20)
);
INSERT INTO orders (order_id,customer_id,order_date,amount,order_status)
VALUES
(1,2,'2023-08-21',2000.02,'status reported'),
(2,4,'2023-09-11',10000.00,'not reported'),
(3,3,'2023-02-10',23400.00,'delivered'),
(4,2,'2021-11-09',44000.00,'not reported'),
(5,1,'2023-09-02',33399.23,'status reported');
SELECT * FROM customers
SELECT * FROM orders
SELECT * FROM customers INNER JOIN orders ON orders.customer_id = customers.customer_id
SELECT customer_name,email,order_status FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id
SELECT * FROM customers LEFT JOIN orders ON orders.customer_id = customers.customer_id
SELECT customer_name,email,order_status FROM customers LEFT JOIN orders ON orders.customer_id = customers.customer_id
SELECT customer_name,email,order_status FROM customers LEFT JOIN orders ON orders.customer_id = customers.customer_id ORDER BY customers.customer_name
SELECT * FROM customers RIGHT JOIN orders ON orders.customer_id = customers.customer_id
SELECT customer_name,email,order_status FROM customers RIGHT JOIN orders ON orders.customer_id = customers.customer_id
SELECT customer_name,email,amount FROM customers FULL OUTER JOIN orders ON orders.customer_id = customers.customer_id
DELETE FROM employee WHERE salary = 10000.30
SELECT * FROM employee
INSERT INTO employee 
(id,firstname,lastname,gender,age,salary,department)
VALUES
(6,'Rahul','TK','male',28,10000.3,'marketing');
SELECT * FROM employee
SELECT customers.customer_name,customers.country,customers.email,orders.order_date,orders.amount,orders.order_status
FROM customers,orders
WHERE customers.customer_id = orders.customer_id AND order_id = 4
DROP TABLE register;
CREATE TABLE register
(
	id INT PRIMARY KEY IDENTITY(1,1),
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
CREATE PROCEDURE Createregister
    @First_Name VARCHAR(20),
    @Last_Name VARCHAR(20),
    @DateOfBirth DATE,
    @Age INT,
    @Gender VARCHAR(20),
    @PhoneNo VARCHAR(10),
    @Email VARCHAR(20),
    @Address VARCHAR(20),
    @State VARCHAR(50),
    @City VARCHAR(50),
    @Username VARCHAR(20),
    @Password VARCHAR(20)
AS
BEGIN
    INSERT INTO register (fname, lname, dob, age, gender, phone, email, address, state, city, uname, psw)
    VALUES (@First_Name, @Last_Name, @DateOfBirth, @Age, @Gender, @PhoneNo, @Email, @Address, @State, @City, @Username, @Password);
END;
EXEC Createregister
    @First_Name = 'Sharuk',
    @Last_Name = 'TA',
	@DateOfBirth = '2000-07-02',
	@Age = 23,
	@Gender = 'Male',
	@PhoneNo = '8289808134',
	@Email = 'sharukta@gmail.com',
	@Address = '123 main street',
	@State = 'Kerala',
	@City = 'Thrissur',
	@Username = 'sharuk123',
	@Password = 'sharu123';
SELECT * FROM register
CREATE PROCEDURE ReadUser
    @UserId INT = NULL
AS
BEGIN
    IF @UserId IS NULL
        SELECT * FROM register; 
    ELSE
        SELECT * FROM register WHERE id = @UserId;
END;
EXEC ReadUser @UserId = 1;
CREATE PROCEDURE UpdateUser
    @UserID INT,
    @First_Name VARCHAR(20),
    @Last_Name VARCHAR(20),
    @DateOfBirth DATE,
    @Age INT,
    @Gender VARCHAR(20),
    @PhoneNo VARCHAR(10),
    @Email VARCHAR(20),
    @Address VARCHAR(20),
    @State VARCHAR(50),
    @City VARCHAR(50),
    @Username VARCHAR(20),
    @Password VARCHAR(20)
AS
BEGIN
    UPDATE register
    SET
        fname = @First_Name,
        lname = @Last_Name,
        dob = @DateOfBirth,
        age = @Age,
        gender = @Gender,
        phone = @PhoneNo,
        email = @Email,
        address = @Address,
        state = @State,
        city = @City,
        uname = @Username,
        psw = @Password
    WHERE id = @UserID;
END;
EXEC UpdateUser
    @UserID = 3,
    @First_Name = 'sarath',
	@Last_Name = 'sagar',
	@DateOfBirth = '1999-02-22',
	@Age = 24,
	@Gender = 'Male',
	@PhoneNo = '8569898134',
	@Email = 'sarath@gmail.com',
	@Address = '123 main street',
	@State = 'Tamil nadu',
	@City = 'Chennai',
	@Username = 'sarath',
	@Password = '345667';
SELECT * FROM register
CREATE PROCEDURE DeleteUser
    @UserID INT
AS
BEGIN
    DELETE FROM register
    WHERE id = @UserID;
END;
EXEC DeleteUser
    @UserID = 1;
SELECT * FROM register
CREATE PROCEDURE ManageUser
    @Action VARCHAR(10),
    @UserID INT = NULL,
    @First_Name VARCHAR(20) = NULL,
    @Last_Name VARCHAR(20) = NULL,
    @DateOfBirth DATE = NULL,
    @Age INT = NULL,
    @Gender VARCHAR(20) = NULL,
    @PhoneNo VARCHAR(10) = NULL,
    @Email VARCHAR(20) = NULL,
    @Address VARCHAR(20) = NULL,
    @State VARCHAR(50) = NULL,
    @City VARCHAR(50) = NULL,
    @Username VARCHAR(20) = NULL,
    @Password VARCHAR(20) = NULL
AS
BEGIN
    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO register (fname, lname, dob, age, gender, phone, email, address, state, city, uname, psw)
        VALUES (@First_Name, @Last_Name, @DateOfBirth, @Age, @Gender, @PhoneNo, @Email, @Address, @State, @City, @Username, @Password);
    END;
    ELSE IF @Action = 'READ'
    BEGIN
        IF @UserID IS NULL
            SELECT * FROM register;
        ELSE
            SELECT * FROM register WHERE id = @UserID;
    END;
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE register
        SET
            fname = ISNULL(@First_Name, fname),
            lname = ISNULL(@Last_Name, lname),
            dob = ISNULL(@DateOfBirth, dob),
            age = ISNULL(@Age, age),
            gender = ISNULL(@Gender, gender),
            phone = ISNULL(@PhoneNo, phone),
            email = ISNULL(@Email, email),
            address = ISNULL(@Address, address),
            state = ISNULL(@State, state),
            city = ISNULL(@City, city),
            uname = ISNULL(@Username, uname),
            psw = ISNULL(@Password, psw)
        WHERE id = @UserID;
    END;
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM register
        WHERE id = @UserID;
    END;
END;
EXEC ManageUser 
    @Action = 'CREATE',
    @First_Name = 'Riya',
    @Last_Name = 'Doe',
    @DateOfBirth = '1985-05-15',
    @Age = 38,
    @Gender = 'Female',
    @PhoneNo = '1234567890',
    @Email = 'riya@example.com',
    @Address = '456 Second St',
    @State = 'California',
    @City = 'Los Angeles',
    @Username = 'riya',
    @Password = 'password123';
SELECT * FROM register
EXEC ManageUser @Action = 'READ',@UserID=3;
EXEC ManageUser 
    @Action = 'UPDATE',
	@UserID = 4,
	@First_Name = 'Riya',
    @Last_Name = 'Doe',
    @DateOfBirth = '1985-05-15',
    @Age = 38,
    @Gender = 'Female',
    @PhoneNo = '1234567890',
    @Email = 'riya@example.com',
    @Address = '456 Second St',
    @State = 'California',
    @City = 'Los Angeles',
    @Username = 'riya',
    @Password = 'password123';
SELECT * FROM register
EXEC ManageUser @Action = 'DELETE', @UserID = 4;
SELECT * FROM register