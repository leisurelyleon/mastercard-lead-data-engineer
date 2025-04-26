/*
File: relational/postgres_schema.sql
*/
-- Create keyspace/schema
CREATE SCHEMA IF NOT EXISTS payment;

-- Create a users table
CREATE TABLE payment.users (
user_id SERIAL PRIMARY KEY,
email VARCHAR(255) NOT NULL UNIQUE,
full_name VARCHAR(100) NOT NULL,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create a transactions table
CREATE TABLE payment.transactions (
txn_id BIGSERIAL PRIMARY KEY,
user_id INTEGER NOT NULL REFERENCES payment.users(user_id),
amount DECIMAL(12,2) NOT NULL,
txn_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
status VARCHAR(20) NOT NULL
);
