--- create raw data- 9 bronze tables

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'orders')
BEGIN
    CREATE TABLE bronze.orders (
        order_id                       NVARCHAR(100),
        customer_id                    NVARCHAR(100),
        order_status                   NVARCHAR(100),
        order_purchase_timestamp       NVARCHAR(100),
        order_approved_at              NVARCHAR(100),
        order_delivered_carrier_date   NVARCHAR(100),
        order_delivered_customer_date  NVARCHAR(100),
        order_estimated_delivery_date  NVARCHAR(100),
        dwh_load_ts                    DATETIME2 DEFAULT SYSDATETIME(),
        dwh_source_file                NVARCHAR(260),
        dwh_batch_id                   INT
    );
END


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'customers')
BEGIN
    CREATE TABLE bronze.customers (
        customer_id               NVARCHAR(100),
        customer_unique_id        NVARCHAR(100),
        customer_zip_code_prefix  NVARCHAR(100),
        customer_city             NVARCHAR(200),
        customer_state            NVARCHAR(100),
        dwh_load_ts               DATETIME2 DEFAULT SYSDATETIME(),
        dwh_source_file           NVARCHAR(260),
        dwh_batch_id              INT
    );
END


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'sellers')
BEGIN
    CREATE TABLE bronze.sellers (
        seller_id               NVARCHAR(100),
        seller_zip_code_prefix  NVARCHAR(100),
        seller_city             NVARCHAR(200),
        seller_state            NVARCHAR(100),
        dwh_load_ts             DATETIME2 DEFAULT SYSDATETIME(),
        dwh_source_file         NVARCHAR(260),
        dwh_batch_id            INT
    );
END


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'product_category_name_translation')
BEGIN
    CREATE TABLE bronze.product_category_name_translation (
        product_category_name          NVARCHAR(200),
        product_category_name_english  NVARCHAR(200),
        dwh_load_ts                    DATETIME2 DEFAULT SYSDATETIME(),
        dwh_source_file                NVARCHAR(260),
        dwh_batch_id                   INT
    );
END


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'products')
BEGIN
    CREATE TABLE bronze.products (
        product_id                   NVARCHAR(100),
        product_category_name        NVARCHAR(200),
        product_name_lenght          NVARCHAR(100),
        product_description_lenght   NVARCHAR(100),
        product_photos_qty           NVARCHAR(100),
        product_weight_g             NVARCHAR(100),
        product_length_cm            NVARCHAR(100),
        product_height_cm            NVARCHAR(100),
        product_width_cm             NVARCHAR(100),
        dwh_load_ts                  DATETIME2 DEFAULT SYSDATETIME(),
        dwh_source_file              NVARCHAR(260),
        dwh_batch_id                 INT
    );
END


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'order_items')
BEGIN
    CREATE TABLE bronze.order_items (
        order_id             NVARCHAR(100),
        order_item_id        NVARCHAR(100),
        product_id           NVARCHAR(100),
        seller_id            NVARCHAR(100),
        shipping_limit_date  NVARCHAR(100),
        price                NVARCHAR(100),
        freight_value        NVARCHAR(100),
        dwh_load_ts          DATETIME2 DEFAULT SYSDATETIME(),
        dwh_source_file      NVARCHAR(260),
        dwh_batch_id         INT
    );
END


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'geolocation')
BEGIN
    CREATE TABLE bronze.geolocation (
        geolocation_zip_code_prefix  NVARCHAR(100),
        geolocation_lat              NVARCHAR(100),
        geolocation_lng              NVARCHAR(100),
        geolocation_city             NVARCHAR(200),
        geolocation_state            NVARCHAR(100),
        dwh_load_ts                  DATETIME2 DEFAULT SYSDATETIME(),
        dwh_source_file              NVARCHAR(260),
        dwh_batch_id                 INT
    );
END


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'order_payments')
BEGIN
    CREATE TABLE bronze.order_payments (
        order_id              NVARCHAR(100),
        payment_sequential    NVARCHAR(100),
        payment_type          NVARCHAR(100),
        payment_installments  NVARCHAR(100),
        payment_value         NVARCHAR(100),
        dwh_load_ts           DATETIME2 DEFAULT SYSDATETIME(),
        dwh_source_file       NVARCHAR(260),
        dwh_batch_id          INT
    );
END


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'bronze' AND TABLE_NAME = 'order_reviews')
BEGIN
    CREATE TABLE bronze.order_reviews (
        review_id                NVARCHAR(100),
        order_id                 NVARCHAR(100),
        review_score             NVARCHAR(100),
        review_comment_title     NVARCHAR(500),
        review_comment_message   NVARCHAR(MAX),
        review_creation_date     NVARCHAR(100),
        review_answer_timestamp  NVARCHAR(100),
        dwh_load_ts              DATETIME2 DEFAULT SYSDATETIME(),
        dwh_source_file          NVARCHAR(260),
        dwh_batch_id             INT
    );
END

