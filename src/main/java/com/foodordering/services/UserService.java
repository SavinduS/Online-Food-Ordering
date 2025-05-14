package com.foodordering.services;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.foodordering.Util.*;
import com.foodordering.model.*;

/*
 * OOP Concepts:
 * - Encapsulation: Uses getters from UserModel to access private fields.
 * - Separation of Concerns: Handles database logic separately from the controller or view.
 * - Exception Handling: try-catch blocks used for all DB operations.
 */

public class UserService {

    // Insert new user into the database (registration)
    public void insertData(UserModel userModel) {
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "INSERT INTO customerregistration (firstname, lastname, email, password, confirmpassword, phonenumber) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            // Encapsulation: Using getters from UserModel to set values
            stmt.setString(1, userModel.getFirstname());
            stmt.setString(2, userModel.getLastname());
            stmt.setString(3, userModel.getEmail());
            stmt.setString(4, userModel.getPassword());
            stmt.setString(5, userModel.getConfirmpass());
            stmt.setString(6, userModel.getPhonenumber());

            stmt.executeUpdate();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Update user details without changing password
    public void updateUser(String email, String firstName, String lastName, String phone) {
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "UPDATE customerregistration SET firstname = ?, lastname = ?, phonenumber = ? WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, phone);
            stmt.setString(4, email);
            stmt.executeUpdate();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Update user details including password
    public void updateUserWithPassword(String email, String firstName, String lastName, String phone, String password) {
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "UPDATE customerregistration SET firstname = ?, lastname = ?, phonenumber = ?, password = ?, confirmpassword = ? WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, phone);
            stmt.setString(4, password);
            stmt.setString(5, password); // Confirm password is stored the same
            stmt.setString(6, email);
            stmt.executeUpdate();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete a user from the database using email
    public void deleteUserByEmail(String email) {
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "DELETE FROM customerregistration WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.executeUpdate();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
