from pyspark.sql import SparkSession

# Spark Session
spark = SparkSession.builder \
    .appName("EcommerceAnalysis") \
    .enableHiveSupport() \
    .getOrCreate()

spark.sql("USE ecommerce_sales")

# Analysis 1 - Top Product Categories

spark.sql("""
SELECT p.product_category_name,
ROUND(SUM(pay.payment_value),2) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC
LIMIT 10
""").show()

# Analysis 2 - State Wise Sales

spark.sql("""
SELECT c.customer_state,
ROUND(SUM(pay.payment_value),2) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY c.customer_state
ORDER BY total_sales DESC
""").show()

# Analysis 3 - Payment Type Wise Sales

spark.sql("""
SELECT payment_type,
ROUND(SUM(payment_value),2) AS total_sales
FROM payments
GROUP BY payment_type
ORDER BY total_sales DESC
""").show()

# Analysis 4 - Top Customers by Spending

spark.sql("""
SELECT o.customer_id,
ROUND(SUM(pay.payment_value),2) AS total_spent
FROM orders o
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10
""").show()

# Analysis 5 - Monthly Sales Trend

spark.sql("""
SELECT SUBSTRING(o.order_purchase_timestamp,1,7) AS month,
ROUND(SUM(pay.payment_value),2) AS total_sales
FROM orders o
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY SUBSTRING(o.order_purchase_timestamp,1,7)
ORDER BY month
""").show()

# Analysis 6 - Order Count by State

spark.sql("""
SELECT c.customer_state,
COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC
""").show()

# Save Final Output (Industry Style)

result = spark.sql("""
SELECT c.customer_state,
ROUND(SUM(pay.payment_value),2) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments pay ON o.order_id = pay.order_id
GROUP BY c.customer_state
""")

result.write.mode("overwrite").parquet("/user/aaqib/output_projects/2_ecommerce/state_wise_sales")

spark.stop()
