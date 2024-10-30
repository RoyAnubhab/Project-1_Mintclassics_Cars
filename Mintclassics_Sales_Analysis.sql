-- SALES ANALYSIS


-- Finding the sales record of the overstocked products
SELECT
	s.productCode,
    s.warehouseCode,
    s.quantityInStock,
    s.total_sale,
    s.status,
    ((s.total_sale)/(s.quantityInStock)) * 100 AS sales_percent
FROM 
	mintclassics.summary AS s
WHERE
 status = 'Overstocked'
ORDER BY
	warehouseCode,
	sales_percent

    
-- Calculating the combined sales performance of each warehouse   
SELECT s.warehouseCode,
SUM(s.quantityInStock) AS total_stock,
SUM(s.total_sale) AS combined_sale,
(SUM(s.total_sale)/SUM(s.quantityInStock)) * 100 AS combined_sales_percent
FROM mintclassics.summary AS s
GROUP BY 
 s.warehouseCode
ORDER BY 
 combined_sales_percent
-- It is seen that b has the lowest sales performance followed by c


-- Finding out the revenue produced from each warehouse
DROP TABLE IF EXISTS revenue;
CREATE TEMPORARY TABLE revenue AS (
	SELECT
	p.productCode,
	p.warehouseCode,
	SUM(od.quantityOrdered) AS total_sale,
	od.priceEach,
	(SUM(od.quantityOrdered) * od.priceEach) AS revenue
	FROM mintclassics.products as p
	INNER JOIN mintclassics.orderdetails as od
		ON p.productCode = od.productCode
	INNER JOIN mintclassics.orders as o
		ON od.orderNumber = o.orderNumber
	WHERE (o.status = 'Shipped' OR o.status = 'Resolved')
	GROUP BY 
		p.productCode,
		p.warehouseCode,
		od.priceEach
)

SELECT* FROM mintclassics.revenue

SELECT r.warehouseCode,
SUM(r.revenue) AS total_revenue
FROM mintclassics.revenue AS r
GROUP BY warehouseCode 
ORDER BY total_revenue
-- warehouse c produces the lowest revenue for the company
