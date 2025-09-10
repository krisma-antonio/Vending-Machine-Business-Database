USE krismaci_PROJECT;

-- 1. List all vending machines with their location addresses
SELECT vm.Machine_ID, vm.model, l.address
FROM Vending_Machines vm
JOIN Locations l ON vm.Location_ID = l.Location_ID;

-- 2. Get total transactions by machine
SELECT Machine_ID, COUNT(*) AS total_transactions
FROM Transactions
GROUP BY Machine_ID;

-- 3. List products that are out of stock
SELECT name, stock_quantity
FROM Products
WHERE stock_quantity = 0;

-- 4. Get all feedback for a specific machine
SELECT description, date_submitted
FROM Feedback
WHERE Machine_ID = 101;

-- 5. Get restocking requests made by each employee
SELECT Employee_ID, COUNT(*) AS total_requests
FROM Restocking_Requests
GROUP BY Employee_ID;

-- 6. Find locations with more than 5 vending machines
SELECT Location_ID, COUNT(*) AS machine_count
FROM Vending_Machines
GROUP BY Location_ID
HAVING COUNT(*) > 5;

-- 7. Get a list of payments that failed
SELECT Payment_ID, payment_method, timestamp
FROM Payments
WHERE payment_status = 'Failed';

-- 8. Total inventory restocked per employee
SELECT Employee_ID, SUM(quantity) AS total_quantity
FROM Inventory_Logs
GROUP BY Employee_ID;

-- 9. List top 5 most frequently restocked products
SELECT Product_ID, COUNT(*) AS times_requested
FROM Restocking_Requests
GROUP BY Product_ID
ORDER BY times_requested DESC
LIMIT 5;

-- 10. Show supplier emails for products under $2.00
SELECT DISTINCT s.name, s.email
FROM Products p
JOIN Suppliers s ON p.Supplier_ID = s.Supplier_ID
WHERE p.price < 2.00;

-- 11. Transactions including product and machine details
SELECT t.Transaction_ID, t.timestamp, p.name AS product_name, vm.model AS machine_model
FROM Transactions t
JOIN Products p ON t.Product_ID = p.Product_ID
JOIN Vending_Machines vm ON t.Machine_ID = vm.Machine_ID;

-- 12. Average customers by location type
SELECT lt.type, AVG(lt.average_customers_per_day) AS avg_customers
FROM Location_Types lt
JOIN Locations l ON lt.Location_Type_ID = l.Location_Type_ID
GROUP BY lt.type;

-- 13. Employees assigned to each machine
SELECT vm.Machine_ID, e.name AS employee_name
FROM Employees e
JOIN Vending_Machines vm ON e.assigned_machine_id = vm.Machine_ID;

-- 14. Maintenance issues still unresolved
SELECT Request_ID, issue_description
FROM Maintenance_Requests
WHERE resolution_status != 'Resolved';

-- 15. Number of feedback entries per machine
SELECT Machine_ID, COUNT(*) AS feedback_count
FROM Feedback
GROUP BY Machine_ID;

-- 16. Name and type of products in the database with suppliers
SELECT type, GROUP_CONCAT(DISTINCT p.name SEPARATOR ", ") AS `Name of Snacks`, s.name as `Supplier name`
FROM Products p
JOIN Categories USING(Category_ID)
JOIN Suppliers s USING (Supplier_ID)
GROUP BY type, s.name;

-- 17. List all vending machines with their location type and the type of products they have
SELECT vm.Machine_ID, vm.model, lt.type as `Location type`, GROUP_CONCAT(DISTINCT p.name SEPARATOR ", ") AS `Name of Snacks`
FROM Vending_Machines vm
JOIN Locations l USING(Location_ID)
JOIN Location_Types lt USING(Location_Type_ID)
JOIN Inventory_Logs USING (Machine_ID)
JOIN Products p USING (Product_ID)
JOIN Categories USING(Category_ID)
GROUP BY vm.Machine_ID;

-- 18. With quantity displayed for each of the snacks
SELECT vm.Machine_ID, vm.model, l.address, GROUP_CONCAT(DISTINCT p.name SEPARATOR ", ") AS `Name of Snacks`, prod_quantity as `Quantity of Products`
FROM Vending_Machines vm
JOIN Locations l USING(Location_ID)
JOIN Inventory_Logs USING (Machine_ID)
JOIN Products p USING (Product_ID)
JOIN Categories USING(Category_ID)
JOIN Product_Quantity ON Product_Quantity.Machine_ID=vm.Machine_ID AND Product_Quantity.Product_ID=p.Product_ID
GROUP BY vm.Machine_ID, p.name, prod_quantity;