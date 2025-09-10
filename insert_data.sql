USE krismaci_PROJECT;

-- Location_Types
INSERT INTO Location_Types VALUES (1, 'Mall', 'Located inside malls', 300);
INSERT INTO Location_Types VALUES (2, 'Office', 'Corporate buildings', 150);
INSERT INTO Location_Types VALUES (3, 'School', 'School buildings including universities, high school and elementary', 100);
INSERT INTO Location_Types VALUES (4, 'Street', 'Located at the side of the street', 135);

-- Locations
INSERT INTO Locations VALUES (1, 1, '123 Main St, Cityville', 10);
INSERT INTO Locations VALUES (2, 2, '456 Business Rd, Industriaville', 5);

-- Categories
INSERT INTO Categories VALUES (1, 'Drinks', 'Cold beverages', '2024-01-10');
INSERT INTO Categories VALUES (2, 'Chips', 'Packaged chips', '2024-01-11');
INSERT INTO Categories VALUES (3, 'Hot Drinks', 'Hot beverages', '2024-01-11');
INSERT INTO Categories VALUES (4, 'Chocolates', 'Sweet Chocolocates bars', '2024-01-11');
INSERT INTO Categories VALUES (5, 'Bars', 'Snack bars', '2024-01-11');

-- Suppliers
INSERT INTO Suppliers VALUES (1, 'Coca-Cola', 'contact@coke.com', 'Atlanta, GA');
INSERT INTO Suppliers VALUES (2, 'Lays', 'support@lays.com', 'Plano, TX');
INSERT INTO Suppliers VALUES (3, 'Chocolate Factory', 'support@chocolatefactory.com', 'Hershey, PA');
INSERT INTO Suppliers VALUES (4, 'Chip Company', 'support@chipcompany.com', 'Boise, ID');
INSERT INTO Suppliers VALUES (5, 'Starbucks', 'support@starbucks.com', 'Los Angeles, CA');
INSERT INTO Suppliers VALUES (6, 'Quaker', 'support@quaker.com', 'Cedar Rapids, IA');
INSERT INTO Suppliers VALUES (7, 'Kirkland', 'support@kirkland.com', 'Kirkland, WA');
INSERT INTO Suppliers VALUES (8, 'PepsiCo', 'support@pepsico.com', 'Harrison, NY');
INSERT INTO Suppliers VALUES (9, 'CG Roxane LLC', 'support@roxanellc.com', 'Pasadena, TX');

-- Products
INSERT INTO Products VALUES (1, 1, 1, 'Coke Can', 1.50, 50);
INSERT INTO Products VALUES (2, 2, 2, 'Lays Chips', 1.00, 0);
INSERT INTO Products VALUES (3, 2, 4, 'Ruffles', 1.50, 1000);
INSERT INTO Products VALUES (4, 2, 4, 'Doritos', 1.30, 2000);
INSERT INTO Products VALUES (5, 2, 4, 'Cheetos', 1.25, 1500);
INSERT INTO Products VALUES (6, 2, 8, 'Fritos', 1.15, 900);
INSERT INTO Products VALUES (7, 4, 3, 'Snickers', 1.60, 500);
INSERT INTO Products VALUES (8, 4, 3, 'Twix', 1.75, 700);
INSERT INTO Products VALUES (9, 4, 3, 'Kit Kat', 1.50, 800);
INSERT INTO Products VALUES (10, 1, 5, 'Starbucks Frapuccino Coffee Drink', 2.50, 70);
INSERT INTO Products VALUES (11, 1, 1, 'Diet Coke', 1.00, 400);
INSERT INTO Products VALUES (12, 1, 8, 'Mountain Dew', 1.00, 550);
INSERT INTO Products VALUES (13, 1, 8, 'Pepsi', 0.90, 760);
INSERT INTO Products VALUES (14, 1, 8, 'Diet Pepsi', 1.00, 400);
INSERT INTO Products VALUES (15, 5, 6, 'Quaker Chewy Granola bar', 0.50, 430);
INSERT INTO Products VALUES (16, 5, 7, 'Trail mix', 1.00, 860);
INSERT INTO Products VALUES (17, 1, 9, 'Natural Spring Water', 0.75, 760);

