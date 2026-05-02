#!/bin/bash

#customers
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table customers \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce/customers \
-m 1

#products
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table products \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce/products \
-m 1

#orders
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table orders \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce/orders \
-m 1

#order_items
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table order_items \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce/order_items \
-m 1

#payments
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table payments \
--as-parquetfile \
--target-dir /user/aaqib/input_projects/2_ecommerce/payments \
-m 1

#runs
#chmod +x sqoop_import_all.sh
#./sqoop_import_all.sh
