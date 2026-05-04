-- Insert synthetic data with missing values and duplicates into Staging_Superstore
INSERT INTO Staging_Superstore (RowID, OrderID, OrderDate, ShipDate, ShipMode, CustomerID, CustomerName, Segment, Country, City, State, PostalCode, Region, ProductID, Category, SubCategory, ProductName, Sales, Quantity, Discount, Profit)
VALUES
(5, NULL, '2016-12-01', '2016-12-05', 'Standard Class', 'AB-10015', 'Aaron Bergman', 'Consumer', 'United States', 'Arlington', 'Texas', '76017', 'South', 'OFF-PA-10001970', 'Office Supplies', 'Paper', 'Xerox 191', 15.98, 2, 0.00, 7.67),  -- Missing OrderID
(6, 'CA-2017-123456', NULL, '2017-05-10', 'Second Class', 'JD-12345', 'John Doe', 'Corporate', 'United States', 'Seattle', 'Washington', '98101', 'West', 'TEC-PH-10002275', 'Technology', 'Phones', 'Mitel 5320 IP Phone', 231.98, 3, 0.20, 34.80),  -- Missing OrderDate
(7, 'CA-2016-152156', '2016-11-08', '2016-11-11', 'Second Class', 'CG-12520', 'Claire Gute', 'Consumer', 'United States', 'Henderson', 'Kentucky', '42420', 'South', 'FUR-BO-10001798', 'Furniture', 'Bookcases', 'Bush Somerset Collection Bookcase', 261.96, 2, 0.00, 41.91);  -- Duplicate of RowID 1 (same OrderID, same data)

