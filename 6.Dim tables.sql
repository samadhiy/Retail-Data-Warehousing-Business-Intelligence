-- DimDate: Handles date-related attributes from Order Date and Ship Date
CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,  -- Surrogate key (e.g., YYYYMMDD as INT)
    FullDate DATE NOT NULL,
    Year SMALLINT NOT NULL,
    Quarter TINYINT NOT NULL,
    Month TINYINT NOT NULL,
    Day TINYINT NOT NULL,
    WeekDay TINYINT NOT NULL,
    MonthName VARCHAR(10) NOT NULL
);

-- DimCustomer: Customer details
CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    CustomerID VARCHAR(10) NOT NULL,
    CustomerName VARCHAR(50) NOT NULL,
    Segment VARCHAR(20) NOT NULL
);

-- DimProduct: Product details
CREATE TABLE DimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    ProductID VARCHAR(20) NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    SubCategory VARCHAR(50) NOT NULL
);