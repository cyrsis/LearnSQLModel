-- Change VARCHAR(xxx) to TEXT(xxx).
-- Change ID-FK (foreign key attributes) to a data type of LONG.
-- Change ID-PKnotFK (non-FK primary key attributes) to a data type of COUNTER.
-- Change TIMESTAMP to DATETIME.
-- Change DECIMAL(19,4) to CURRENCY.
-- Change INTEGER to SINGLE.
-- Omit CONSTRAINT CHECK clauses.
-- Omit DEFAULT clauses.

CREATE TABLE Customer
(
	customerName         TEXT(50) NOT NULL,
	phoneNumber          TEXT(20) NULL,
	emailAddress         TEXT(50) NULL,
	customerID           COUNTER NOT NULL,
	customerType         TEXT(20) NOT NULL,
	PRIMARY KEY (customerID)
);

CREATE TABLE AccountCustomer
(
	accountNumber        TEXT(20) NOT NULL,
	encryptedPassword    TEXT(20) NOT NULL,
	preferredAddressID   LONG NULL,
	preferredCreditCardID LONG NULL,
	accountCustomerID    LONG NOT NULL,
	PRIMARY KEY (accountCustomerID)
);

CREATE TABLE Address
(
	addressData          TEXT(254) NOT NULL,
	addressID            COUNTER NOT NULL,
	accountCustomerID    LONG NULL,
	PRIMARY KEY (addressID)
);

CREATE TABLE AdhocCustomer
(
	adhocCustomerID      LONG NOT NULL,
	PRIMARY KEY (adhocCustomerID)
);

CREATE TABLE CreditCard
(
	cardType             TEXT(20) NOT NULL,
	cardHolderName       TEXT(50) NOT NULL,
	cardNumber           TEXT(20) NOT NULL,
	expirationDate       DATETIME NOT NULL,
	creditCardID         COUNTER NOT NULL,
	accountCustomerID    LONG NULL,
	PRIMARY KEY (creditCardID)
);

CREATE TABLE CustOrder
(
	orderDatetime        DATETIME NOT NULL,
	pickupDatetime       DATETIME NULL,
	totalAmount          CURRENCY NULL,
	specialInstructions  TEXT(254) NULL,
	custOrderID          COUNTER NOT NULL,
	customerID           LONG NOT NULL,
	addressID            LONG NULL,
	deliveryTypeID       LONG NULL,
	locationID           LONG NOT NULL,
	PRIMARY KEY (custOrderID)
);

CREATE TABLE Payment
(
	paymentAmount        CURRENCY NOT NULL,
	paymentID            COUNTER NOT NULL,
	custOrderID          LONG NOT NULL,
	creditCardID         LONG NOT NULL,
	PRIMARY KEY (paymentID)
);

CREATE TABLE DeliveryType
(
	deliveryTypeName     TEXT(50) NOT NULL,
	deliveryTypeID       COUNTER NOT NULL,
	PRIMARY KEY (deliveryTypeID)
);

CREATE TABLE Discount
(
	discountName         TEXT(50) NOT NULL,
	discountID           COUNTER NOT NULL,
	PRIMARY KEY (discountID)
);

CREATE TABLE IngredientChoice
(
	ingredientChoiceName TEXT(50) NOT NULL,
	ingredientChoiceID   COUNTER NOT NULL,
	itemIngredientID     LONG NOT NULL,
	PRIMARY KEY (ingredientChoiceID)
);

CREATE TABLE MenuItem
(
	menuItemType         TEXT(20) NOT NULL,
	menuItemName         TEXT(50) NOT NULL,
	menuItemSize         TEXT(10) NOT NULL,
	menuItemID           COUNTER NOT NULL,
	menuID               LONG NOT NULL,
	PRIMARY KEY (menuItemID)
);

CREATE TABLE ListPrice
(
	listPriceAmount      CURRENCY NOT NULL,
	menuItemID           LONG NOT NULL,
	discountID           LONG NOT NULL,
	PRIMARY KEY (menuItemID,discountID)
);

CREATE TABLE ItemIngredient
(
	itemIngredientName   TEXT(50) NOT NULL,
	itemIngredientID     COUNTER NOT NULL,
	menuItemID           LONG NOT NULL,
	PRIMARY KEY (itemIngredientID)
);

CREATE TABLE Location
(
	phoneNumber          TEXT(20) NOT NULL,
	locationID           COUNTER NOT NULL,
	sandwichShopID       LONG NOT NULL,
	addressID            LONG NOT NULL,
	menuID               LONG NOT NULL,
	PRIMARY KEY (locationID)
);

CREATE TABLE Menu
(
	menuName             TEXT(50) NOT NULL,
	menuID               COUNTER NOT NULL,
	PRIMARY KEY (menuID)
);

CREATE TABLE OrderItem
(
	quantity             SINGLE NOT NULL,
	orderItemAmount      CURRENCY NOT NULL,
	orderItemID          COUNTER NOT NULL,
	menuItemID           LONG NULL,
	custOrderID          LONG NOT NULL,
	orderItemName        TEXT(50) NULL,
	PRIMARY KEY (orderItemID)
);

CREATE TABLE OrderItem_IngredientChoice
(
	orderItemID          LONG NOT NULL,
	ingredientChoiceID   LONG NOT NULL,
	PRIMARY KEY (orderItemID,ingredientChoiceID)
);

CREATE TABLE SandwichShop
(
	sandwichShopName     TEXT(50) NOT NULL,
	URL                  TEXT(254) NOT NULL,
	sandwichShopID       COUNTER NOT NULL,
	PRIMARY KEY (sandwichShopID)
);

