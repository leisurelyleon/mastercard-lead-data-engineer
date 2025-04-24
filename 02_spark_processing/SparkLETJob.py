from pyspark.sql import SparkSession

if name == "main": spark = SparkSession.builder .appName("SparkETLJob") .getOrCreate()

# Read source data
df = spark.read.format("csv") \
    .option("header", True) \
    .load("source_data.csv")

# Transform: filter and add column
from pyspark.sql.functions import col, lit
df_filtered = df.filter(col("status") == "active") \
    .withColumn("processed_date", lit("2025-04-23"))

# Write to target
df_filtered.write.format("parquet") \
    .mode("overwrite") \
    .save("output/processed_data")

spark.stop()
