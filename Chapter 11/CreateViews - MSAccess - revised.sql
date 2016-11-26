SELECT AC.adhocCustomerID, C.customerName, C.phoneNumber, C.emailAddress
FROM AdhocCustomer AC
INNER JOIN Customer C ON C.customerID = AC.adhocCustomerID
WHERE C.customerType = 'AdhocCustomer';


SELECT AC.accountCustomerID, C.customerName, C.phoneNumber, C.emailAddress, AC.accountNumber, AC.encryptedPassword, AC.preferredAddressID, AC.preferredCreditCardID
FROM AccountCustomer AC
INNER JOIN Customer C ON C.customerID = AC.accountCustomerID
WHERE C.customerType = 'AccountCustomer';
