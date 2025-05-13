package com.foodordering.services;

import com.foodordering.model.Delivery;
import com.foodordering.model.Payment;
import com.foodordering.Util.DBConnect;

import java.sql.*;

public class DeliveryService {

    // This method inserts delivery details and returns the auto-generated delivery ID.
    public int saveDeliveryAndReturnId(Delivery delivery) throws ClassNotFoundException {
        String sql = "INSERT INTO delivery (first_name, last_name, email, phone, address, city, postal_code) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Using encapsulated values from the Delivery object
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
                    return rs.getInt(1); // Returns generated delivery ID
                }
            }

        } catch (SQLException e) {
            // Exception handling used here
            e.printStackTrace();
        }

        return -1;
    }

    // This method saves payment details only
    public boolean savePaymentOnly(Payment payment) throws ClassNotFoundException {
        String sql = "INSERT INTO payment (cardholder_name, card_number, expiry_date, cvv) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Encapsulation: Accessing data via getters
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

    // This method deletes orders based on delivery ID
    public boolean cancelOrder(Delivery delivery) throws ClassNotFoundException {
        boolean success = false;

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "DELETE FROM orders WHERE delivery_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, delivery.getId()); // Encapsulated getter method

            int rowsDeleted = stmt.executeUpdate();
            success = rowsDeleted > 0;

            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    // Public method to update delivery, calls the reusable private method
    public boolean updateDelivery(Delivery delivery) {
        return update(delivery); // Reusability example
    }

    // Private helper method to perform delivery update logic
    private boolean update(Delivery d) {
        String sql = "UPDATE delivery SET first_name=?, last_name=?, email=?, phone=?, address=?, city=?, postal_code=? WHERE id=?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Setting new data using model class getters (Encapsulation)
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
            e.printStackTrace(); // Exception handling used
        }

        return false;
    }

    // This method returns a Delivery object by its ID
    public Delivery getDeliveryById(int id) {
        String sql = "SELECT * FROM delivery WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            // Mapping database record to Delivery object (Encapsulation)
            if (rs.next()) {
                Delivery delivery = new Delivery();
                delivery.setId(rs.getInt("id"));
                delivery.setFirstName(rs.getString("first_name"));
                delivery.setLastName(rs.getString("last_name"));
                delivery.setEmail(rs.getString("email"));
                delivery.setPhone(rs.getString("phone"));
                delivery.setAddress(rs.getString("address"));
                delivery.setCity(rs.getString("city"));
                delivery.setPostalCode(rs.getString("postal_code"));
                return delivery;
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }
}
