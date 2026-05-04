DROP TABLE IF EXISTS dbo.Superstore;
Drop TABLE IF EXISTS Staging_Superstore;
DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql += 'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) 
    + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) 
    + ' DROP CONSTRAINT ' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.foreign_keys
WHERE referenced_object_id IN (
    OBJECT_ID('DimCustomer'),
    OBJECT_ID('DimProduct'),
    OBJECT_ID('DimRegion'),
    OBJECT_ID('DimDate')
);

EXEC sp_executesql @sql;

-- ===========================================
-- STEP 2: Drop Tables in Safe Order
-- ===========================================
IF OBJECT_ID('FactSales', 'U') IS NOT NULL
    DROP TABLE FactSales;

IF OBJECT_ID('DimRegion', 'U') IS NOT NULL
    DROP TABLE DimRegion;

IF OBJECT_ID('DimProduct', 'U') IS NOT NULL
    DROP TABLE DimProduct;

IF OBJECT_ID('DimCustomer', 'U') IS NOT NULL
    DROP TABLE DimCustomer;

IF OBJECT_ID('DimDate', 'U') IS NOT NULL
    DROP TABLE DimDate;

-- Now recreate your tables

SELECT * FROM sys.tables;
