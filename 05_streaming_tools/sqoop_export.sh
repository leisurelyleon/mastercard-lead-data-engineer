/*
File: sqoop_export.sh
*/
#!/bin/bash

Export transactions from HDFS to Postgres

sqoop export 
--connect jdbc:postgresql://localhost:5432/payment 
--username postgres 
--password your_password 
--table transactions 
--export-dir /data/output/transactions 
--input-fields-terminated-by ',' 
--batch
