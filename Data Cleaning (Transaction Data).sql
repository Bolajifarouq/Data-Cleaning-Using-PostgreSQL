-- Convert JoinDate in Customers table to YYYY-MM-DD
UPDATE Customers
SET JoinDate = TO_DATE(JoinDate, 'MM/DD/YYYY')::DATE;

-- Convert TransactionDate in Transactions table to YYYY-MM-DD
UPDATE Transactions
SET TransactionDate = TO_DATE(TransactionDate, 'MM/DD/YYYY')::DATE;

-- Identify rows with NULL values in Customers table
SELECT * 
FROM Customers
WHERE JoinDate IS NULL;

-- Identify rows with NULL values in Transactions table
SELECT * 
FROM Transactions
WHERE QuantitySold IS NULL OR TotalAmount IS NULL;

-- Example: Replace NULL values in QuantitySold and TotalAmount with 0
UPDATE Transactions
SET QuantitySold = COALESCE(QuantitySold, 0),
    TotalAmount = COALESCE(TotalAmount, 0);

-- Detect duplicate transactions
WITH DuplicateTransactions AS (
    SELECT 
        TransactionID, 
        ROW_NUMBER() OVER (PARTITION BY TransactionID ORDER BY TransactionDate) AS RowNum
    FROM Transactions
)
-- Remove duplicates (keeping the first instance)
DELETE FROM Transactions
WHERE TransactionID IN (
    SELECT TransactionID
    FROM DuplicateTransactions
    WHERE RowNum > 1
);

-- Find invalid ProductIDs in Transactions table
SELECT DISTINCT t.ProductID
FROM Transactions t
LEFT JOIN Products p ON t.ProductID = p.ProductID
WHERE p.ProductID IS NULL;

-- Replace negative values in QuantitySold and TotalAmount with 0
UPDATE Transactions
SET QuantitySold = CASE WHEN QuantitySold < 0 THEN 0 ELSE QuantitySold END,
    TotalAmount = CASE WHEN TotalAmount < 0 THEN 0 ELSE TotalAmount END;
