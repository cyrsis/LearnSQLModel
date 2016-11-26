-- Sample data for testing database for Tim's Sandwich Shop
-- It is tedious to specify data this way. Brute force SQL is OK for early testing. Production software should have data interfaces.

INSERT INTO Discount (discountName) VALUES ('none');
INSERT INTO Discount (discountName) VALUES ('senior');


-- Reuben sandwich, discount none
INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 3.00
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'reuben sandwich' AND menuItemSize = 'small')
     , (SELECT discountID FROM Discount WHERE discountName = 'none')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 5.00
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'reuben sandwich' AND menuItemSize = 'large')
     , (SELECT discountID FROM Discount WHERE discountName = 'none')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Reuben sandwich, discount senior
INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 2.85
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'reuben sandwich' AND menuItemSize = 'small')
     , (SELECT discountID FROM Discount WHERE discountName = 'senior')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 4.75
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'reuben sandwich' AND menuItemSize = 'large')
     , (SELECT discountID FROM Discount WHERE discountName = 'senior')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Custom sandwich
INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 3.00
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'custom sandwich' AND menuItemSize = 'small')
     , (SELECT discountID FROM Discount WHERE discountName = 'none')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 2.85
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'custom sandwich' AND menuItemSize = 'small')
     , (SELECT discountID FROM Discount WHERE discountName = 'senior')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Coffee
INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 1.00
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'coffee' AND menuItemSize = 'small')
     , (SELECT discountID FROM Discount WHERE discountName = 'none')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 1.00
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'coffee' AND menuItemSize = 'small')
     , (SELECT discountID FROM Discount WHERE discountName = 'senior')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Tea
INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 1.00
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'tea' AND menuItemSize = 'small')
     , (SELECT discountID FROM Discount WHERE discountName = 'none')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 1.00
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'tea' AND menuItemSize = 'small')
     , (SELECT discountID FROM Discount WHERE discountName = 'senior')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Salad, discount none
INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 4.00
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'garden salad' AND menuItemSize = 'medium')
     , (SELECT discountID FROM Discount WHERE discountName = 'none')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 4.00
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'chicken Caesars salad' AND menuItemSize = 'medium')
     , (SELECT discountID FROM Discount WHERE discountName = 'none')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Salad, discount senior
INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 3.80
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'garden salad' AND menuItemSize = 'medium')
     , (SELECT discountID FROM Discount WHERE discountName = 'senior')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO ListPrice (listPriceAmount, menuItemID, discountID)
SELECT 3.80
     , (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'chicken Caesars salad' AND menuItemSize = 'medium')
     , (SELECT discountID FROM Discount WHERE discountName = 'senior')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


INSERT INTO DeliveryType (deliveryTypeName) VALUES ('at table');
INSERT INTO DeliveryType (deliveryTypeName) VALUES ('at address');

