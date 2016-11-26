-- Sample data for testing database for Tim's Sandwich Shop
-- It is tedious to specify data this way. Brute force SQL is OK for early testing. Production software should have data interfaces.

-- Load data for small and large reuben sandwich
INSERT INTO MenuItem (menuItemType, menuItemName, menuItemSize, menuID)
SELECT 'sandwich', 'reuben sandwich', 'small', (SELECT menuID FROM Menu WHERE menuName = 'Fall Menu')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO MenuItem (menuItemType, menuItemName, menuItemSize, menuID)
SELECT 'sandwich', 'reuben sandwich', 'large', (SELECT menuID FROM Menu WHERE menuName = 'Fall Menu')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load data for small custom sandwich
INSERT INTO MenuItem (menuItemType, menuItemName, menuItemSize, menuID)
SELECT 'sandwich', 'custom sandwich', 'small', (SELECT menuID FROM Menu WHERE menuName = 'Fall Menu')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load data for small custom sandwich, bread
INSERT INTO ItemIngredient (itemIngredientName, menuItemID)
SELECT 'bread', (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'custom sandwich' AND menuItemSize = 'small')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO IngredientChoice (ingredientChoiceName, itemIngredientID)
SELECT 'white', (SELECT itemIngredientID FROM ItemIngredient II INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
                 WHERE MI.menuItemName = 'custom sandwich' and MI.menuItemSize = 'small' and II.itemIngredientName = 'bread')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO IngredientChoice (ingredientChoiceName, itemIngredientID)
SELECT 'wheat', (SELECT itemIngredientID FROM ItemIngredient II INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
                 WHERE MI.menuItemName = 'custom sandwich' and MI.menuItemSize = 'small' and II.itemIngredientName = 'bread')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO IngredientChoice (ingredientChoiceName, itemIngredientID)
SELECT 'rye', (SELECT itemIngredientID FROM ItemIngredient II INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
                 WHERE MI.menuItemName = 'custom sandwich' and MI.menuItemSize = 'small' and II.itemIngredientName = 'bread')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load data for small custom sandwich, cheese
INSERT INTO ItemIngredient (itemIngredientName, menuItemID)
SELECT 'cheese', (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'custom sandwich' AND menuItemSize = 'small')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO IngredientChoice (ingredientChoiceName, itemIngredientID)
SELECT 'swiss', (SELECT itemIngredientID FROM ItemIngredient II INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
                 WHERE MI.menuItemName = 'custom sandwich' and MI.menuItemSize = 'small' and II.itemIngredientName = 'cheese')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO IngredientChoice (ingredientChoiceName, itemIngredientID)
SELECT 'cheddar', (SELECT itemIngredientID FROM ItemIngredient II INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
                 WHERE MI.menuItemName = 'custom sandwich' and MI.menuItemSize = 'small' and II.itemIngredientName = 'cheese')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load data for small custom sandwich, meat
INSERT INTO ItemIngredient (itemIngredientName, menuItemID)
SELECT 'meat', (SELECT menuItemID FROM MenuItem WHERE menuItemName = 'custom sandwich' AND menuItemSize = 'small')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO IngredientChoice (ingredientChoiceName, itemIngredientID)
SELECT 'chicken', (SELECT itemIngredientID FROM ItemIngredient II INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
                 WHERE MI.menuItemName = 'custom sandwich' and MI.menuItemSize = 'small' and II.itemIngredientName = 'meat')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO IngredientChoice (ingredientChoiceName, itemIngredientID)
SELECT 'roast beef', (SELECT itemIngredientID FROM ItemIngredient II INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
                 WHERE MI.menuItemName = 'custom sandwich' and MI.menuItemSize = 'small' and II.itemIngredientName = 'meat')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO IngredientChoice (ingredientChoiceName, itemIngredientID)
SELECT 'ham', (SELECT itemIngredientID FROM ItemIngredient II INNER JOIN MenuItem MI ON II.menuItemID = MI.menuItemID
                 WHERE MI.menuItemName = 'custom sandwich' and MI.menuItemSize = 'small' and II.itemIngredientName = 'meat')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load data for beverage
INSERT INTO MenuItem (menuItemType, menuItemName, menuItemSize, menuID)
SELECT 'beverage', 'coffee', 'small', (SELECT menuID FROM Menu WHERE menuName = 'Fall Menu')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO MenuItem (menuItemType, menuItemName, menuItemSize, menuID)
SELECT 'beverage', 'tea', 'small', (SELECT menuID FROM Menu WHERE menuName = 'Fall Menu')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load data for salad
INSERT INTO MenuItem (menuItemType, menuItemName, menuItemSize, menuID)
SELECT 'salad', 'garden salad', 'medium', (SELECT menuID FROM Menu WHERE menuName = 'Fall Menu')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO MenuItem (menuItemType, menuItemName, menuItemSize, menuID)
SELECT 'salad', 'chicken Caesars salad', 'medium', (SELECT menuID FROM Menu WHERE menuName = 'Fall Menu')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.
