package com.foodordering.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.CartModel;

public class OrderService {

    // ✅ Save confirmed cart items to 'orders' table
    public void saveOrderItems(int deliveryId, List<CartModel> cartItems) throws Exception {
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "INSERT INTO orders(delivery_id, food_id, food_name, quantity, price, image_filename, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, 'Processing')";
            PreparedStatement ps = conn.prepareStatement(sql);

            for (CartModel item : cartItems) {
                ps.setInt(1, deliveryId);
                ps.setInt(2, item.getFoodId());
                ps.setString(3, item.getFoodName());
                ps.setInt(4, item.getQuantity());
                ps.setDouble(5, item.getPrice());
                ps.setString(6, item.getImageFilename());
                ps.addBatch();
            }

            ps.executeBatch();
            ps.close();
        }
    }

    // ✅ Fetch all order items from 'orders' table (for admin or all users)
    public List<CartModel> getAllOrderItems() throws Exception {
        List<CartModel> orderItems = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT delivery_id, food_id, food_name, quantity, price, image_filename FROM orders ORDER BY delivery_id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CartModel item = new CartModel();
                item.setFoodId(rs.getInt("food_id"));
                item.setFoodName(rs.getString("food_name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setImageFilename(rs.getString("image_filename"));

                orderItems.add(item);
            }

            rs.close();
            ps.close();
        }

        return orderItems;
    }

    // ✅ Fetch order items by delivery ID (used in MyOrderServlet)
    public static List<CartModel> getOrderItemsByDeliveryId(int deliveryId) throws Exception {
        List<CartModel> orderItems = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT food_id, food_name, quantity, price, image_filename FROM orders WHERE delivery_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, deliveryId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CartModel item = new CartModel();
                item.setFoodId(rs.getInt("food_id"));
                item.setFoodName(rs.getString("food_name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setImageFilename(rs.getString("image_filename"));
                orderItems.add(item);
            }

            rs.close();
            ps.close();
        }

        return orderItems;
    }
}
