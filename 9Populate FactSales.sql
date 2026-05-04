-- Populate FactSales (join staging to dimensions, skip rows with missing keys/dates)
INSERT INTO FactSales (
    OrderID, CustomerKey, ProductKey, OrderDateKey, ShipDateKey, 
    ShipMode, Quantity, Sales, Discount, Profit, City, State, 
    PostalCode, Region, Country
)
SELECT
    s.OrderID,
    c.CustomerKey,
    p.ProductKey,
    CONVERT(INT, CONVERT(VARCHAR(8), s.OrderDate, 112)) AS OrderDateKey,
    CONVERT(INT, CONVERT(VARCHAR(8), s.ShipDate, 112)) AS ShipDateKey,
    s.ShipMode,
    s.Quantity,
    s.Sales,
    s.Discount,
    s.Profit,
    s.City,
    s.State,
    s.PostalCode,
    s.Region,
    s.Country
FROM Staging_Superstore s
INNER JOIN DimCustomer c 
    ON s.CustomerID = c.CustomerID 
   AND s.CustomerName = c.CustomerName 
   AND s.Segment = c.Segment
INNER JOIN DimProduct p 
    ON s.ProductID = p.ProductID 
   AND s.ProductName = p.ProductName 
   AND s.Category = p.Category 
   AND s.SubCategory = p.SubCategory
-- Filters to prevent NULL inserts
WHERE s.OrderID IS NOT NULL
  AND s.CustomerID IS NOT NULL
  AND s.ProductID IS NOT NULL
  AND s.OrderDate IS NOT NULL
  AND s.ShipDate IS NOT NULL;
