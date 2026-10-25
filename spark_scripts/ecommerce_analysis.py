from pyspark.sql import SparkSession

## Spark Session
spark = SparkSession.builder \
    .appName("EcommerceAnalysis") \
    .enableHiveSupport() \
    .getOrCreate()

spark.sql("USE ecommerce_sales")

# Cache all 5 tables
spark.sql("CACHE TABLE customers OPTIONS ('storageLevel' 'MEMORY_AND_DISK')")
spark.sql("CACHE TABLE products OPTIONS ('storageLevel' 'MEMORY_AND_DISK')")
spark.sql("CACHE TABLE orders OPTIONS ('storageLevel' 'MEMORY_AND_DISK')")
spark.sql("CACHE TABLE order_items OPTIONS ('storageLevel' 'MEMORY_AND_DISK')")
spark.sql("CACHE TABLE payments OPTIONS ('storageLevel' 'MEMORY_AND_DISK')")

## Data Quality Checks
print("...DATA QUALITY CHECKS...")

# 1) Row count of each table
df_counts = spark.sql("""
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
""")
df_counts.show()

# 2) Null check in orders
df_nulls = spark.sql("""
SELECT
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id
FROM orders
""")
df_nulls.show()

# 3) Duplicate order_id check
df_dup = spark.sql("""
SELECT COUNT(*) - COUNT(DISTINCT order_id) AS duplicate_orders
FROM orders
""")
df_dup.show()

# 4) Orphan check (order_items with no matching product)
df_orphan = spark.sql("""
SELECT COUNT(*) AS orphan_items
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.product_id
WHERE p.product_id IS NULL
""")
df_orphan.show()

print("DATA QUALITY CHECKS DONE")

# Analysis 1 - Top Product Categories
df_categories = spark.sql("""
SELECT p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE p.product_category_name IS NOT NULL
GROUP BY p.product_category_name
ORDER BY total_sales DESC
LIMIT 10
""")
df_categories.show()

# Analysis 2 - State Wise Sales
df_state_sales = spark.sql("""
SELECT c.customer_state,
    ROUND(SUM(pay.payment_value),2) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY c.customer_state
ORDER BY total_sales DESC
""")
df_state_sales.show()

# Analysis 3 - Payment Type Wise Sales
df_payments = spark.sql("""
SELECT payment_type,
    ROUND(SUM(payment_value),2) AS total_sales
FROM payments
GROUP BY payment_type
ORDER BY total_sales DESC
""")
df_payments.show()

# Analysis 4 - Top Customers by Spending
df_customers = spark.sql("""
SELECT c.customer_unique_id,
    ROUND(SUM(pay.payment_value),2) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10
""")
df_customers.show()

# Analysis 5 - Monthly Sales Trend
df_monthly = spark.sql("""
SELECT DATE_FORMAT(from_unixtime(o.order_purchase_timestamp / 1000),'yyyy-MM') AS month,
    ROUND(SUM(pay.payment_value), 2) AS total_sales
FROM orders o
JOIN payments pay
ON o.order_id = pay.order_id
GROUP BY DATE_FORMAT(from_unixtime(o.order_purchase_timestamp / 1000),'yyyy-MM')
ORDER BY month
""")

df_monthly.show(30)

# Analysis 6 - Order Count by State
df_state_orders = spark.sql("""
SELECT c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC
""")
df_state_orders.show()

# Save Final Outputs
df_categories.write.mode("overwrite").parquet("hdfs://localhost:9000/user/aaqib/output_projects/2_ecommerce_transactional/top_categories_parquet")
df_state_sales.write.mode("overwrite").parquet("hdfs://localhost:9000/user/aaqib/output_projects/2_ecommerce_transactional/state_wise_sales_parquet")
df_monthly.write.mode("overwrite").parquet("hdfs://localhost:9000/user/aaqib/output_projects/2_ecommerce_transactional/monthly_sales_parquet")

spark.sql("CLEAR CACHE")

spark.stop()
