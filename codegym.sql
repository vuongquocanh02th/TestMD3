-- Creating the database
CREATE DATABASE CodeGymEcommerce;
USE CodeGymEcommerce;

-- Creating the Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 100),
    Discount ENUM('5%', '10%', '15%', '20%') NOT NULL,
    Stock INT NOT NULL CHECK (Stock > 10)
);

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Address VARCHAR(255) NOT NULL
);

-- Creating the Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- Creating the Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    PaymentMethod VARCHAR(50) NOT NULL,
    OrderDate DATE NOT NULL,
    DeliveryDate DATE,
    DeliveryAddress VARCHAR(255) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Creating the OrderDetails table to handle many-to-many relationship between Orders and Products
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inserting sample data for Products
INSERT INTO Products (Name, Price, Discount, Stock) VALUES
('Laptop', 1200.00, '10%', 50),
('Smartphone', 800.00, '5%', 30),
('Tablet', 500.00, '15%', 20),
('Headphones', 150.00, '20%', 100),
('Monitor', 300.00, '5%', 25),
('Keyboard', 200.00, '10%', 60),
('Mouse', 150.00, '5%', 70),
('Printer', 200.00, '15%', 15),
('Camera', 1000.00, '20%', 20),
('Speaker', 250.00, '10%', 40);

-- Inserting sample data for Employees
INSERT INTO Employees (Name, BirthDate, Address) VALUES
('Andy Ngo', '1985-06-15', '123 Main St, Hanoi'),
('Alan Hoang', '1985-06-15', '100 Main St, Hanoi'),
('Alex Mai', '1985-06-15', '111 Main St, Hanoi'),
('Asa Chu', '1985-06-15', '22 Main St, Hanoi'),
('John Do', '1985-06-15', '12 Main St, Hanoi'),
('Alice Nguyen', '1985-06-15', '123 Main St, Hanoi'),
('Bob Tran', '1990-03-20', '456 Elm St, Ho Chi Minh City'),
('Charlie Le', '1988-11-05', '789 Oak St, Da Nang'),
('Diana Pham', '1992-07-08', '101 Pine St, Can Tho'),
('Ethan Vu', '1987-09-12', '202 Maple St, Hue');

-- Inserting sample data for Customers
INSERT INTO Customers (Name, BirthDate, Phone, Address, Email) VALUES
('John Doe', '1995-01-10', '0987654321', '12 Apple St, Hanoi', 'john@example.com'),
('Jane Smith', '1980-02-15', '0976543210', '34 Banana St, Ho Chi Minh City', 'jane@example.com'),
('Michael Brown', '1992-03-25', '0965432109', '56 Cherry St, Da Nang', 'michael@example.com'),
('Emily Davis', '1985-04-30', '0954321098', '78 Date St, Can Tho', 'emily@example.com'),
('Em Davis', '1985-04-30', '0954321096', '78 Date St, Can Tho', 'em@example.com'),
('Emil Davis', '1985-04-30', '0954321097', '78 Date St, Can Tho', 'emi@example.com'),
('Mily Davis', '1985-04-30', '0954321099', '78 Date St, Can Tho', 'emil@example.com'),
('Emi Davis', '1985-04-30', '0954321095', '78 Date St, Can Tho', 'mily@example.com'),
('Ly Davis', '1985-04-30', '0954321094', '78 Date St, Can Tho', 'ly@example.com'),
('David Wilson', '1990-05-20', '0943210987', '90 Elder St, Hue', 'david@example.com');

insert into Orders (CustomerID, EmployeeID, PaymentMethod, OrderDate, DeliveryDate, DeliveryAddress)
values
(1, 1, 'Tien mat', '2024-01-10', '2024-01-15', 'Ha Noi'),
(2, 2, 'Chuyen khoan', '2024-01-10', '2024-01-15', 'Ha Noi'),
(3, 3, 'Tien mat', '2024-01-10', '2024-01-15', 'Ha Noi'),
(4, 4, 'Chuyen khoan', '2024-01-10', '2024-01-15', 'Ha Noi'),
(5, 5, 'Tien mat', '2024-01-10', '2024-01-15', 'Ha Noi'),
(6, 6, 'Chuyen khoan', '2024-01-10', '2024-01-15', 'Ha Noi'),
(7, 7, 'Tien mat', '2024-01-10', '2024-01-15', 'Ha Noi'),
(8, 8, 'Chuyen khoan', '2024-01-10', '2024-01-15', 'Ha Noi'),
(9, 9, 'Tien mat', '2024-01-10', '2024-01-15', 'Ha Noi'),
(10, 10, 'Chuyen khoan', '2024-01-10', '2024-01-15', 'Ha Noi');

insert into OrderDetails (OrderID, ProductID, Quantity)
values
(1,31,10),
(2,32,11),
(3,33,12),
(4,34,15),
(5,35,16),
(6,36,17),
(7,37,18),
(8,38,19),
(9,39,20),
(10,40,25);
