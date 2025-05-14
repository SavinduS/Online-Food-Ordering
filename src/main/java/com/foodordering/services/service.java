package com.foodordering.services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.Customer;

public class service {

    public boolean insertData(Customer cus) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String name = cus.getName().trim();
            String email = cus.getEmail().trim();
            String mobile = cus.getMobile().trim();
            String rate = cus.getRate();
            String comment = cus.getComment();

            if (rate == null || rate.trim().isEmpty()) rate = "Not Given";
            if (comment == null || comment.trim().isEmpty()) comment = "No comment";

            conn = DBConnect.getConnection();

            // 🔍 Duplicate check
            String checkSql = "SELECT COUNT(*) FROM customer WHERE LOWER(email) = LOWER(?) AND mobile = ?";
            ps = conn.prepareStatement(checkSql);
            ps.setString(1, email);
            ps.setString(2, mobile);
            rs = ps.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                System.out.println("🛑 Duplicate review found for: " + email + " | " + mobile);
                return false;
            }

            rs.close();
            ps.close();

            // ✅ Insert review
            String sql = "INSERT INTO customer (name, email, mobile, rating, comment) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, rate);
            ps.setString(5, comment);
            ps.executeUpdate();

            System.out.println("✅ Review inserted for: " + email);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (ps != null) ps.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }

    public List<Customer> getAllReviews() {
        List<Customer> reviews = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer ORDER BY id DESC");
             ResultSet rs = ps.executeQuery()) {

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

    public void updateReview(Customer cus) {
        try (Connection conn = DBConnect.getConnection()) {
            String email = cus.getEmail().trim();
            String mobile = cus.getMobile().trim();
            String rate = cus.getRate();
            String comment = cus.getComment();

            if (rate == null || rate.trim().isEmpty()) rate = "Not Given";
            if (comment == null || comment.trim().isEmpty()) comment = "No comment";

            String sql = "UPDATE customer SET rating = ?, comment = ? WHERE LOWER(email) = LOWER(?) AND mobile = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, rate);
                ps.setString(2, comment);
                ps.setString(3, email);
                ps.setString(4, mobile);
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteReview(String email, String mobile) {
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM customer WHERE LOWER(email) = LOWER(?) AND mobile = ?")) {
            ps.setString(1, email.trim());
            ps.setString(2, mobile.trim());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
