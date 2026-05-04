-- FactSales: Core sales metrics with foreign keys to dimensions
CREATE TABLE FactSales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    OrderID VARCHAR(20) NULL,
    CustomerKey INT NOT NULL FOREIGN KEY REFERENCES DimCustomer(CustomerKey),
    ProductKey INT NOT NULL FOREIGN KEY REFERENCES DimProduct(ProductKey),
    OrderDateKey INT NOT NULL FOREIGN KEY REFERENCES DimDate(DateKey),
    ShipDateKey INT NOT NULL FOREIGN KEY REFERENCES DimDate(DateKey),
    ShipMode VARCHAR(20) NOT NULL,
    Quantity INT NOT NULL,
    Sales DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(5,2) NOT NULL,
    Profit DECIMAL(10,2) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL,
    Region VARCHAR(10) NOT NULL,
    Country VARCHAR(50) NOT NULL
);