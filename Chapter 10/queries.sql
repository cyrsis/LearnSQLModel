SELECT * FROM SandwichShop;
SELECT * FROM Location;
SELECT * FROM Location L
INNER JOIN Address A ON L.addressID = A.addressID;
SELECT * FROM Menu;

SELECT * FROM MenuItem;
SELECT * FROM ItemIngredient;
SELECT menuName, menuItemType, menuItemName, menuItemSize, itemIngredientName
FROM Menu M
INNER JOIN MenuItem MI ON M.menuID = MI.menuID
LEFT JOIN ItemIngredient II ON MI.menuItemID = II.menuItemID
ORDER BY menuName, menuItemType, menuItemName, menuItemSize, itemIngredientName;
SELECT menuName, menuItemType, menuItemName, menuItemSize, itemIngredientName, ingredientChoiceName
FROM Menu M
INNER JOIN MenuItem MI ON M.menuID = MI.menuID
LEFT JOIN ItemIngredient II ON MI.menuItemID = II.menuItemID
LEFT JOIN IngredientChoice IC ON II.itemIngredientID = IC.itemIngredientID
ORDER BY menuName, menuItemType, menuItemName, menuItemSize, itemIngredientName;

SELECT * FROM Discount;
SELECT menuItemType, menuItemName, menuItemSize, discountName, listPriceAmount
FROM ListPrice LP
INNER JOIN MenuItem MI ON LP.menuItemID = MI.menuItemID
INNER JOIN Discount D ON LP.discountID = D.discountID
ORDER BY menuItemType, menuItemName, menuItemSize, discountName;

SELECT * FROM CustOrder;
SELECT C.customerName, CO.orderDatetime, OI.orderItemName, MI.menuItemName, OI.quantity, OI.orderItemAmount
FROM CustOrder CO
INNER JOIN Customer C ON C.customerID = CO.customerID
INNER JOIN OrderItem OI ON CO.custOrderID = OI.custOrderID
LEFT JOIN MenuItem MI ON OI.menuItemID = MI.menuItemID
ORDER BY orderDatetime, orderItemName;