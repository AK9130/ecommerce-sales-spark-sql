USE ecommerce_sales;

--Customers Parquet Table
CREATE TABLE customers_parquet
STORED AS PARQUET
AS SELECT * FROM customers;

--Products Parquet Table
CREATE TABLE products_parquet
STORED AS PARQUET
AS SELECT * FROM products;

--Orders Parquet Table
CREATE TABLE orders_parquet
STORED AS PARQUET
AS SELECT * FROM orders;

--Payments Parquet Table
CREATE TABLE payments_parquet
STORED AS PARQUET
AS SELECT * FROM payments;

--Order_Items Parquet Table
CREATE TABLE order_items_parquet
STORED AS PARQUET
AS SELECT * FROM order_items;

--hive -f hive_parquet_tables.hql
