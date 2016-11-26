-- Sample data for testing database for Tim's Sandwich Shop
-- It is tedious to specify data this way. Brute force SQL is OK for early testing. Production software should have data interfaces.

-- There's a single sandwich shop record -- Tim's sandwich shop.
INSERT INTO SandwichShop (sandwichShopName,  URL)
VALUES ('Tim''s Sandwich Shop', 'www.TimsSandwichShop.com');


-- Load data for a single menu.
INSERT INTO Menu (menuName)
VALUES ('Fall Menu');


-- Load data for one sandwich shop location,
INSERT INTO Address (addressData)
VALUES ('123 Main Street  Anywhere, Colorado  80905 USA');

INSERT INTO Location (phoneNumber, sandwichShopID, addressID, menuID)
SELECT '555-9876'
     , (SELECT sandwichShopID FROM SandwichShop WHERE sandwichShopName = 'Tim''s Sandwich Shop')
     , (SELECT addressID FROM Address WHERE addressData = '123 Main Street  Anywhere, Colorado  80905 USA')
     , (SELECT menuID FROM Menu WHERE menuName = 'Fall Menu')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load data for another sandwich shop location.
INSERT INTO Address (addressData)
VALUES ('456 State Street  Somewhere, New Mexico  87501 USA');

INSERT INTO Location (phoneNumber, sandwichShopID, addressID, menuID)
SELECT '555-2345'
     , (SELECT sandwichShopID FROM SandwichShop WHERE sandwichShopName = 'Tim''s Sandwich Shop')
     , (SELECT addressID FROM Address WHERE addressData = '456 State Street  Somewhere, New Mexico  87501 USA')
     , (SELECT menuID FROM Menu WHERE menuName = 'Fall Menu')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.
