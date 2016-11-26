
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
