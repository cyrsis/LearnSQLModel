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



CREATE INDEX XIF1Address ON Address
(
	accountCustomerID
);



CREATE UNIQUE INDEX XIF1AdhocCustomer ON AdhocCustomer
(
	adhocCustomerID
);



CREATE INDEX XIF2CreditCard ON CreditCard
(
	accountCustomerID
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



CREATE UNIQUE INDEX XIF1Payment ON Payment
(
	custOrderID
);

CREATE INDEX XIF2Payment ON Payment
(
	creditCardID
);



CREATE INDEX XIF1IngredientChoice ON IngredientChoice
(
	itemIngredientID
);



CREATE INDEX XIF1MenuItem ON MenuItem
(
	menuID
);



CREATE INDEX XIF1ListPrice ON ListPrice
(
	menuItemID
);

CREATE INDEX XIF2ListPrice ON ListPrice
(
	discountID
);



CREATE INDEX XIF1ItemIngredient ON ItemIngredient
(
	menuItemID
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



CREATE INDEX XIF1OrderItem ON OrderItem
(
	menuItemID
);

CREATE INDEX XIF2OrderItem ON OrderItem
(
	custOrderID
);



CREATE INDEX XIF1OrderItem_IngredientChoice ON OrderItem_IngredientChoice
(
	orderItemID
);

CREATE INDEX XIF2OrderItem_IngredientChoice ON OrderItem_IngredientChoice
(
	ingredientChoiceID
);
