-- Sample data for testing database for Tim's Sandwich Shop
-- It is tedious to specify data this way. Brute force SQL is OK for early testing. Production software should have data interfaces.
-- Load an order for an adhoc customer.

-- Load AdhocCustomer
INSERT INTO Customer (CustomerName, customerType) VALUES ('Jack Winter', 'AdhocCustomer');
INSERT INTO AdhocCustomer (adhocCustomerID)
SELECT customerID FROM Customer WHERE customerName = 'Jack Winter';


-- Load CustOrder
INSERT INTO CustOrder (customerID, locationID)
SELECT
       (SELECT customerID FROM Customer WHERE customerName = 'Jack Winter')
     , (SELECT locationID FROM Location WHERE phoneNumber = '555-9876')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load OrderItems: custom sandwich, garden salad, tea
INSERT INTO OrderItem (quantity, orderItemAmount, menuItemID, custOrderID)
SELECT 1
     , (SELECT listPriceAmount FROM ListPrice LP
                    INNER JOIN MenuItem MI ON MI.menuItemID = LP.menuItemID
                    INNER JOIN Discount D ON LP.discountID = D.discountID
        WHERE menuItemName = 'custom sandwich' AND menuItemSize = 'small' AND discountName = 'none')
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'custom sandwich' AND menuItemSize = 'small')
     , (SELECT MAX (custOrderID) FROM CustOrder)           -- most recent customer order
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO OrderItem_IngredientChoice (orderItemID, ingredientChoiceID)
SELECT
       (SELECT MAX (orderItemID) FROM OrderItem)           -- most recent order item
     , (SELECT ingredientChoiceID FROM IngredientChoice IC
                    INNER JOIN ItemIngredient II ON IC.itemIngredientID = II.itemIngredientID
                    INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
        WHERE menuItemName = 'custom sandwich' AND itemIngredientName = 'bread' AND ingredientChoiceName = 'white')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO OrderItem_IngredientChoice (orderItemID, ingredientChoiceID)
SELECT
       (SELECT MAX (orderItemID) FROM OrderItem)           -- most recent order item
     , (SELECT ingredientChoiceID FROM IngredientChoice IC
                    INNER JOIN ItemIngredient II ON IC.itemIngredientID = II.itemIngredientID
                    INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
        WHERE menuItemName = 'custom sandwich' AND itemIngredientName = 'cheese' AND ingredientChoiceName = 'swiss')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO OrderItem_IngredientChoice (orderItemID, ingredientChoiceID)
SELECT
       (SELECT MAX (orderItemID) FROM OrderItem)           -- most recent order item
     , (SELECT ingredientChoiceID FROM IngredientChoice IC
                    INNER JOIN ItemIngredient II ON IC.itemIngredientID = II.itemIngredientID
                    INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
        WHERE menuItemName = 'custom sandwich' AND itemIngredientName = 'meat' AND ingredientChoiceName = 'ham')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO OrderItem (quantity, orderItemAmount, menuItemID, custOrderID)
SELECT 1
     , (SELECT listPriceAmount FROM ListPrice LP
                    INNER JOIN MenuItem MI ON MI.menuItemID = LP.menuItemID
                    INNER JOIN Discount D ON LP.discountID = D.discountID
        WHERE menuItemName = 'garden salad' and discountName = 'none')
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'garden salad')
     , (SELECT MAX (custOrderID) FROM CustOrder)           -- most recent customer order
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO OrderItem (quantity, orderItemAmount, menuItemID, custOrderID)
SELECT 1
     , (SELECT listPriceAmount FROM ListPrice LP
                    INNER JOIN MenuItem MI ON MI.menuItemID = LP.menuItemID
                    INNER JOIN Discount D ON LP.discountID = D.discountID
        WHERE menuItemName = 'tea' and discountName = 'none')
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'tea')
     , (SELECT MAX (custOrderID) FROM CustOrder)           -- most recent customer order
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load payment data
INSERT INTO CreditCard (cardType, cardHolderName, cardNumber, expirationDate) VALUES ('VISA', 'Jonathan Swift', '2358-132134-55890', '07/31/18');

INSERT INTO Payment (paymentAmount, creditCardID, custOrderID)
SELECT 8.00
     , (SELECT MAX (creditCardID) FROM CreditCard)           -- most recent credit card
     , (SELECT MAX (custOrderID) FROM CustOrder)             -- most recent customer order
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

UPDATE CustOrder SET totalAmount = 8.00
WHERE custOrderID IN (SELECT MAX (custOrderID) FROM CustOrder);
