#!/bin/bash

#customers
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table customers \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce_transactional/customers_parquet \
--delete-target-dir \
-m 1

#products
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table products \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce_transactional/products_parquet \
--delete-target-dir \
-m 1

#orders
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table orders \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce_transactional/orders_parquet \
--delete-target-dir \
-m 1

#order_items
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table order_items \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce_transactional/order_items_parquet \
--delete-target-dir \
-m 1

#payments
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table payments \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce_transactional/payments_parquet \
--delete-target-dir \
-m 1

#runs
#chmod +x sqoop_import_all.sh
#./sqoop_import_all.sh
