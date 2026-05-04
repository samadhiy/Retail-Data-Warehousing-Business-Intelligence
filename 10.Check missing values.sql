-- Check for missing values in critical columns
SELECT RowID, OrderID, OrderDate, CustomerID, ProductID
FROM Staging_Superstore
WHERE OrderID IS NULL OR OrderDate IS NULL OR CustomerID IS NULL OR ProductID IS NULL;

-- Check for duplicates based on RowID (should be unique)
SELECT RowID, COUNT(*) AS DuplicateCount
FROM Staging_Superstore
GROUP BY RowID
HAVING COUNT(*) > 1;

-- Check for duplicates based on OrderID and key attributes (indicating same transaction)
SELECT OrderID, CustomerID, ProductID, OrderDate, ShipDate, COUNT(*) AS DuplicateCount
FROM Staging_Superstore
GROUP BY OrderID, CustomerID, ProductID, OrderDate, ShipDate
HAVING COUNT(*) > 1;