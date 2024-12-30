**Data Cleaning with PostgreSQL: Enhancing Data Quality for Analysis**
As part of my hands-on experience with data cleaning, I tackled common data quality issues in a transactional dataset using PostgreSQL. Below is an overview of the tasks and solutions implemented to ensure the data was ready for analysis:

**1. Standardizing Inconsistent Date Formats**
The dataset contained inconsistent date formats, such as MM/DD/YYYY, which were standardized to the ISO format YYYY-MM-DD.
SQL Solution: Used TO_DATE and UPDATE to reformat dates in the JoinDate and TransactionDate columns.

**2. Handling Missing Values (NULLs)**
Missing values can skew analysis and reporting. 
I:
Identified rows with NULL values in key columns.
Imputed missing values in numerical fields (e.g., QuantitySold, TotalAmount) with default values (0) using COALESCE.

**3. Removing Duplicate Transactions**
Duplicate rows in the Transactions table were detected and removed to ensure data integrity.
SQL Solution: Utilized ROW_NUMBER in a Common Table Expression (CTE) to identify and delete duplicates.

**4. Validating Foreign Key Relationships**
Invalid entries in the ProductID column were identified by comparing them against the Products table.
SQL Solution: A LEFT JOIN was employed to isolate mismatches.

**5. Replacing Invalid Values**
Negative values in columns such as QuantitySold and TotalAmount were rectified by replacing them with 0 using a CASE statement.

**Key Achievements**
Improved Data Consistency: Ensured dates followed a uniform format, enabling seamless integration with BI tools.
Enhanced Data Integrity: Removed duplicates and validated foreign keys to maintain accuracy.
Prepared Data for Analysis: Addressed outliers and missing values, ensuring reliable insights.

SQL Skills Highlighted:
UPDATE, CASE, and COALESCE for data manipulation
LEFT JOIN for validation
ROW_NUMBER and CTEs for handling duplicates

This project reflects my ability to diagnose and resolve real-world data quality issues efficiently, leveraging PostgreSQL to deliver clean and reliable datasets.
