-- Primary Analysis


-- Counting the number of warehouses
SELECT * 
FROM mintclassics.warehouses;

-- Counting the number of unique products sold by the company
SELECT COUNT(DISTINCT productCode)
FROM mintclassics.products
WHERE productCode IS NOT NULL;
# It was seen that there are 110 distinct values of Product Code.

-- Counting the number of product lines
SELECT * 
FROM mintclassics.productlines;
# There are 7 product lines sold by the company



-- Counting the number of warehouses in which each product is stored
SELECT 
productCode, 
warehouseCode,
  COUNT(warehouseCode) AS warehouse
FROM mintclassics.products
GROUP BY productCode;
-- It is seen that each unique product is stored in a single warehouse

-- Counting the number of products in each warehouse  
SELECT 
  warehouseCode, SUM(quantityInStock) AS Total_Quantity, 
  COUNT(productCode) AS types_of_products
FROM mintclassics.products
GROUP BY warehouseCode;
-- It is seen that warehouse b has the highest types products i.e 38
-- Highest number of products is also in b, lowest is d, second lowest is c

-- Productlines in each warehouse 
SELECT
p.warehouseCode,w.warehouseName, p.productLine 
FROM mintclassics.products AS p
INNER JOIN mintclassics.warehouses AS w
	ON p.warehouseCode = w.warehouseCode
GROUP BY
	warehouseCode,
    warehouseName,
    productLine

-- Quantity in stock of each product line in each warehouse
SELECT 
p.warehouseCode, w.warehouseName, SUM(quantityInStock) AS total_quantity, COUNT(distinct p.productCode) AS type_of_product, 
p.productLine
FROM mintclassics.products AS p
INNER JOIN mintclassics.warehouses AS w
	ON p.warehouseCode = w.warehouseCode
GROUP BY warehouseCode, productLine


-- Quantiy in stock and total sale of each product
SELECT
p.productCode, quantityInStock,SUM(quantityOrdered)  
FROM mintclassics.products AS p
LEFT JOIN mintclassics.orderdetails AS o
  ON p.productCode = o.productCode
GROUP BY p.productCode


-- Creating a summary table and finding out the status of each product stock
DROP TABLE IF EXISTS summary; 
CREATE TEMPORARY TABLE summary AS(
	SELECT 
		p.productCode, 
		p.productName,
        p.warehouseCode, 
        p.quantityInStock, 
        SUM(od.quantityOrdered) AS total_sale,
        p.quantityInStock - SUM(od.quantityOrdered) AS remaining_stock,
		CASE 
			WHEN p.quantityInStock - SUM(od.quantityOrdered) > 0.8 * p.quantityInStock THEN "Overstocked"
            WHEN p.quantityInStock - SUM(od.quantityOrdered) < 0.2 * p.quantityInStock THEN "Understocked"
			ELSE "Well Stocked"
		END AS status
	FROM mintclassics.products as p
    LEFT JOIN mintclassics.orderdetails as od
		ON p.productCode = od.productCode
	INNER JOIN mintclassics.orders as o
		ON od.orderNumber = o.orderNumber
		WHERE (o.status = 'Shipped' OR o.status = 'Resolved')
	GROUP BY
		p.warehouseCode,
        p.productCode
     )
     
-- Checking the temporary table created
SELECT *
FROM mintclassics.summary
    
-- Finding out the number of overstocked and understocked products in each warehosue
SELECT
	warehouseCode,status,
	COUNT(productCode)
FROM mintclassics.summary
GROUP BY warehouseCode,status
ORDER BY warehouseCode
-- warehouse b is seen to have the highest number of overstocked products (22)