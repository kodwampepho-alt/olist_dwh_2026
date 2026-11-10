--- check load of orders table from ssis
SELECT COUNT(*) FROM bronze.orders;
SELECT TOP 10 * FROM bronze.orders;

TRUNCATE TABLE bronze.orders;
--- check metadata columns
SELECT TOP 5 dwh_load_ts, dwh_source_file, dwh_batch_id
FROM bronze.orders;


--- check load of customer table from ssis
SELECT COUNT(*) FROM bronze.customers;
SELECT TOP 10 * FROM bronze.customers;

TRUNCATE TABLE bronze.customers;
--- check metadata columns
SELECT TOP 5 dwh_load_ts, dwh_source_file, dwh_batch_id
FROM bronze.customers;


--- check load of sellers table from ssis
SELECT COUNT(*) FROM bronze.sellers;
SELECT TOP 10 * FROM bronze.sellers;

TRUNCATE TABLE bronze.sellers;
--- check metadata columns
SELECT TOP 5 dwh_load_ts, dwh_source_file, dwh_batch_id
FROM bronze.sellers;

--- check load of product category name translation table from ssis
SELECT COUNT(*) FROM bronze.product_category_name_translation;
SELECT TOP 10 * FROM bronze.product_category_name_translation;

TRUNCATE TABLE bronze.product_category_name_translation;
--- check metadata columns
SELECT TOP 5 dwh_load_ts, dwh_source_file, dwh_batch_id
FROM bronze.product_category_name_translation;


--- check load of products table from ssis
SELECT COUNT(*) FROM bronze.products;
SELECT TOP 10 * FROM bronze.products;

TRUNCATE TABLE bronze.products;
--- check metadata columns
SELECT TOP 5 dwh_load_ts, dwh_source_file, dwh_batch_id
FROM bronze.products;


--- check load of order items table from ssis
SELECT COUNT(*) FROM bronze.order_items;
SELECT TOP 10 * FROM bronze.order_items;

TRUNCATE TABLE bronze.order_items;
--- check metadata columns
SELECT TOP 5 dwh_load_ts, dwh_source_file, dwh_batch_id
FROM bronze.order_items;


--- check load of geolocation table from ssis
SELECT COUNT(*) FROM bronze.geolocation;
SELECT TOP 10 * FROM bronze.geolocation;

TRUNCATE TABLE bronze.geolocation;
--- check metadata columns
SELECT TOP 5 dwh_load_ts, dwh_source_file, dwh_batch_id
FROM bronze.geolocation;


--- check load of order payments table from ssis
SELECT COUNT(*) FROM bronze.order_payments;
SELECT TOP 10 * FROM bronze.order_payments;

TRUNCATE TABLE bronze.order_payments;
--- check metadata columns
SELECT TOP 5 dwh_load_ts, dwh_source_file, dwh_batch_id
FROM bronze.order_payments;

--- check load of order reviews table from ssis
SELECT COUNT(*) FROM bronze.order_reviews;
SELECT TOP 10 * FROM bronze.order_reviews;

TRUNCATE TABLE bronze.order_reviews;
--- check metadata columns
SELECT TOP 5 dwh_load_ts, dwh_source_file, dwh_batch_id
FROM bronze.order_reviews;
