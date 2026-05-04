-- Populate DimCustomer (distinct customers)
INSERT INTO DimCustomer (CustomerID, CustomerName, Segment)
SELECT DISTINCT CustomerID, CustomerName, Segment
FROM Staging_Superstore;

-- Populate DimProduct (distinct products)
INSERT INTO DimProduct (ProductID, ProductName, Category, SubCategory)
SELECT DISTINCT ProductID, ProductName, Category, SubCategory
FROM Staging_Superstore;

-- Populate DimDate (unique dates from OrderDate and ShipDate, with derived attributes)
-- Populate DimDate (unique dates, ignoring NULLs)
INSERT INTO DimDate (DateKey, FullDate, Year, Quarter, Month, Day, WeekDay, MonthName)
SELECT DISTINCT
    CONVERT(INT, CONVERT(VARCHAR(8), OrderDate, 112)) AS DateKey,  
    OrderDate AS FullDate,
    YEAR(OrderDate),
    DATEPART(QUARTER, OrderDate),
    MONTH(OrderDate),
    DAY(OrderDate),
    DATEPART(WEEKDAY, OrderDate),
    DATENAME(MONTH, OrderDate)
FROM Staging_Superstore
WHERE OrderDate IS NOT NULL

UNION

SELECT DISTINCT
    CONVERT(INT, CONVERT(VARCHAR(8), ShipDate, 112)),
    ShipDate,
    YEAR(ShipDate),
    DATEPART(QUARTER, ShipDate),
    MONTH(ShipDate),
    DAY(ShipDate),
    DATEPART(WEEKDAY, ShipDate),
    DATENAME(MONTH, ShipDate)
FROM Staging_Superstore
WHERE ShipDate IS NOT NULL;
