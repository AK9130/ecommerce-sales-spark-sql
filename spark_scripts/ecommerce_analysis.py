from pyspark.sql import SparkSession

# Spark Session
spark = SparkSession.builder \
    .appName("EcommerceAnalysis") \
    .enableHiveSupport() \
    .getOrCreate()

spark.sql("USE ecommerce_sales")

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
SELECT DATE_FORMAT(CAST(o.order_purchase_timestamp AS TIMESTAMP), 'yyyy-MM') AS month,
ROUND(SUM(pay.payment_value),2) AS total_sales
FROM orders o
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY DATE_FORMAT(CAST(o.order_purchase_timestamp AS TIMESTAMP), 'yyyy-MM')
ORDER BY month
""")
df_monthly.show()

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

spark.stop()
