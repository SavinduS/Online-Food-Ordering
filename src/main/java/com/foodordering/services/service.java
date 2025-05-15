package com.foodordering.services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.Customer;

/*
 
 * OOP Concepts:
 * - Encapsulation: Customer fields are accessed and modified only via getters/setters.
 * - Abstraction: SQL and JDBC details are hidden from the controllers.
 * - Exception Handling: All JDBC operations are wrapped to prevent leaks and crashes.
 */
public class service {

    /**
     * Inserts a new customer review if none exists for the given email+mobile.
     */
    public boolean insertData(Customer cus) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Encapsulation: retrieve and sanitize fields from model
            String name    = cus.getName().trim();
            String email   = cus.getEmail().trim();
            String mobile  = cus.getMobile().trim();
            String rate    = cus.getRate();
            String comment = cus.getComment();

            // Provide defaults if fields are empty
            if (rate == null || rate.trim().isEmpty())    rate    = "Not Given";
            if (comment == null || comment.trim().isEmpty()) comment = "No comment";

            // Factory Method: obtain a Connection via DBConnect
            conn = DBConnect.getConnection();

            
            String checkSql = 
                "SELECT COUNT(*) FROM customer WHERE LOWER(email)=LOWER(?) AND mobile=?";
            ps = conn.prepareStatement(checkSql);
            ps.setString(1, email);
            ps.setString(2, mobile);
            rs = ps.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                
                System.out.println("Duplicate review for: " + email + " | " + mobile);
                return false;
            }

            // Clean up before insert
            rs.close();
            ps.close();

            // 2) Insert new review
            String sql = 
                "INSERT INTO customer (name,email,mobile,rating,comment) VALUES (?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, rate);
            ps.setString(5, comment);
            ps.executeUpdate();

            System.out.println("Review inserted for: " + email);
            return true;

        } catch (Exception e) {
            // Exception Handling: log and indicate failure
            e.printStackTrace();
            return false;
        } finally {
            // Ensure all resources are closed to prevent memory leaks
            try { if (rs   != null) rs.close();   } catch (Exception ignored) {}
            try { if (ps   != null) ps.close();   } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }

    /**
     * Retrieves all customer reviews, newest first.
     */
    public List<Customer> getAllReviews() {
        List<Customer> reviews = new ArrayList<>();

        // try-with-resources to auto-close Connection, PreparedStatement, ResultSet
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                 "SELECT * FROM customer ORDER BY id DESC"
             );
             ResultSet rs = ps.executeQuery()
        ) {
            // Map each result row to a Customer object
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setId(rs.getInt("id"));
                cus.setName(rs.getString("name"));
                cus.setEmail(rs.getString("email"));
                cus.setMobile(rs.getString("mobile"));
                cus.setRate(rs.getString("rating"));
                cus.setComment(rs.getString("comment"));
                reviews.add(cus);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reviews;
    }

    /**
     * Updates an existing customer review identified by email+mobile.
     */
    public void updateReview(Customer cus) {
        // Encapsulation: extract and sanitize fields
        String email   = cus.getEmail().trim();
        String mobile  = cus.getMobile().trim();
        String rate    = cus.getRate();
        String comment = cus.getComment();

        if (rate == null || rate.trim().isEmpty())    rate    = "Not Given";
        if (comment == null || comment.trim().isEmpty()) comment = "No comment";

        String sql = 
            "UPDATE customer SET rating=?, comment=? " +
            "WHERE LOWER(email)=LOWER(?) AND mobile=?";

        // try-with-resources for safe cleanup
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, rate);
            ps.setString(2, comment);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Deletes a customer review identified by email+mobile.
     */
    public void deleteReview(String email, String mobile) {
        String sql = 
            "DELETE FROM customer WHERE LOWER(email)=LOWER(?) AND mobile=?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, email.trim());
            ps.setString(2, mobile.trim());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
