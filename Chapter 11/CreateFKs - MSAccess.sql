ALTER TABLE AccountCustomer
ADD CONSTRAINT R_2 FOREIGN KEY (preferredAddressID) REFERENCES Address (addressID);

ALTER TABLE AccountCustomer
ADD CONSTRAINT R_3 FOREIGN KEY (preferredCreditCardID) REFERENCES CreditCard (creditCardID);

ALTER TABLE AccountCustomer
ADD CONSTRAINT R_24 FOREIGN KEY (accountCustomerID) REFERENCES Customer (customerID);

ALTER TABLE Address
ADD CONSTRAINT R_4 FOREIGN KEY (accountCustomerID) REFERENCES AccountCustomer (accountCustomerID);

ALTER TABLE AdhocCustomer
ADD CONSTRAINT R_23 FOREIGN KEY (adhocCustomerID) REFERENCES Customer (customerID);

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
ADD CONSTRAINT R_8 FOREIGN KEY (custOrderID) REFERENCES CustOrder (custOrderID);

ALTER TABLE Payment
ADD CONSTRAINT R_25 FOREIGN KEY (creditCardID) REFERENCES CreditCard (creditCardID);

ALTER TABLE IngredientChoice
ADD CONSTRAINT R_16 FOREIGN KEY (itemIngredientID) REFERENCES ItemIngredient (itemIngredientID);

ALTER TABLE MenuItem
ADD CONSTRAINT R_18 FOREIGN KEY (menuID) REFERENCES Menu (menuID);

ALTER TABLE ListPrice
ADD CONSTRAINT R_19 FOREIGN KEY (menuItemID) REFERENCES MenuItem (menuItemID);

ALTER TABLE ListPrice
ADD CONSTRAINT R_20 FOREIGN KEY (discountID) REFERENCES Discount (discountID);

ALTER TABLE ItemIngredient
ADD CONSTRAINT R_17 FOREIGN KEY (menuItemID) REFERENCES MenuItem (menuItemID);

ALTER TABLE Location
ADD CONSTRAINT R_10 FOREIGN KEY (sandwichShopID) REFERENCES SandwichShop (sandwichShopID);

ALTER TABLE Location
ADD CONSTRAINT R_11 FOREIGN KEY (addressID) REFERENCES Address (addressID);

ALTER TABLE Location
ADD CONSTRAINT R_22 FOREIGN KEY (menuID) REFERENCES Menu (menuID);

ALTER TABLE OrderItem
ADD CONSTRAINT R_15 FOREIGN KEY (menuItemID) REFERENCES MenuItem (menuItemID);

ALTER TABLE OrderItem
ADD CONSTRAINT R_21 FOREIGN KEY (custOrderID) REFERENCES CustOrder (custOrderID);

ALTER TABLE OrderItem_IngredientChoice
ADD CONSTRAINT R_13 FOREIGN KEY (orderItemID) REFERENCES OrderItem (orderItemID);

ALTER TABLE OrderItem_IngredientChoice
ADD CONSTRAINT R_14 FOREIGN KEY (ingredientChoiceID) REFERENCES IngredientChoice (ingredientChoiceID);
