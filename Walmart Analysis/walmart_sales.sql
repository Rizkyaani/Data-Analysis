SELECT * FROM walmart_sales;

-- ANALISIS PENJUALAN PRODUK ---------------------------------------------------------------
-- Kategori produk dengan total penjualan tertinggi
SELECT category, SUM(total) as total_sales
FROM walmart_sales
GROUP BY category
ORDER BY total_sales DESC;

-- TOP 5 cabang dengan kuantitas penjualan tertinggi
SELECT branch, city, SUM(quantity) as total_quantity
FROM walmart_sales
GROUP BY branch, city
ORDER BY total_quantity DESC
LIMIT 5;

-- Total penjualan dan transaksi tiap tahun
SELECT 
    YEAR(STR_TO_DATE(date, '%d/%m/%Y')) AS year, 
    SUM(total) AS total_sales,
    COUNT(*) AS total_transaction
FROM walmart_sales
GROUP BY YEAR(STR_TO_DATE(date, '%d/%m/%Y'))
ORDER BY YEAR(STR_TO_DATE(date, '%d/%m/%Y')) DESC;

-- ANALISIS PEMBAYARAN -------------------------------------------------------------

-- Metode pembayaran paling sering digunakan
SELECT 
    payment_method,
    COUNT(*) AS total_transactions
FROM walmart_sales
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- Metode pembayaran dengan transaksi tinggi berdasarkan kota
SELECT 
    city,
    payment_method,
    COUNT(*) AS total_transactions
FROM walmart_sales
GROUP BY city, payment_method
ORDER BY total_transactions DESC;

-- ANALISIS KINERJA CABANG ----------------------------------------------------------------

-- Total penjualan antar cabang
SELECT 
    branch,
    city,
    SUM(total) AS total_sales
FROM walmart_sales
GROUP BY branch, city
ORDER BY total_sales ASC;

-- ANALISIS KEPUASAN PELANGGAN ------------------------------------------------------------

-- Kategori produk dengan rating tertinggi
SELECT 
    category,
    AVG(rating) AS avg_rating
FROM walmart_sales
GROUP BY category
ORDER BY avg_rating DESC;

-- Kategori produk dengan peringkat rata-rata, minimum, dan maksimum untuk setiap kota
SELECT city,
		category,
        AVG(rating) AS avg_rating,
        MIN(rating) AS min_rating,
        MAX(rating) AS max_rating
FROM walmart_sales
GROUP BY city, category;

-- OPTIMALISASI KEUNTUNGAN ---------------------------------------------------------------

-- Kategori produk dengan rata-rata margin keuntungan tertinggi
SELECT 
    category,
    AVG(profit_margin) AS avg_profit_margin
FROM walmart_sales
GROUP BY category
ORDER BY avg_profit_margin DESC;

-- Hubungan margin keuntungan dengan total penjualan
SELECT 
    profit_margin,
    SUM(total) AS total_sales
FROM walmart_sales
GROUP BY profit_margin
ORDER BY total_sales DESC;