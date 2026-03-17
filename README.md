## E-Commerce Sales Data Pipeline and Analysis Using Spark SQL

## Project Overview
This project demonstrates an end-to-end Big Data pipeline where e-commerce sales data is processed and analyzed using Spark SQL.

## Architecture Flow
CSV Files --> MySQL --> Sqoop --> HDFS --> Hive(External Tables) --> Spark SQL --> Output(Parquet)

## Tools & Technologies
- MySQL
- Sqoop
- HDFS
- Hive
- Spark SQL
- PySpark
- Linux

## Project Structure

data_sets/    --> CSV files
mysql/        --> MySQL scripts
sqoop/        --> Sqoop commands
hive/         --> Hive scripts
spark_scripts/--> Spark SQL code
output/       --> Output results
docs/         --> Documentation
README.md


## Steps Performed
1. Loaded CSV data into MySQL
2. Imported data from MySQL to HDFS using Sqoop
3. Created Hive External Tables on HDFS data
4. Connected Spark with Hive
5. Performed Spark SQL joins and analysis
6. Saved output in Parquet format

## Analysis Performed
- Top Product Categories by Sales
- State-wise Sales Analysis
- Payment Type-wise Sales
- Top Customers by Spending
- Monthly Sales Trend
- Order Count by State

## Output
Final output saved in HDFS:

/user/aaqib/output_projects/2_ecommerce/state_wise_sales

## How to Run
```bash
spark-submit spark_scripts/ecommerce_analysis.py
```
Author:
Aaqib Kakar
