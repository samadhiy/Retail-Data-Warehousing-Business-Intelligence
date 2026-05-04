-- Create a cleaned staging table
CREATE TABLE Staging_Superstore_Cleaned (
    RowID INT,
    OrderID VARCHAR(20),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(20),
    CustomerID VARCHAR(10),
    CustomerName VARCHAR(50),
    Segment VARCHAR(20),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(10),
    Region VARCHAR(10),
    ProductID VARCHAR(20),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

-- Insert cleaned data: Remove rows with missing critical values and duplicates
INSERT INTO Staging_Superstore_Cleaned
SELECT DISTINCT
    RowID,
    OrderID,
    OrderDate,
    ShipDate,
    ShipMode,
    CustomerID,
    CustomerName,
    Segment,
    Country,
    City,
    State,
    PostalCode,
    Region,
    ProductID,
    Category,
    SubCategory,
    ProductName,
    Sales,
    Quantity,
    Discount,
    Profit
FROM (
    SELECT 
        RowID,
        OrderID,
        OrderDate,
        ShipDate,
        ShipMode,
        CustomerID,
        CustomerName,
        Segment,
        Country,
        City,
        State,
        PostalCode,
        Region,
        ProductID,
        Category,
        SubCategory,
        ProductName,
        Sales,
        Quantity,
        Discount,
        Profit,
        ROW_NUMBER() OVER (PARTITION BY OrderID, CustomerID, ProductID, OrderDate, ShipDate ORDER BY RowID) AS RN
    FROM Staging_Superstore
    WHERE OrderID IS NOT NULL 
        AND OrderDate IS NOT NULL 
        AND CustomerID IS NOT NULL 
        AND ProductID IS NOT NULL
) t
WHERE RN = 1;  -- Keep only the first occurrence of duplicates