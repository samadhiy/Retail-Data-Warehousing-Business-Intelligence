BULK INSERT dbo.Superstore
FROM 'C:\Users\DESHANI\Documents\Superstore.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,          -- skips header row
    FIELDTERMINATOR = ',', -- CSV column separator
    ROWTERMINATOR = '\n',  -- line break
    TABLOCK
);
SELECT * FROM dbo.Superstore;
