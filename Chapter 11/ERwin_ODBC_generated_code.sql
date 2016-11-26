
CREATE TABLE Customer
(
	customerName         VARCHAR(50) NOT NULL,
	phoneNumber          VARCHAR(20) NULL,
	emailAddress         VARCHAR(50) NULL,
	customerID           BIGINT NOT NULL,
	customerType         VARCHAR(20) NOT NULL CONSTRAINT customerType CHECK ( customerType IN ('AdhocCustomer', 'AccountCustomer') ),
	PRIMARY KEY (customerID)
);

CREATE TABLE AccountCustomer
(
	accountNumber        VARCHAR(20) NOT NULL,
	encryptedPassword    VARCHAR(20) NOT NULL,
	preferredAddressID   BIGINT NULL,
	preferredCreditCardID BIGINT NULL,
	accountCustomerID    BIGINT NOT NULL,
	PRIMARY KEY (accountCustomerID)
);

CREATE INDEX XIF1AccountCustomer ON AccountCustomer
(
	preferredAddressID
);

CREATE INDEX XIF2AccountCustomer ON AccountCustomer
(
	preferredCreditCardID
);

CREATE UNIQUE INDEX XIF3AccountCustomer ON AccountCustomer
(
	accountCustomerID
);

CREATE TABLE Address
(
	addressData          VARCHAR(254) NOT NULL,
	addressID            BIGINT NOT NULL,
	accountCustomerID    BIGINT NOT NULL,
	PRIMARY KEY (addressID)
);

CREATE INDEX XIF1Address ON Address
(
	accountCustomerID
);

CREATE TABLE AdhocCustomer
(
	adhocCustomerID      BIGINT NOT NULL,
	PRIMARY KEY (adhocCustomerID)
);

CREATE UNIQUE INDEX XIF1AdhocCustomer ON AdhocCustomer
(
	adhocCustomerID
);

CREATE TABLE CreditCard
(
	cardType             VARCHAR(20) NOT NULL CONSTRAINT cardType CHECK ( cardType IN ('VISA', 'Mastercard', 'American Express', 'Discover') ),
	cardHolderName       VARCHAR(50) NOT NULL,
	cardNumber           VARCHAR(20) NOT NULL,
	expirationDate       TIMESTAMP NOT NULL CONSTRAINT expirationDate CHECK ( expirationDate > getDate() ),
	creditCardID         BIGINT NOT NULL,
	accountCustomerID    BIGINT NULL,
	PRIMARY KEY (creditCardID)
);

CREATE INDEX XIF2CreditCard ON CreditCard
(
	accountCustomerID
);

CREATE TABLE CustOrder
(
	orderDatetime        TIMESTAMP NOT NULL DEFAULT getdate(),
	pickupDatetime       TIMESTAMP NULL CONSTRAINT pickupDatetime CHECK ( pickupDatetime > getDate() OR pickupDatetime IS NULL ),
	totalAmount          DECIMAL(19,4) NULL,
	specialInstructions  VARCHAR(254) NULL,
	custOrderID          BIGINT NOT NULL,
	customerID           BIGINT NOT NULL,
	addressID            BIGINT NULL,
	deliveryTypeID       BIGINT NULL,
	locationID           BIGINT NOT NULL,
	PRIMARY KEY (custOrderID)
);

CREATE INDEX XIF1CustOrder ON CustOrder
(
	customerID
);

CREATE INDEX XIF2CustOrder ON CustOrder
(
	addressID
);

CREATE INDEX XIF3CustOrder ON CustOrder
(
	deliveryTypeID
);

CREATE INDEX XIF4CustOrder ON CustOrder
(
	locationID
);

CREATE TABLE Payment
(
	paymentAmount        DECIMAL(19,4) NOT NULL,
	paymentID            BIGINT NOT NULL,
	custOrderID          BIGINT NOT NULL,
	creditCardID         BIGINT NOT NULL,
	PRIMARY KEY (paymentID)
);

CREATE UNIQUE INDEX XIF1Payment ON Payment
(
	custOrderID
);

CREATE INDEX XIF2Payment ON Payment
(
	creditCardID
);

CREATE TABLE DeliveryType
(
	deliveryTypeName     VARCHAR(50) NOT NULL,
	deliveryTypeID       BIGINT NOT NULL,
	PRIMARY KEY (deliveryTypeID)
);

CREATE TABLE Discount
(
	discountName         VARCHAR(50) NOT NULL,
	discountID           BIGINT NOT NULL,
	PRIMARY KEY (discountID)
);

CREATE TABLE IngredientChoice
(
	ingredientChoiceName VARCHAR(50) NOT NULL,
	ingredientChoiceID   BIGINT NOT NULL,
	itemIngredientID     BIGINT NOT NULL,
	PRIMARY KEY (ingredientChoiceID)
);

