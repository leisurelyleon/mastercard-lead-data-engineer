/*
File: nosql/cassandra_model.cql
*/
-- Create keyspace
CREATE KEYSPACE IF NOT EXISTS payment WITH replication = {
'class': 'SimpleStrategy',
'replication_factor': 3
};

-- Use the keyspace
USE payment;

-- Create a transactions table
CREATE TABLE IF NOT EXISTS transactions (
txn_id UUID PRIMARY KEY,
user_id UUID,
amount decimal,
txn_date timestamp,
status text
);

-- Example prepared statement usage
// cqlsh> PREPARE insert_txn AS
//   INSERT INTO payment.transactions (txn_id, user_id, amount, txn_date, status)
//   VALUES (?, ?, ?, ?, ?);
