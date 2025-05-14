package com.foodordering.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.UserLoginModel;
import com.foodordering.model.employee;

/*
 * This service class handles login validation logic for admins and customers.
 * It belongs to the Service layer of the MVC architecture.
 *
 * OOP Concepts:
 * - Encapsulation: Uses employee and UserLoginModel objects to access private data via getters/setters.
 * - Exception Handling: All database interactions are wrapped in try-catch.
 * - Separation of Concerns: Login logic is kept out of the controller/servlet.
 */

public class LoginService {

    // Validate admin login using email and password
    public employee validateEMP(String email, String password) {
        employee emp = null;

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT * FROM employee WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            // Encapsulation: values are passed through parameters
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Encapsulation: Fill employee object using setters
                emp = new employee();
                emp.setEmpID(rs.getInt("empID"));
                emp.setName(rs.getString("name"));
                emp.setEmail(rs.getString("email"));
                emp.setPhone_num(rs.getString("phone_num"));
                emp.setNIC(rs.getString("NIC"));
                emp.setPosition(rs.getString("position"));
                emp.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace(); // Exception Handling
        }

        return emp;
    }

    // Validate customer login using UserLoginModel object
    public boolean validateCustomer(UserLoginModel user) {
        boolean isCustomer = false;

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT * FROM customerregistration WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            // Encapsulation: use getters to access login details
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                isCustomer = true; // Login success
            }

            rs.close();
            stmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isCustomer;
    }
}
