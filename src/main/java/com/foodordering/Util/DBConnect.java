package com.foodordering.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * DBConnect class provides database connection objects.
 *
 * 🔸 Design Pattern Used: Factory Method
 *   - This class encapsulates the logic of creating database connections.
 *   - The static method getConnection() acts as a factory method that returns a configured Connection object.
 *
 * 🔸 OOP Concepts:
 *   - Encapsulation: DB credentials are stored privately.
 *   - Abstraction: Clients don’t see how the connection is made.
 *   - Reusability: One method can be reused across all services and DAOs.
 */

public class DBConnect {

    // Encapsulated DB config
    private static final String URL = "jdbc:mysql://localhost:3306/onlinefoodordering";
    private static final String USER = "root";
    private static final String PASS = "12345";

    // Private constructor to prevent instantiation
    private DBConnect() {}

    // Factory Method: Returns a new DB connection
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
