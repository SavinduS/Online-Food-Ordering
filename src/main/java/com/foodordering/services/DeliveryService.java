package com.foodordering.services;

import com.foodordering.model.Delivery;
import com.foodordering.model.Payment;
import com.foodordering.Util.*;

import java.sql.*;

public class DeliveryService {

    // Save delivery and return generated delivery ID
    public int saveDeliveryAndReturnId(Delivery delivery) throws ClassNotFoundException {
        String sql = "INSERT INTO delivery (first_name, last_name, email, phone, address, city, postal_code) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, delivery.getFirstName());
            stmt.setString(2, delivery.getLastName());
            stmt.setString(3, delivery.getEmail());
            stmt.setString(4, delivery.getPhone());
            stmt.setString(5, delivery.getAddress());
            stmt.setString(6, delivery.getCity());
            stmt.setString(7, delivery.getPostalCode());

            int affected = stmt.executeUpdate();

            if (affected > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // ✅ Return inserted delivery ID
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    // Save only payment details
    public boolean savePaymentOnly(Payment payment) throws ClassNotFoundException  {
        String sql = "INSERT INTO payment (cardholder_name, card_number, expiry_date, cvv) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, payment.getCardholderName());
            stmt.setString(2, payment.getCardNumber());
            stmt.setString(3, payment.getExpiryDate());
            stmt.setString(4, payment.getCvv());

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Read delivery by ID
    public Delivery getDeliveryById(int id) throws ClassNotFoundException  {
        String sql = "SELECT * FROM delivery WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Delivery delivery = new Delivery();
                delivery.setId(rs.getInt("id")); // ✅ IMPORTANT LINE
                delivery.setFirstName(rs.getString("first_name"));
                delivery.setLastName(rs.getString("last_name"));
                delivery.setEmail(rs.getString("email"));
                delivery.setPhone(rs.getString("phone"));
                delivery.setAddress(rs.getString("address"));
                delivery.setCity(rs.getString("city"));
                delivery.setPostalCode(rs.getString("postal_code"));
                return delivery;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


//update
    public boolean updateDelivery(Delivery delivery) {
        return update(delivery);
    }

    private boolean update(Delivery d) {
    	String sql = "UPDATE delivery SET first_name=?, last_name=?, email=?, phone=?, address=?, city=?, postal_code=? WHERE id=?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

        	stmt.setString(1, d.getFirstName());
        	stmt.setString(2, d.getLastName());
        	stmt.setString(3, d.getEmail());
        	stmt.setString(4, d.getPhone());
        	stmt.setString(5, d.getAddress());
        	stmt.setString(6, d.getCity());
        	stmt.setString(7, d.getPostalCode());
        	stmt.setInt(8, d.getId());


            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


//delete
    public boolean cancelOrder(int id) throws ClassNotFoundException  {
        boolean success = false;

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "DELETE FROM delivery WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id); // only one placeholder, so one value

            success = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
   }

}


