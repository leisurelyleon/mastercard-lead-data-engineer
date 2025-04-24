// File: README.md
# 01_cloudera_integration

This directory contains sample code and configuration for integrating with a Cloudera CDH cluster.

## Files

- `connectToCDH.java` - Java sample that loads the Cloudera configuration and connects to HDFS.
- `cloudera-config.xml` - Hadoop configuration file for CDH cluster settings.
- `README.md` - This document.

## Usage

1. Update `cloudera-config.xml` with your cluster’s hostname and credentials.
2. Compile the Java code (ensure Hadoop client jars are on the classpath):
   ```bash
   javac -cp "/path/to/hadoop-client/*" connectToCDH.java
   ```
3. Run the sample:
   ```bash
   java -cp ".:/path/to/hadoop-client/*" com.mastercard.cloudera.connectToCDH
   ```

Ensure you have access to the CDH cluster and correct HDFS permissions before running the example.
