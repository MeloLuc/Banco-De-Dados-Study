-- Cap 4 - Examples of SQL Queries - SELECT
SELECT * FROM CUSTOMER;
SELECT CUSTOMER_ID, NAME FROM CUSTOMER;

SELECT * FROM PRODUCT;
-- We can perform calculations and add them to the query result.
SELECT
PRODUCT_ID,
DESCRIPTION,
PRICE,
round(PRICE * 1.07, 2) AS TAXED_PRICE --Here are the calculous and new column
FROM PRODUCT;

-- double pipe (||) - concatenation - Concat()
SELECT NAME,
CITY || ', ' || STATE AS LOCATION
FROM CUSTOMER;

SELECT NAME,
STREET_ADDRESS || ' ' || CITY || ', ' || STATE || ' ' || ZIP
AS SHIP_ADDRESS
FROM CUSTOMER;


