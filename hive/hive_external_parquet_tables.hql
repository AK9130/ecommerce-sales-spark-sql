--Create Database
CREATE DATABASE IF NOT EXISTS ecommerce_sales;
USE ecommerce_sales;

--Customers
CREATE EXTERNAL TABLE customers (
  customer_id STRING,
  customer_unique_id STRING,
  customer_zip_code_prefix INT,
  customer_city STRING,
  customer_state STRING
)
STORED AS PARQUET
LOCATION 'hdfs://localhost:9000/user/aaqib/input_projects/2_ecommerce_transactional/customers_parquet';

--Products
CREATE EXTERNAL TABLE products (
  product_id STRING,
  product_category_name STRING,
  product_name_length INT,
  product_description_length INT,
  product_photos_qty INT,
  product_weight_g INT,
  product_length_cm INT,
  product_height_cm INT,
  product_width_cm INT
)
STORED AS PARQUET
LOCATION 'hdfs://localhost:9000/user/aaqib/input_projects/2_ecommerce_transactional/products_parquet';

--Orders
CREATE EXTERNAL TABLE orders (
  order_id STRING,
  customer_id STRING,
  order_status STRING,
  order_purchase_timestamp BIGINT,
  order_approved_at BIGINT,
  order_delivered_carrier_date BIGINT,
  order_delivered_customer_date BIGINT,
  order_estimated_delivery_date BIGINT
)
STORED AS PARQUET
LOCATION 'hdfs://localhost:9000/user/aaqib/input_projects/2_ecommerce_transactional/orders_parquet';

--Order_Items
CREATE EXTERNAL TABLE order_items (
  order_id STRING,
  order_item_id INT,
  product_id STRING,
  seller_id STRING,
  shipping_limit_date STRING,
  price DOUBLE,
  freight_value DOUBLE
)
STORED AS PARQUET
LOCATION 'hdfs://localhost:9000/user/aaqib/input_projects/2_ecommerce_transactional/order_items_parquet';

--Payments
CREATE EXTERNAL TABLE payments (
  order_id STRING,
  payment_sequential INT,
  payment_type STRING,
  payment_installments INT,
  payment_value DOUBLE
)
STORED AS PARQUET
LOCATION 'hdfs://localhost:9000/user/aaqib/input_projects/2_ecommerce_transactional/payments_parquet';

--hive -f hive_external_parquet_tables.hql
