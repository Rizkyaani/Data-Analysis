SELECT * FROM pizzasales;

-- Total penerimaan
SELECT SUM(total_price) AS total_revenue
FROM pizzasales;

-- Rata-rata jumlah order
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM pizzasales;

-- Total pizza terjual
SELECT SUM(quantity) AS total_pizza_sold
FROM pizzasales;

-- Total pesanan
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizzasales;

-- Rata-rata pizza per pesanan
SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS avg_orders
FROM pizzasales;

-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------

-- Tren total pesanan tiap hari
SELECT DAY(STR_TO_DATE(order_date, '%d-%m-%Y')) AS day, COUNT(DISTINCT order_id) AS total_orders
FROM pizzasales
GROUP BY DAY(STR_TO_DATE(order_date, '%d-%m-%Y'));

-- Persentase penjualan berdasarkan kategori pizza
SELECT pizza_category,  SUM(total_price) AS total_sales,
SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizzasales) AS PCT
FROM pizzasales
GROUP BY pizza_category;

-- Persentase penjualan berdasarkan ukuran pizza
SELECT pizza_size, 
       SUM(total_price) AS total_sales, 
       (SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizzasales)) AS PCT
FROM pizzasales
GROUP BY pizza_size
ORDER BY PCT DESC;

-- Top 5 tertinggi penerimaan, jumlah terjual, dan total pesanan
SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizzasales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizzasales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

