package org.example.demo1.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/sys";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi kết nối database: " + e.getMessage(), e);
        }
    }
}
