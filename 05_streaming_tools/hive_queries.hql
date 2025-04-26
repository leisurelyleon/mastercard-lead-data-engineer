/*
File: hive_queries.hql
*/
-- Create external table on HDFS
CREATE EXTERNAL TABLE IF NOT EXISTS logs (
user_id INT,
event_time TIMESTAMP,
action STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/data/logs/';

-- Query active events
SELECT user_id, action, COUNT(*) as cnt
FROM logs
WHERE action = 'login'
GROUP BY user_id, action
ORDER BY cnt DESC;
