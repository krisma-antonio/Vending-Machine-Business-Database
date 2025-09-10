USE krismaci_PROJECT;

-- Trigger 1: Subtract from Product_Quantity after a Transaction
DELIMITER $$
CREATE TRIGGER Sub_on_Transaction
AFTER INSERT ON Transactions
FOR EACH ROW 
BEGIN
	UPDATE Product_Quantity
    SET prod_quantity = prod_quantity - 1
    WHERE Machine_ID = NEW.Machine_ID AND Product_ID = NEW.Product_ID;
END$$
DELIMITER ;

-- Trigger 2: Add to Product_Quantity after an Inventory Log
DELIMITER $$
CREATE TRIGGER Add_on_Inventory_Log
AFTER INSERT ON Inventory_Logs
FOR EACH ROW
BEGIN
	INSERT INTO Product_Quantity (Machine_ID, Product_Id, prod_quantity)
	VALUES (NEW.Machine_ID, NEW.Product_ID, NEW.quantity)
	ON DUPLICATE KEY UPDATE prod_quantity = prod_quantity + NEW.quantity;
END$$
DELIMITER ;

-- Trigger 3: Process Restocking Requests (adjust Products + Product_Quantity)
DELIMITER $$
CREATE TRIGGER Process_Restock
AFTER INSERT ON Restocking_Requests
FOR EACH ROW
BEGIN
	UPDATE Products
    SET stock_quantity = stock_quantity - NEW.quantity_requested
    WHERE Product_ID = NEW.Product_ID;
    
    INSERT INTO Product_Quantity (Machine_ID, Product_ID, prod_quantity)
    VALUES (NEW.Machine_ID, NEW.Product_ID, NEW.quantity_requested)
    ON DUPLICATE KEY UPDATE prod_quantity = prod_quantity + NEW.quantity_requested;
END$$
DELIMITER ;