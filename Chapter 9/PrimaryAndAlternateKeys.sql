
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

CREATE TABLE [Address]
( 
	[addressData]        varchar(254)  NOT NULL ,
	[addressID]          bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[accountCustomerID]  bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([addressID] ASC)
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

CREATE TABLE [ListPrice]
( 
	[listPriceAmount]    money  NOT NULL ,
	[menuItemID]         bigint  NOT NULL ,
	[discountID]         bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([menuItemID] ASC,[discountID] ASC)
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

CREATE TABLE [OrderItem_IngredientChoice]
( 
	[orderItemID]        bigint  NOT NULL ,
	[ingredientChoiceID] bigint  NOT NULL ,
	 PRIMARY KEY  CLUSTERED ([orderItemID] ASC,[ingredientChoiceID] ASC)
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

CREATE TABLE [SandwichShop]
( 
	[sandwichShopName]   varchar(50)  NOT NULL ,
	[URL]                varchar(254)  NOT NULL ,
	[sandwichShopID]     bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	 PRIMARY KEY  CLUSTERED ([sandwichShopID] ASC),
	 UNIQUE ([sandwichShopName]  ASC)
)
go
