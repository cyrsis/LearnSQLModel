
CREATE TABLE [Customer]
( 
	[customerName]       varchar(50)  NOT NULL ,
	[phoneNumber]        varchar(20)  NULL ,
	[emailAddress]       varchar(50)  NULL ,
	[customerID]         bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[customerType]       varchar(20)  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([customerID] ASC)
)
go

CREATE TABLE [AdhocCustomer]
( 
	[adhocCustomerID]    bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([adhocCustomerID] ASC)
)
go

CREATE UNIQUE NONCLUSTERED INDEX [XIF1AdhocCustomer] ON [AdhocCustomer]
( 
	[adhocCustomerID]     ASC
)
go

CREATE TABLE [AccountCustomer]
( 
	[accountNumber]      varchar(20)  NOT NULL ,
	[encryptedPassword]  varchar(20)  NOT NULL ,
	[preferredAddressID] bigint  NOT NULL ,
	[preferredCreditCardID] bigint  NOT NULL ,
	[accountCustomerID]  bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([accountCustomerID] ASC),
	 UNIQUE ([accountNumber]  ASC)
)
go

CREATE UNIQUE NONCLUSTERED INDEX [XIF1AccountCustomer] ON [AccountCustomer]
( 
	[preferredAddressID]  ASC
)
go

CREATE UNIQUE NONCLUSTERED INDEX [XIF2AccountCustomer] ON [AccountCustomer]
( 
	[preferredCreditCardID]  ASC
)
go

CREATE UNIQUE NONCLUSTERED INDEX [XIF3AccountCustomer] ON [AccountCustomer]
( 
	[accountCustomerID]   ASC
)
go

