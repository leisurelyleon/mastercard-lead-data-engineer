/*
File: relational/JdbcConnector.java
*/
package com.mastercard.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JdbcConnector {
private static final String URL = "jdbc:postgresql://localhost:5432/payment";
private static final String USER = "postgres";
private static final String PASS = "your_password";

public static void main(String[] args) {
    try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {
        System.out.println("Connected to Postgres successfully.");
        String query = "SELECT user_id, email, full_name FROM payment.users WHERE status = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, "active");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    System.out.printf("User: %d, %s, %s\n",
                        rs.getInt("user_id"),
                        rs.getString("email"),
                        rs.getString("full_name")
                    );
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
}