CREATE INDEX XIF1IngredientChoice ON IngredientChoice
(
	itemIngredientID
);

CREATE TABLE MenuItem
(
	menuItemType         VARCHAR(20) NOT NULL CONSTRAINT menuItemType CHECK ( menuItemType IN ('beverage', 'salad', 'soup', 'sandwich') ),
	menuItemName         VARCHAR(50) NOT NULL,
	menuItemSize         VARCHAR(10) NOT NULL CONSTRAINT menuItemSize CHECK ( menuItemSize IN ('small',  'medium',  'large',  'x-large') ),
	menuItemID           BIGINT NOT NULL,
	menuID               BIGINT NOT NULL,
	PRIMARY KEY (menuItemID)
);

CREATE INDEX XIF1MenuItem ON MenuItem
(
	menuID
);

CREATE TABLE ListPrice
(
	listPriceAmount      DECIMAL(19,4) NOT NULL,
	menuItemID           BIGINT NOT NULL,
	discountID           BIGINT NOT NULL,
	PRIMARY KEY (menuItemID,discountID)
);

CREATE INDEX XIF1ListPrice ON ListPrice
(
	menuItemID
);

CREATE INDEX XIF2ListPrice ON ListPrice
(
	discountID
);

CREATE TABLE ItemIngredient
(
	itemIngredientName   VARCHAR(50) NOT NULL,
	itemIngredientID     BIGINT NOT NULL,
	menuItemID           BIGINT NOT NULL,
	PRIMARY KEY (itemIngredientID)
);

CREATE INDEX XIF1ItemIngredient ON ItemIngredient
(
	menuItemID
);

CREATE TABLE Location
(
	phoneNumber          VARCHAR(20) NOT NULL,
	locationID           BIGINT NOT NULL,
	sandwichShopID       BIGINT NOT NULL,
	addressID            BIGINT NOT NULL,
	menuID               BIGINT NOT NULL,
	PRIMARY KEY (locationID)
);

CREATE INDEX XIF1Location ON Location
(
	sandwichShopID
);

CREATE UNIQUE INDEX XIF2Location ON Location
(
	addressID
);

CREATE INDEX XIF3Location ON Location
(
	menuID
);

CREATE TABLE Menu
(
	menuName             VARCHAR(50) NOT NULL,
	menuID               BIGINT NOT NULL,
	PRIMARY KEY (menuID)
);

CREATE TABLE OrderItem
(
	quantity             INTEGER NOT NULL DEFAULT 1 CONSTRAINT quantity CHECK ( quantity >= 1 ),
	orderItemAmount      DECIMAL(19,4) NOT NULL,
	orderItemID          BIGINT NOT NULL,
	menuItemID           BIGINT NULL,
	custOrderID          BIGINT NOT NULL,
	orderItemName        VARCHAR(50) NULL,
	PRIMARY KEY (orderItemID),
	CONSTRAINT Validation_Rule_478_1282429528 CHECK ( (orderItemName IS NULL AND menuItemID IS NOT NULL) OR
(orderItemName IS NOT NULL AND menuItemID IS NULL) )
);

CREATE INDEX XIF1OrderItem ON OrderItem
(
	menuItemID
);

CREATE INDEX XIF2OrderItem ON OrderItem
(
	custOrderID
);

CREATE TABLE OrderItem_IngredientChoice
(
	orderItemID          BIGINT NOT NULL,
	ingredientChoiceID   BIGINT NOT NULL,
	PRIMARY KEY (orderItemID,ingredientChoiceID)
);

CREATE INDEX XIF1OrderItem_IngredientChoice ON OrderItem_IngredientChoice
(
	orderItemID
);

CREATE INDEX XIF2OrderItem_IngredientChoice ON OrderItem_IngredientChoice
(
	ingredientChoiceID
);

CREATE TABLE SandwichShop
(
	sandwichShopName     VARCHAR(50) NOT NULL,
	URL                  VARCHAR(254) NOT NULL,
	sandwichShopID       BIGINT NOT NULL,
	PRIMARY KEY (sandwichShopID)
);

CREATE VIEW AdhocCustComplete ( adhocCustomerID,customerName,phoneNumber,emailAddress ) AS 
	SELECT AdhocCustomer.adhocCustomerID,Customer.customerName,Customer.phoneNumber,Customer.emailAddress
		FROM AdhocCustomer,Customer
		WHERE Customer.customerID =  AdhocCustomer.adhocCustomerID AND
Customer.customerType = 'AdhocCustomer';

