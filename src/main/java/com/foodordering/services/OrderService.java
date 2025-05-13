package com.foodordering.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.CartModel;

public class OrderService {

    // Save all cart items as order records linked to a delivery ID
    public void saveOrderItems(int deliveryId, List<CartModel> cartItems) throws Exception {
        String sql = "INSERT INTO orders(delivery_id, food_id, food_name, quantity, price, image_filename, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, 'Processing')";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Loop through all cart items and add to batch
            for (CartModel item : cartItems) {
                ps.setInt(1, deliveryId);
                ps.setInt(2, item.getFoodId());
                ps.setString(3, item.getFoodName());
                ps.setInt(4, item.getQuantity());
                ps.setDouble(5, item.getPrice());
                ps.setString(6, item.getImageFilename());
                ps.addBatch();
            }

            // Execute batch insert for performance
            ps.executeBatch();
        }
    }

    // Get all order records for a user based on their email
    public List<CartModel> getAllOrdersByEmail(String email) throws Exception {
        List<CartModel> allOrders = new ArrayList<>();

        String sql = "SELECT o.*, d.first_name, d.last_name, d.address, d.city, d.phone, d.postal_code " +
                     "FROM orders o " +
                     "JOIN delivery d ON o.delivery_id = d.id " +
                     "WHERE d.email = ? ORDER BY o.delivery_id DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            // Loop through the result set and map data to CartModel objects
            while (rs.next()) {
                CartModel item = new CartModel();
                item.setFoodId(rs.getInt("food_id"));
                item.setFoodName(rs.getString("food_name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setImageFilename(rs.getString("image_filename"));
                item.setStatus(rs.getString("status"));
                item.setDeliveryId(rs.getInt("delivery_id"));
                allOrders.add(item);
            }

            rs.close();
        }

        return allOrders;
    }

    // Get all items in a single order based on delivery ID (used in invoice or confirmation page)
    public List<CartModel> getOrderItemsByDeliveryId(int deliveryId) throws Exception {
        List<CartModel> orderItems = new ArrayList<>();

        String sql = "SELECT food_id, food_name, quantity, price, image_filename, status " +
                     "FROM orders WHERE delivery_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, deliveryId);
            ResultSet rs = ps.executeQuery();

            // Map each result row to a CartModel object
            while (rs.next()) {
                CartModel item = new CartModel();
                item.setFoodId(rs.getInt("food_id"));
                item.setFoodName(rs.getString("food_name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setImageFilename(rs.getString("image_filename"));
                item.setStatus(rs.getString("status"));
                item.setDeliveryId(deliveryId);
                orderItems.add(item);
            }

            rs.close();
        }

        return orderItems;
    }
}
