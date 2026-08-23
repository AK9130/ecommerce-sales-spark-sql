# E-Commerce Sales Data Pipeline Architecture
This project demonstrates an end-to-end e-commerce data pipeline using MySQL, Sqoop, HDFS, Hive, and Spark SQL.

## Pipeline Flow
1. *Raw Data*
   CSV files: customers, orders, order_items, products, payments

2. *Data Ingestion*
   CSV data is loaded into MySQL using LOAD DATA INFILE.

3. *Data Transfer*
   Sqoop imports MySQL tables into HDFS using --as-parquetfile.

4. *Data Storage*
   Data is stored as Parquet in HDFS and accessed through Hive External Tables.

5. *Data Processing*
   Spark SQL is used for joins and business analysis.

6. *Output*
   Final analysis results are stored in Parquet format in HDFS.

## Architecture Flow
CSV → MySQL → Sqoop (--as-parquetfile) → HDFS (Parquet) → Hive External Tables → Spark SQL → Analysis Output

## Technologies Used
* MySQL
* Sqoop
* Hadoop HDFS
* Hive
* Apache Spark SQL
* Parquet
* Linux