CREATE TABLE [Address]
( 
	[addressData]        varchar(254)  NOT NULL ,
	[addressID]          bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[accountCustomerID]  bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([addressID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1Address] ON [Address]
( 
	[accountCustomerID]   ASC
)
go

CREATE TABLE [CreditCard]
( 
	[cardType]           varchar(20)  NOT NULL ,
	[cardHolderName]     varchar(50)  NOT NULL ,
	[cardNumber]         varchar(20)  NOT NULL ,
	[expirationDate]     datetime  NOT NULL ,
	[creditCardID]       bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[paymentID]          bigint  NOT NULL ,
	[accountCustomerID]  bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([creditCardID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1CreditCard] ON [CreditCard]
( 
	[paymentID]           ASC
)
go

CREATE NONCLUSTERED INDEX [XIF2CreditCard] ON [CreditCard]
( 
	[accountCustomerID]   ASC
)
go

CREATE TABLE [DeliveryType]
( 
	[deliveryTypeName]   varchar(50)  NOT NULL ,
	[deliveryTypeID]     bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	 PRIMARY KEY  CLUSTERED ([deliveryTypeID] ASC),
	 UNIQUE ([deliveryTypeName]  ASC)
)
go

CREATE TABLE [Discount]
( 
	[discountName]       varchar(50)  NOT NULL ,
	[discountID]         bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	 PRIMARY KEY  CLUSTERED ([discountID] ASC),
	 UNIQUE ([discountName]  ASC)
)
go

CREATE TABLE [IngredientChoice]
( 
	[ingredientChoiceName] varchar(50)  NOT NULL ,
	[ingredientChoiceID] bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[itemIngredientID]   bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([ingredientChoiceID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1IngredientChoice] ON [IngredientChoice]
( 
	[itemIngredientID]    ASC
)
go

CREATE TABLE [MenuItem]
( 
	[menuItemType]       varchar(20)  NOT NULL ,
	[menuItemName]       varchar(50)  NOT NULL ,
	[menuItemSize]       varchar(10)  NOT NULL ,
	[menuItemID]         bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[menuID]             bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([menuItemID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1MenuItem] ON [MenuItem]
( 
	[menuID]              ASC
)
go

CREATE TABLE [ListPrice]
( 
	[listPriceAmount]    money  NOT NULL ,
	[menuItemID]         bigint  NOT NULL ,
	[discountID]         bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([menuItemID] ASC,[discountID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1ListPrice] ON [ListPrice]
( 
	[menuItemID]          ASC
)
go

CREATE NONCLUSTERED INDEX [XIF2ListPrice] ON [ListPrice]
( 
	[discountID]          ASC
)
go

CREATE TABLE [ItemIngredient]
( 
	[itemIngredientName] varchar(50)  NOT NULL ,
	[itemIngredientID]   bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[menuItemID]         bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([itemIngredientID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1ItemIngredient] ON [ItemIngredient]
( 
	[menuItemID]          ASC
)
go

CREATE TABLE [Location]
( 
	[phoneNumber]        varchar(20)  NOT NULL ,
	[locationID]         bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[sandwichShopID]     bigint  NOT NULL ,
	[addressID]          bigint  NOT NULL ,
	[menuID]             bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([locationID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1Location] ON [Location]
( 
	[sandwichShopID]      ASC
)
go

CREATE UNIQUE NONCLUSTERED INDEX [XIF2Location] ON [Location]
( 
	[addressID]           ASC
)
go

CREATE NONCLUSTERED INDEX [XIF3Location] ON [Location]
( 
	[menuID]              ASC
)
go

CREATE TABLE [Menu]
( 
	[menuName]           varchar(50)  NOT NULL ,
	[menuID]             bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	 PRIMARY KEY  CLUSTERED ([menuID] ASC),
	 UNIQUE ([menuName]  ASC)
)
go

CREATE TABLE [CustOrder]
( 
	[orderDatetime]      datetime  NOT NULL 
		 DEFAULT  getdate(),
	[pickupDatetime]     datetime  NULL ,
	[totalAmount]        money  NULL ,
	[specialInstructions] varchar(254)  NULL ,
	[custOrderID]        bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[customerID]         bigint  NOT NULL ,
	[addressID]          bigint  NULL ,
	[deliveryTypeID]     bigint  NULL ,
	[locationID]         bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([custOrderID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1CustOrder] ON [CustOrder]
( 
	[customerID]          ASC
)
go

CREATE NONCLUSTERED INDEX [XIF2CustOrder] ON [CustOrder]
( 
	[addressID]           ASC
)
go

CREATE NONCLUSTERED INDEX [XIF3CustOrder] ON [CustOrder]
( 
	[deliveryTypeID]      ASC
)
go

CREATE NONCLUSTERED INDEX [XIF4CustOrder] ON [CustOrder]
( 
	[locationID]          ASC
)
go

CREATE TABLE [OrderItem]
( 
	[quantity]           integer  NOT NULL 
		 DEFAULT  1,
	[orderItemAmount]    money  NOT NULL ,
	[orderItemID]        bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[menuItemID]         bigint  NULL ,
	[custOrderID]        bigint  NOT NULL ,
	[orderItemName]      varchar(50)  NULL ,
	 PRIMARY KEY  CLUSTERED ([orderItemID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1OrderItem] ON [OrderItem]
( 
	[menuItemID]          ASC
)
go

CREATE NONCLUSTERED INDEX [XIF2OrderItem] ON [OrderItem]
( 
	[custOrderID]         ASC
)
go

CREATE TABLE [OrderItem_IngredientChoice]
( 
	[orderItemID]        bigint  NOT NULL ,
	[ingredientChoiceID] bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([orderItemID] ASC,[ingredientChoiceID] ASC)
)
go

CREATE NONCLUSTERED INDEX [XIF1OrderItem_IngredientChoice] ON [OrderItem_IngredientChoice]
( 
	[orderItemID]         ASC
)
go

CREATE NONCLUSTERED INDEX [XIF2OrderItem_IngredientChoice] ON [OrderItem_IngredientChoice]
( 
	[ingredientChoiceID]  ASC
)
go

CREATE TABLE [Payment]
( 
	[paymentAmount]      money  NOT NULL ,
	[paymentID]          bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[custOrderID]        bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([paymentID] ASC)
)
go

CREATE UNIQUE NONCLUSTERED INDEX [XIF1Payment] ON [Payment]
( 
	[custOrderID]         ASC
)
go

CREATE TABLE [SandwichShop]
( 
	[sandwichShopName]   varchar(50)  NOT NULL ,
	[URL]                varchar(254)  NOT NULL ,
	[sandwichShopID]     bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	 PRIMARY KEY  CLUSTERED ([sandwichShopID] ASC),
	 UNIQUE ([sandwichShopName]  ASC)
)
go
