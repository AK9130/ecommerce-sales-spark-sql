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
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/aaqib/input_projects/2_ecommerce/customers';

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
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/aaqib/input_projects/2_ecommerce/products';

--Orders
CREATE EXTERNAL TABLE orders (
  order_id STRING,
  customer_id STRING,
  order_status STRING,
  order_purchase_timestamp STRING,
  order_approved_at STRING,
  order_delivered_carrier_date STRING,
  order_delivered_customer_date STRING,
  order_estimated_delivery_date STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/aaqib/input_projects/2_ecommerce/orders';

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
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/aaqib/input_projects/2_ecommerce/order_items';

--Payments
CREATE EXTERNAL TABLE payments (
  order_id STRING,
  payment_sequential INT,
  payment_type STRING,
  payment_installments INT,
  payment_value DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/aaqib/input_projects/2_ecommerce/payments';


--hive -f hive_external_tables.hql
