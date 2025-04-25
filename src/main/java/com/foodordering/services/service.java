package com.foodordering.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodordering.Util.*;

import com.foodordering.model.Customer;

public class service {

    // ✅ Create (Insert)
    public void insertData(Customer cus) {
        try {
            String name = cus.getName();
            String email = cus.getEmail();
            String mobile = cus.getMobile();
            String rate = cus.getRate();
            String comment = cus.getComment();

            if (rate == null || rate.trim().isEmpty()) {
                rate = "Not Given";
            }

            if (comment == null || comment.trim().isEmpty()) {
                comment = "No comment";
            }

            Connection conn = DBConnect.getConnection();
            String sql = "INSERT INTO customer (name, email, mobile, rating, comment) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, rate);
            ps.setString(5, comment);

            ps.executeUpdate();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Read (Select All)
    public List<Customer> getAllReviews() {
        List<Customer> reviews = new ArrayList<>();

        try {
            Connection conn = DBConnect.getConnection();
            String sql = "SELECT * FROM customer ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

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

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reviews;
    }

    // ✅ Update (Rating + Comment only)
    public void updateReview(Customer cus) {
        try {
            String name = cus.getName();
            String email = cus.getEmail();
            String mobile = cus.getMobile();
            String rate = cus.getRate();
            String comment = cus.getComment();

            if (rate == null || rate.trim().isEmpty()) {
                rate = "Not Given";
            }

            if (comment == null || comment.trim().isEmpty()) {
                comment = "No comment";
            }

            Connection conn = DBConnect.getConnection();
            String sql = "UPDATE customer SET rating = ?, comment = ? WHERE name = ? AND email = ? AND mobile = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, rate);
            ps.setString(2, comment);
            ps.setString(3, name);
            ps.setString(4, email);
            ps.setString(5, mobile);

            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Delete (Identify by name + email + mobile)
    public void deleteReview(String name, String email, String mobile) {
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "DELETE FROM customer WHERE name = ? AND email = ? AND mobile = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);

            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
