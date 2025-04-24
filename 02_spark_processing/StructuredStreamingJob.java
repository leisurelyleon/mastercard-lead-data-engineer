// File: StructuredStreamingJob.java
package com.mastercard.spark;

import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.streaming.StreamingQuery;

public class StructuredStreamingJob {
public static void main(String[] args) throws Exception {
SparkSession spark = SparkSession.builder()
.appName("StructuredStreamingJob")
.master("local[*]")
.getOrCreate();

    Dataset<Row> input = spark.readStream()
        .format("kafka")
        .option("kafka.bootstrap.servers", "localhost:9092")
        .option("subscribe", "input-topic")
        .load();

    // Simple pass-through
    Dataset<Row> output = input.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)");

    StreamingQuery query = output.writeStream()
        .format("console")
        .start();

    query.awaitTermination();
    spark.stop();
    }
}
