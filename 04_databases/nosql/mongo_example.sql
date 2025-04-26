/*
File: nosql/mongo_example.py
*/
from pymongo import MongoClient

def main():
client = MongoClient("mongodb://localhost:27017/")
db = client["payment_db"]
users = db.users

# Insert a document
user_id = users.insert_one({
    "email": "alice@example.com",
    "full_name": "Alice Wonderland",
    "created_at": "2025-04-23T12:00:00Z"
}).inserted_id
print(f"Inserted user with _id: {user_id}")

# Query documents
for user in users.find({"status": "active"}):
    print(user)

if name == "main":
main()
