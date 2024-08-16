CREATE SCHEMA IF NOT EXISTS ecommerce;

CREATE TABLE IF NOT EXISTS ecommerce.olist_customers (
    customer_id VARCHAR(255) PRIMARY KEY,
    customer_unique_id VARCHAR(255),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(255),
    customer_state CHAR(2)
);

CREATE TABLE IF NOT EXISTS ecommerce.olist_geolocation (
    geolocation_zip_code_prefix INT PRIMARY KEY,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR(255),
    geolocation_state CHAR(2)
);

CREATE TABLE IF NOT EXISTS ecommerce.olist_order_items (
    order_id VARCHAR(255),
    order_item_id INT,
    product_id VARCHAR(255),
    seller_id VARCHAR(255),
    shipping_limit_date TIMESTAMP,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2)
    PRIMARY KEY (order_id, order_item_id)
    FOREIGN KEY (order_id) REFERENCES ecommerce.olist_orders(order_id)
);

CREATE TABLE IF NOT EXISTS ecommerce.olist_order_payments (
    order_id VARCHAR(255),
    payment_sequential INT,
    payment_type VARCHAR,
    payment_installments INT,
    payment_value FLOAT,
    PRIMARY KEY (order_id, payment_sequential)
);

CREATE TABLE IF NOT EXISTS ecommerce.olist_order_reviews (
    review_id INT PRIMARY KEY,
    order_id VARCHAR(255),
    review_score INT,
    review_comment_title VARCHAR(255),
    review_comment_message VARCHAR(255),
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ecommerce.olist_orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id INT,
    order_status VARCHAR(255),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);  

CREATE TABLE IF NOT EXISTS ecommerce.olist_products (
    product_id VARCHAR PRIMARY KEY,
    product_category_name VARCHAR(255),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT
);

CREATE TABLE IF NOT EXISTS ecommerce.olist_sellers (
    seller_id VARCHAR PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(255),
    seller_state VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ecommerce.olist_product_category_name_translation (
    product_category_name VARCHAR PRIMARY KEY,
    product_category_name_english VARCHAR
);

