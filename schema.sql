CREATE DATABASE little_lemon;
USE little_lemon;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact VARCHAR(15)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    TableNo INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Menu (
    MenuID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Quantity INT,
    TotalCost DECIMAL(10,2),
    BookingID INT,
    MenuID INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);