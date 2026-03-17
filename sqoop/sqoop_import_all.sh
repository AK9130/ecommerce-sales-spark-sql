#!/bin/bash

#customers
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table customers \
--target-dir /user/aaqib/input_projects/2_ecommerce/customers \
-m 1

#products
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table products \
--target-dir /user/aaqib/input_projects/2_ecommerce/products \
-m 1

#orders
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table orders \
--target-dir /user/aaqib/input_projects/2_ecommerce/orders \
-m 1

#order_items
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table order_items \
--target-dir /user/aaqib/input_projects/2_ecommerce/order_items \
-m 1

#payments
sqoop import \
--connect jdbc:mysql://localhost:3306/ecommerce_sales \
--username root \
--password zxczx \
--table payments \
--target-dir /user/aaqib/input_projects/2_ecommerce/payments \
-m 1

#runs
#chmod +x sqoop_import_all.sh
#./sqoop_import_all.sh
