SHOW DATABASES;

USE krismaci_PROJECT;

-- 1. Location_Types
CREATE TABLE Location_Types (
    Location_Type_ID INT PRIMARY KEY,
    type VARCHAR(100),
    description TEXT,
    average_customers_per_day INT
);

-- 2. Locations
CREATE TABLE Locations (
    Location_ID INT PRIMARY KEY,
    Location_Type_ID INT,
    address VARCHAR(255),
    capacity_of_machines INT,
    FOREIGN KEY (Location_Type_ID) REFERENCES Location_Types(Location_Type_ID)
);

-- 3. Categories
CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY,
    type VARCHAR(100),
    description TEXT,
    created_at DATE
);

-- 4. Suppliers
CREATE TABLE Suppliers (
    Supplier_ID INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);

-- 5. Products
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Category_ID INT,
    Supplier_ID INT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID)
);

-- 6. Vending_Machines
CREATE TABLE Vending_Machines (
    Machine_ID INT PRIMARY KEY,
    Location_ID INT,
    model VARCHAR(100),
    purchase_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID)
);

-- 7. Employees
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(100),
    assigned_machine_id INT,
    FOREIGN KEY (assigned_machine_id) REFERENCES Vending_Machines(Machine_ID)
);

-- 8. Transactions
CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY,
    Machine_ID INT,
    Product_ID INT,
    timestamp DATETIME,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (Machine_ID) REFERENCES Vending_Machines(Machine_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- 9. Payments
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Transaction_ID INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    timestamp DATETIME,
    FOREIGN KEY (Transaction_ID) REFERENCES Transactions(Transaction_ID)
);

-- 10. Inventory_Logs
CREATE TABLE Inventory_Logs (
    Log_ID INT PRIMARY KEY,
    Machine_ID INT,
    Product_ID INT,
    Employee_ID INT,
    quantity INT,
    date DATE,
    FOREIGN KEY (Machine_ID) REFERENCES Vending_Machines(Machine_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

-- 11. Restocking_Requests
CREATE TABLE Restocking_Requests (
    Request_ID INT PRIMARY KEY,
    Employee_ID INT,
    Machine_ID INT,
    Product_ID INT,
    request_data DATE,
    quantity_requested INT,
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID),
    FOREIGN KEY (Machine_ID) REFERENCES Vending_Machines(Machine_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- 12. Maintenance_Requests
CREATE TABLE Maintenance_Requests (
    Request_ID INT PRIMARY KEY,
    Machine_ID INT,
    Employee_ID INT,
    issue_description TEXT,
    request_data DATE,
    resolution_status VARCHAR(100),
    FOREIGN KEY (Machine_ID) REFERENCES Vending_Machines(Machine_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

-- 13. Feedback
CREATE TABLE Feedback (
    Feedback_ID INT PRIMARY KEY,
    Machine_ID INT,
    description TEXT,
    date_submitted DATE,
    FOREIGN KEY (Machine_ID) REFERENCES Vending_Machines(Machine_ID)
);

-- 14. Product_Quantity
CREATE TABLE Product_Quantity (
    Machine_ID INT,
    Product_ID INT,
    prod_quantity INT,
    PRIMARY KEY (Machine_ID, Product_ID),
    FOREIGN KEY (Machine_ID) REFERENCES Vending_Machines(Machine_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

SHOW TABLES;