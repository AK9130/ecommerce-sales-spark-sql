--customer.csv

LOAD DATA LOCAL INFILE '/home/aaqib/PROJECTS/2_E-Commerce_Sales_Data_Pipeline_and_Analysis_Using_Spark_SQL/data_sets/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--products.csv

LOAD DATA LOCAL INFILE '/home/aaqib/PROJECTS/2_E-Commerce_Sales_Data_Pipeline_and_Analysis_Using_Spark_SQL/data_sets/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--orders.csv

LOAD DATA LOCAL INFILE '/home/aaqib/PROJECTS/2_E-Commerce_Sales_Data_Pipeline_and_Analysis_Using_Spark_SQL/data_sets/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--order_item.csv

LOAD DATA LOCAL INFILE '/home/aaqib/PROJECTS/2_E-Commerce_Sales_Data_Pipeline_and_Analysis_Using_Spark_SQL/data_sets/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--payment.csv

LOAD DATA LOCAL INFILE '/home/aaqib/PROJECTS/2_E-Commerce_Sales_Data_Pipeline_and_Analysis_Using_Spark_SQL/data_sets/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