CREATE VIEW AccountCustComplete ( accountCustomerID,customerName,phoneNumber,emailAddress,accountNumber,encryptedPassword,preferredAddressID,preferredCreditCardID ) AS 
	SELECT AccountCustomer.accountCustomerID,Customer.customerName,Customer.phoneNumber,Customer.emailAddress,AccountCustomer.accountNumber,AccountCustomer.encryptedPassword,AccountCustomer.preferredAddressID,AccountCustomer.preferredCreditCardID
		FROM AccountCustomer,Customer
		WHERE Customer.customerID =  AccountCustomer.accountCustomerID AND
Customer.customerType = 'AccountCustomer';

ALTER TABLE AccountCustomer
ADD CONSTRAINT R_2 FOREIGN KEY (preferredAddressID) REFERENCES Address (addressID);

ALTER TABLE AccountCustomer
ADD CONSTRAINT R_3 FOREIGN KEY (preferredCreditCardID) REFERENCES CreditCard (creditCardID);

ALTER TABLE AccountCustomer
ADD CONSTRAINT R_24 FOREIGN KEY (accountCustomerID) REFERENCES Customer (customerID)
		ON DELETE CASCADE;

ALTER TABLE Address
ADD CONSTRAINT R_4 FOREIGN KEY (accountCustomerID) REFERENCES AccountCustomer (accountCustomerID);

ALTER TABLE AdhocCustomer
ADD CONSTRAINT R_23 FOREIGN KEY (adhocCustomerID) REFERENCES Customer (customerID)
		ON DELETE CASCADE;

ALTER TABLE CreditCard
ADD CONSTRAINT R_5 FOREIGN KEY (accountCustomerID) REFERENCES AccountCustomer (accountCustomerID);

ALTER TABLE CustOrder
ADD CONSTRAINT R_1 FOREIGN KEY (customerID) REFERENCES Customer (customerID);

ALTER TABLE CustOrder
ADD CONSTRAINT R_6 FOREIGN KEY (addressID) REFERENCES Address (addressID);

ALTER TABLE CustOrder
ADD CONSTRAINT R_7 FOREIGN KEY (deliveryTypeID) REFERENCES DeliveryType (deliveryTypeID);

ALTER TABLE CustOrder
ADD CONSTRAINT R_9 FOREIGN KEY (locationID) REFERENCES Location (locationID);

ALTER TABLE Payment
ADD CONSTRAINT R_8 FOREIGN KEY (custOrderID) REFERENCES CustOrder (custOrderID)
		ON DELETE CASCADE;

ALTER TABLE Payment
ADD CONSTRAINT R_25 FOREIGN KEY (creditCardID) REFERENCES CreditCard (creditCardID);

ALTER TABLE IngredientChoice
ADD CONSTRAINT R_16 FOREIGN KEY (itemIngredientID) REFERENCES ItemIngredient (itemIngredientID)
		ON DELETE CASCADE;

ALTER TABLE MenuItem
ADD CONSTRAINT R_18 FOREIGN KEY (menuID) REFERENCES Menu (menuID)
		ON DELETE CASCADE;

ALTER TABLE ListPrice
ADD CONSTRAINT R_19 FOREIGN KEY (menuItemID) REFERENCES MenuItem (menuItemID)
		ON DELETE CASCADE;

ALTER TABLE ListPrice
ADD CONSTRAINT R_20 FOREIGN KEY (discountID) REFERENCES Discount (discountID);

ALTER TABLE ItemIngredient
ADD CONSTRAINT R_17 FOREIGN KEY (menuItemID) REFERENCES MenuItem (menuItemID)
		ON DELETE CASCADE;

ALTER TABLE Location
ADD CONSTRAINT R_10 FOREIGN KEY (sandwichShopID) REFERENCES SandwichShop (sandwichShopID);

ALTER TABLE Location
ADD CONSTRAINT R_11 FOREIGN KEY (addressID) REFERENCES Address (addressID);

ALTER TABLE Location
ADD CONSTRAINT R_22 FOREIGN KEY (menuID) REFERENCES Menu (menuID);

ALTER TABLE OrderItem
ADD CONSTRAINT R_15 FOREIGN KEY (menuItemID) REFERENCES MenuItem (menuItemID);

ALTER TABLE OrderItem
ADD CONSTRAINT R_21 FOREIGN KEY (custOrderID) REFERENCES CustOrder (custOrderID)
		ON DELETE CASCADE;

ALTER TABLE OrderItem_IngredientChoice
ADD CONSTRAINT R_13 FOREIGN KEY (orderItemID) REFERENCES OrderItem (orderItemID)
		ON DELETE CASCADE;

ALTER TABLE OrderItem_IngredientChoice
ADD CONSTRAINT R_14 FOREIGN KEY (ingredientChoiceID) REFERENCES IngredientChoice (ingredientChoiceID);
