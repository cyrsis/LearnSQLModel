
CREATE TABLE [Customer]
( 
	[customerName]       varchar(50)  NOT NULL ,
	[phoneNumber]        varchar(20)  NULL ,
	[emailAddress]       varchar(50)  NULL ,
	[customerID]         int  NOT NULL ,
	[customerType]       varchar(20)  NOT NULL 
)
go

CREATE TABLE [AdhocCustomer]
( 
	[adhocCustomerID]    int  NOT NULL 
)
go

CREATE TABLE [AccountCustomer]
( 
	[accountNumber]      varchar(20)  NOT NULL ,
	[encryptedPassword]  varchar(20)  NOT NULL ,
	[preferredAddressID] int  NOT NULL ,
	[preferredCreditCardID] int  NOT NULL ,
	[accountCustomerID]  int  NOT NULL 
)
go

CREATE TABLE [Address]
( 
	[addressData]        varchar(254)  NOT NULL ,
	[addressID]          int  NOT NULL ,
	[accountCustomerID]  int  NOT NULL 
)
go

CREATE TABLE [CreditCard]
( 
	[cardType]           varchar(20)  NOT NULL ,
	[cardHolderName]     varchar(50)  NOT NULL ,
	[cardNumber]         varchar(20)  NOT NULL ,
	[expirationDate]     datetime  NOT NULL ,
	[creditCardID]       int  NOT NULL ,
	[paymentID]          int  NOT NULL ,
	[accountCustomerID]  int  NOT NULL 
)
go

CREATE TABLE [DeliveryType]
( 
	[deliveryTypeName]   varchar(50)  NOT NULL ,
	[deliveryTypeID]     int  NOT NULL 
)
go

CREATE TABLE [Discount]
( 
	[discountName]       varchar(50)  NOT NULL ,
	[discountID]         int  NOT NULL 
)
go

CREATE TABLE [IngredientChoice]
( 
	[ingredientChoiceName] varchar(50)  NOT NULL ,
	[ingredientChoiceID] int  NOT NULL ,
	[itemIngredientID]   int  NOT NULL 
)
go

CREATE TABLE [MenuItem]
( 
	[menuItemType]       varchar(20)  NOT NULL ,
	[menuItemName]       varchar(50)  NOT NULL ,
	[menuItemSize]       varchar(10)  NOT NULL ,
	[menuItemID]         int  NOT NULL ,
	[menuID]             int  NOT NULL 
)
go

CREATE TABLE [ListPrice]
( 
	[listPriceAmount]    money  NOT NULL ,
	[menuItemID]         int  NOT NULL ,
	[discountID]         int  NOT NULL 
)
go

CREATE TABLE [ItemIngredient]
( 
	[itemIngredientName] varchar(50)  NOT NULL ,
	[itemIngredientID]   int  NOT NULL ,
	[menuItemID]         int  NOT NULL 
)
go

CREATE TABLE [Location]
( 
	[phoneNumber]        varchar(20)  NOT NULL ,
	[locationID]         int  NOT NULL ,
	[sandwichShopID]     int  NOT NULL ,
	[addressID]          int  NOT NULL ,
	[menuID]             int  NOT NULL 
)
go

CREATE TABLE [Menu]
( 
	[menuName]           varchar(50)  NOT NULL ,
	[menuID]             int  NOT NULL 
)
go

CREATE TABLE [CustOrder]
( 
	[orderDatetime]      datetime  NOT NULL 
		 DEFAULT  getdate(),
	[pickupDatetime]     datetime  NULL ,
	[totalAmount]        money  NULL ,
	[specialInstructions] varchar(254)  NULL ,
	[custOrderID]        int  NOT NULL ,
	[customerID]         int  NOT NULL ,
	[addressID]          int  NULL ,
	[deliveryTypeID]     int  NULL ,
	[locationID]         int  NOT NULL 
)
go

CREATE TABLE [OrderItem]
( 
	[quantity]           integer  NOT NULL 
		 DEFAULT  1,
	[orderItemAmount]    money  NOT NULL ,
	[orderItemID]        int  NOT NULL ,
	[menuItemID]         int  NULL ,
	[custOrderID]        int  NOT NULL ,
	[orderItemName]      varchar(50)  NULL 
)
go

CREATE TABLE [OrderItem_IngredientChoice]
( 
	[orderItemID]        int  NOT NULL ,
	[ingredientChoiceID] int  NOT NULL 
)
go

CREATE TABLE [Payment]
( 
	[paymentAmount]      money  NOT NULL ,
	[paymentID]          int  NOT NULL ,
	[custOrderID]        int  NOT NULL 
)
go

CREATE TABLE [SandwichShop]
( 
	[sandwichShopName]   varchar(50)  NOT NULL ,
	[URL]                varchar(254)  NOT NULL ,
	[sandwichShopID]     int  NOT NULL 
)
go
