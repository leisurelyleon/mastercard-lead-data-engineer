/*
File: impala_sample.sql
*/
-- Create managed table in Impala
CREATE TABLE IF NOT EXISTS payment.transactions (
txn_id BIGINT,
user_id INT,
amount DECIMAL(12,2),
status STRING
)
STORED AS PARQUET;

-- Refresh metadata after Hive table changes
INVALIDATE METADATA payment.transactions;

-- Sample join query
SELECT u.full_name, t.amount, t.status
FROM payment_db.users u
JOIN payment.transactions t ON u.user_id = t.user_id
WHERE t.status = 'completed';
