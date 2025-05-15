package com.foodordering.services;

import com.foodordering.model.CustomerRead;
import com.foodordering.Util.DBConnect;
import java.sql.*;

/*
 * OOP Concepts:
 * - Encapsulation: Uses the CustomerRead model with private fields and public setters.
 * - Abstraction: Hides SQL/database logic from other parts of the application.
 * - Exception Handling: try-catch block ensures errors are handled gracefully.
 * - Reusability: A single method can be reused for profile loading, displaying, or other features.
 */

public class CustomerService {

    // Returns a CustomerRead object based on the provided email address
    public CustomerRead getCustomerByEmail(String email) {
        CustomerRead customer = null;

        try (Connection conn = DBConnect.getConnection()) {
            // Prepare SQL query to fetch customer by email
            String sql = "SELECT firstname, lastname, phonenumber FROM customerregistration WHERE email=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);

            // Execute query
            ResultSet rs = stmt.executeQuery();

            // If record found, map fields to model object
            if (rs.next()) {
                customer = new CustomerRead();
                customer.setFirstName(rs.getString("firstname"));     // Encapsulation
                customer.setLastName(rs.getString("lastname"));
                customer.setPhoneNumber(rs.getString("phonenumber"));
                customer.setEmail(email); // Set email manually since it's not fetched
            }

        } catch (Exception e) {
            e.printStackTrace(); // Exception handling
        }

        return customer;
    }
}
