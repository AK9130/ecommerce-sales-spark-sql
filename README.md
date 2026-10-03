# E-Commerce Sales Data Pipeline and Analysis Using Spark SQL

## 1) Project Introduction
This project demonstrates an end-to-end e-commerce Big Data pipeline where transactional sales data is processed and analyzed using Spark SQL.
The complete pipeline is:
CSV Files → MySQL → Sqoop → HDFS (Parquet) → Hive External Tables → Spark SQL → Output (Parquet)

## 2) Problem Statement
The objective of this project is to build an end-to-end data pipeline for e-commerce transactional data and perform business-oriented sales analysis.
The pipeline takes raw CSV data, loads it into MySQL, transfers the data to HDFS using Sqoop, creates Hive External Tables on the Parquet data, and uses Spark SQL for joins and analysis.

## 3) Dataset
The project uses five transactional CSV datasets:

- customers.csv
- orders.csv
- order_items.csv
- products.csv
- payments.csv

The datasets contain customer information, order details, product information, order items, and payment transactions.

## 4) Technologies Used
- Linux
- MySQL
- Sqoop
- Hadoop HDFS
- Hive
- Apache Spark SQL
- PySpark
- Parquet

## 5) Project Workflow

### Step 1: Load CSV Data into MySQL
The raw CSV files are loaded into MySQL tables using `LOAD DATA LOCAL INFILE`.

### Step 2: Transfer Data Using Sqoop
Sqoop is used to import the MySQL tables into HDFS in Parquet format.

### Step 3: Store Data in HDFS
The imported Parquet files are stored in HDFS.

### Step 4: Create Hive External Tables
Hive External Tables are created on the Parquet data stored in HDFS.

### Step 5: Process Data Using Spark SQL
Spark is configured with Hive support and Spark SQL is used to join the tables and perform business analysis.

### Step 6: Store Analysis Output
The final analysis result is stored in HDFS in Parquet format.
HDFS output path:
`/user/aaqib/output_projects/2_ecommerce/state_wise_sales`

### Architecture Flow
CSV → MySQL → Sqoop → HDFS (Parquet) → Hive External Tables → Spark SQL → Output (Parquet)

## 6) Your Role
I worked on the complete data pipeline, including:

- Created MySQL database schemas.
- Loaded CSV data into MySQL.
- Imported MySQL tables into HDFS using Sqoop.
- Stored data in Parquet format.
- Created Hive External Tables on HDFS data.
- Connected Spark with Hive.
- Wrote Spark SQL queries for joins and analysis.
- Generated and stored the final output in Parquet format.

## 7) Analysis / Results
The project performs the following analyses:

- Top Product Categories by Sales
- State-wise Sales Analysis
- Payment Type-wise Sales
- Top Customers by Spending
- Monthly Sales Trend
- Order Count by State

Spark SQL was used to perform joins, aggregations, grouping, sorting, and calculations such as total sales and order counts.

## 8) Challenges
During the project, I faced challenges related to:

- Loading CSV data into MySQL.
- File and path issues.
- Hive schema and data-type compatibility.
- Managing data movement between MySQL, HDFS, Hive, and Spark.

I solved these issues by checking the source data, table schemas, HDFS paths, Hive table definitions, and Spark SQL queries step by step.

## 9) Project Structure
```text
.
├── data_sets
│   └── E-commerce_transactional
│       ├── customers.csv
│       ├── order_items.csv
│       ├── orders.csv
│       ├── payments.csv
│       └── products.csv
├── docs
│   ├── architecture.md
│   └── project_documentation.md
├── hive
│   └── hive_external_parquet_tables.hql
├── mysql
│   ├── load_data.sql
│   └── schema.sql
├── output
│   └── state_wise_sales.parquet
├── README.md
├── spark_scripts
│   └── ecommerce_analysis.py
└── sqoop
    └── sqoop_import_all.sh
```

## 10) How to Run
```bash
spark-submit spark_scripts/ecommerce_analysis.py
```
## 11) Conclusion
This project demonstrates a complete end-to-end Big Data e-commerce pipeline using MySQL, Sqoop, HDFS, Hive, and Spark SQL.
The pipeline moves raw transactional data through different stages, stores the data in Parquet format, performs multiple business analyses using Spark SQL, and stores the final analysis output in HDFS.
The project provided practical experience in data ingestion, data transfer, distributed storage, Hive External Tables, Spark SQL processing, and Parquet-based data storage.

## Author
Aaqib Kakar
