SELECT * FROM etl.load_log;
TRUNCATE TABLE etl.load_log;


--- test the repeatability of data
SELECT 'orders' AS tbl, COUNT(*) AS n FROM bronze.orders
UNION ALL SELECT 'customers', COUNT(*) FROM bronze.customers
UNION ALL SELECT 'sellers', COUNT(*) FROM bronze.sellers
UNION ALL SELECT 'product_category_name_translation', COUNT(*) FROM bronze.product_category_name_translation
UNION ALL SELECT 'products', COUNT(*) FROM bronze.products
UNION ALL SELECT 'order_items', COUNT(*) FROM bronze.order_items
UNION ALL SELECT 'geolocation', COUNT(*) FROM bronze.geolocation
UNION ALL SELECT 'order_payments', COUNT(*) FROM bronze.order_payments
UNION ALL SELECT 'order_reviews', COUNT(*) FROM bronze.order_reviews;