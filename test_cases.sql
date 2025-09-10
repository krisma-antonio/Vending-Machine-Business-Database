USE krismaci_PROJECT;

-- See initial values before any operations
SELECT * FROM Product_Quantity WHERE Machine_ID = 101 AND Product_ID = 1;
SELECT stock_quantity FROM Products WHERE Product_ID = 1;

-- TEST 1: Subtract from Product_Quantity after a new transaction
-- INSERT a transaction with a new Transaction_ID = 4
INSERT INTO Transactions VALUES (4, 101, 1, NOW(), 1.50);

-- Check the result after subtraction
SELECT * FROM Product_Quantity WHERE Machine_ID = 101 AND Product_ID = 1;

-- TEST 2: Add to Product_Quantity after inventory log
-- INSERT an inventory log with a new Log_ID = 13
INSERT INTO Inventory_Logs VALUES (13, 101, 1, 1, 10, CURDATE());

-- Check the result after addition
SELECT * FROM Product_Quantity WHERE Machine_ID = 101 AND Product_ID = 1;

-- TEST 3: Process restock request (adds to Product_Quantity + subtracts from Products)
-- INSERT a restock request with a new Request_ID = 4
INSERT INTO Restocking_Requests VALUES (4, 1, 101, 1, CURDATE(), 5);

-- Final check: both product quantity in the machine and warehouse stock
SELECT 
  (SELECT prod_quantity FROM Product_Quantity WHERE Machine_ID = 101 AND Product_ID = 1) AS machine_stock,
  (SELECT stock_quantity FROM Products WHERE Product_ID = 1) AS warehouse_stock;