-- Vending_Machines
INSERT INTO Vending_Machines VALUES (101, 1, 'VMX-1000', '2023-03-15', 'Active');
INSERT INTO Vending_Machines VALUES (102, 2, 'VMY-2000', '2023-06-10', 'Active');

-- Employees
INSERT INTO Employees VALUES (1, 'Alice Johnson', 'Technician', 101);
INSERT INTO Employees VALUES (2, 'Bob Smith', 'Stocker', 102);

-- Transactions
INSERT INTO Transactions VALUES (1, 101, 1, '2024-04-01 10:00:00', 1.50);
INSERT INTO Transactions VALUES (2, 101, 2, '2024-04-01 11:00:00', 1.00);
INSERT INTO Transactions VALUES (3, 101, 1, NOW(), 1.50);

-- Payments
INSERT INTO Payments VALUES (1, 1, 'Credit Card', 'Success', '2024-04-01 10:01:00');
INSERT INTO Payments VALUES (2, 2, 'Cash', 'Failed', '2024-04-01 11:01:00');

-- Inventory_Logs
INSERT INTO Inventory_Logs VALUES (1, 101, 1, 1, 20, '2024-03-25');
INSERT INTO Inventory_Logs VALUES (2, 102, 2, 2, 30, '2024-03-26');
INSERT INTO Inventory_Logs VALUES (3, 101, 3, 1, 15, '2024-03-25');
INSERT INTO Inventory_Logs VALUES (4, 101, 5, 1, 12, '2024-03-25');
INSERT INTO Inventory_Logs VALUES (5, 101, 7, 1, 16, '2024-03-25');
INSERT INTO Inventory_Logs VALUES (6, 101, 9, 1, 17, '2024-03-25');
INSERT INTO Inventory_Logs VALUES (7, 101, 11, 1, 5, '2024-03-25');
INSERT INTO Inventory_Logs VALUES (8, 101, 17, 1, 10, '2024-03-25');
INSERT INTO Inventory_Logs VALUES (9, 102, 15, 2, 3, '2024-03-26');
INSERT INTO Inventory_Logs VALUES (10, 102, 16, 2, 7, '2024-03-26');
INSERT INTO Inventory_Logs VALUES (11, 102, 10, 2, 10, '2024-03-26');
INSERT INTO Inventory_Logs VALUES (12, 101, 1, 1, 10, CURDATE());

-- Restocking_Requests
INSERT INTO Restocking_Requests VALUES (1, 1, 101, 1, '2024-03-20', 50);
INSERT INTO Restocking_Requests VALUES (2, 2, 102, 2, '2024-03-21', 60);
INSERT INTO Restocking_Requests VALUES (3, 1, 101, 1, CURDATE(), 5);

-- Maintenance_Requests
INSERT INTO Maintenance_Requests VALUES (1, 101, 1, 'Screen not working', '2024-03-15', 'Unresolved');
INSERT INTO Maintenance_Requests VALUES (2, 102, 2, 'Coin jammed', '2024-03-18', 'Resolved');

-- Feedback
INSERT INTO Feedback VALUES (1, 101, 'Great machine!', '2024-03-05');
INSERT INTO Feedback VALUES (2, 101, 'Was out of stock', '2024-03-07');

-- Product_Quantity (initial values to test triggers)
INSERT INTO Product_Quantity VALUES (101, 1, 20); -- Coke Can
INSERT INTO Product_Quantity VALUES (101, 11, 35); -- Diet Coke
INSERT INTO Product_Quantity VALUES (101, 7, 10); -- Snickers
INSERT INTO Product_Quantity VALUES (102, 2, 15); -- Lays Chips
INSERT INTO Product_Quantity VALUES (102, 8, 25); -- Twix
INSERT INTO Product_Quantity VALUES (102, 13, 40); -- Pepsi