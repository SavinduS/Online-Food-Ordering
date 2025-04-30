package com.foodordering.services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.CartModel;

public class CartService {

    // Add to Cart
    public void addCart(CartModel cartModel) throws Exception {
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "INSERT INTO cart (user_email, food_id, quantity) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cartModel.getUserEmail());
            ps.setInt(2, cartModel.getFoodId());
            ps.setInt(3, cartModel.getQuantity());
            ps.executeUpdate();
        }
    }

    // Update Quantity
    public void updateQuantity(int cartId, String action) throws Exception {
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "";
            if ("increase".equals(action)) {
                sql = "UPDATE cart SET quantity = quantity + 1 WHERE id = ?";
            } else if ("decrease".equals(action)) {
                sql = "UPDATE cart SET quantity = quantity - 1 WHERE id = ? AND quantity > 1";
            }

            if (!sql.isEmpty()) {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, cartId);
                ps.executeUpdate();
            }
        }
    }

    // Remove Cart Item
    public void removeCart(int cartId) throws Exception {
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "DELETE FROM cart WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cartId);
            ps.executeUpdate();
        }
    }

    // Get Cart Items by userEmail
    public List<CartModel> getCartItems(String userEmail) throws Exception {
        List<CartModel> list = new ArrayList<>();
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT c.id, c.user_email, c.food_id, c.quantity, f.name, f.price, f.image_filename " +
                         "FROM cart c INNER JOIN food f ON c.food_id = f.id WHERE c.user_email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userEmail);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CartModel cart = new CartModel(
                    rs.getInt("id"),
                    rs.getString("user_email"),
                    rs.getInt("food_id"),
                    rs.getInt("quantity"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("image_filename")
                );
                list.add(cart);
            }
        }
        return list;
    }

    // ✅ Clear all cart items for a specific user
    public void clearCartByEmail(String email) {
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "DELETE FROM cart WHERE user_email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
