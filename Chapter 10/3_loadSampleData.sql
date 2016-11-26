-- Sample data for testing database for Tim's Sandwich Shop
-- It is tedious to specify data this way. Brute force SQL is OK for early testing. Production software should have data interfaces.

-- Load AccountCustomers
INSERT INTO Customer (CustomerName, customerType, phoneNumber) VALUES ('John Smith', 'AccountCustomer', '555-8642');
INSERT INTO AccountCustomer (accountNumber, encryptedPassword, accountCustomerID)
SELECT '123456789', 'pw123'
     , (SELECT customerID FROM Customer WHERE customerName = 'John Smith')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO Customer (CustomerName, customerType, phoneNumber) VALUES ('Jane Doe', 'AccountCustomer', '555-9753');
INSERT INTO AccountCustomer (accountNumber, encryptedPassword, accountCustomerID)
SELECT '234567890', 'pw234'
     , (SELECT customerID FROM Customer WHERE customerName = 'Jane Doe')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO Customer (CustomerName, customerType, phoneNumber) VALUES ('Moe Stooge', 'AccountCustomer', '555-0864');
INSERT INTO AccountCustomer (accountNumber, encryptedPassword, accountCustomerID)
SELECT '345678901', 'pw345'
     , (SELECT customerID FROM Customer WHERE customerName = 'Moe Stooge')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.


-- Load Addresses
INSERT INTO Address (addressData, accountCustomerID)
SELECT '235 Pecan Street  Anywhere, Colorado  80905 USA'
     , (SELECT customerID FROM Customer WHERE customerName = 'John Smith')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO Address (addressData, accountCustomerID)
SELECT '357 Oak Street  Somewhere, New Mexico  87501 USA'
     , (SELECT customerID FROM Customer WHERE customerName = 'John Smith')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO Address (addressData, accountCustomerID)
SELECT '5711 Elm Street  Anyplace, Colorado  80906 USA'
     , (SELECT customerID FROM Customer WHERE customerName = 'Jane Doe')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO Address (addressData, accountCustomerID)
SELECT '71113 Walnut Street  Someplace, New Mexico  87500 USA'
     , (SELECT customerID FROM Customer WHERE customerName = 'Moe Stooge')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

UPDATE AccountCustomer SET preferredAddressID = (SELECT addressID FROM Address WHERE addressData = '71113 Walnut Street  Someplace, New Mexico  87500 USA')
WHERE accountCustomerID IN (SELECT customerID FROM Customer WHERE customerName = 'Moe Stooge');


-- Load CreditCards
INSERT INTO CreditCard (cardType, cardHolderName, cardNumber, expirationDate, accountCustomerID)
SELECT 'American Express', 'John R Smith', '5555-444444-33333', '08/31/18'
     , (SELECT customerID FROM Customer WHERE customerName = 'John Smith')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO CreditCard (cardType, cardHolderName, cardNumber, expirationDate, accountCustomerID)
SELECT 'VISA', 'John R Smith', '6666-333222-11111', '12/31/17'
     , (SELECT customerID FROM Customer WHERE customerName = 'John Smith')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

INSERT INTO CreditCard (cardType, cardHolderName, cardNumber, expirationDate, accountCustomerID)
SELECT 'Mastercard', 'Jane S Doe', '2357-111317-19230', '12/31/18'
     , (SELECT customerID FROM Customer WHERE customerName = 'Jane Doe')
FROM SandwichShop;     -- The table name here is just a placeholder to satisfy SQL syntax.

UPDATE AccountCustomer SET preferredCreditCardID = (SELECT creditCardID FROM CreditCard WHERE cardNumber = '6666-333222-11111')
WHERE accountCustomerID IN (SELECT customerID FROM Customer WHERE customerName = 'John Smith');
