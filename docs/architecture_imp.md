# E-Commerce Sales Data Pipeline Architecture

This project demonstrates an end-to-end Big Data pipeline for analyzing e-commerce sales data.

Pipeline Flow:

1. Raw Data (CSV Files)
   - customers.csv
   - orders.csv
   - order_items.csv
   - products.csv
   - payments.csv

2. Data Ingestion
   CSV data is loaded into MySQL using LOAD DATA INFILE.

3. Data Transfer
   Sqoop is used to import MySQL tables into HDFS.

4. Data Storage
   Data is stored in HDFS and accessed through Hive external tables.

5. Data Optimization
   Hive tables are converted into Parquet format for better performance.

6. Data Processing
   Spark SQL is used to perform analytics and business queries.

7. Output Generation
   Processed results are written to HDFS and stored locally in the output folder.

Technologies Used:
- Hadoop (HDFS)
- Hive
- Sqoop
- MySQL
- Apache Spark
- Linux
