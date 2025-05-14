package com.foodordering.services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.CartModel;

/*
 * OOP Concepts:
 * - Encapsulation: CartModel is used to access data via getters/setters.
 * - Separation of Concerns: Handles DB logic separately from controllers.
 * - Exception Handling: All methods use try-catch or throws to handle SQL errors.
 */

public class CartService {

    // Add an item to the cart table
    public void addCart(CartModel cartModel) throws Exception {
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "INSERT INTO cart (user_email, food_id, quantity) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            // Encapsulation: Access data using getters
            ps.setString(1, cartModel.getUserEmail());
            ps.setInt(2, cartModel.getFoodId());
            ps.setInt(3, cartModel.getQuantity());

            ps.executeUpdate();
        }
    }

    // Update the quantity of an item based on action ("increase" or "decrease")
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

    // Remove a specific item from the cart
    public void removeCart(int cartId) throws Exception {
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "DELETE FROM cart WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cartId);
            ps.executeUpdate();
        }
    }

    // Get all cart items for a specific user by email
    public List<CartModel> getCartItems(String userEmail) throws Exception {
        List<CartModel> list = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT c.id, c.user_email, c.food_id, c.quantity, f.name, f.price, f.image_filename " +
                         "FROM cart c INNER JOIN food f ON c.food_id = f.id WHERE c.user_email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userEmail);
            ResultSet rs = ps.executeQuery();

            // Encapsulation: Fill CartModel using constructor
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

    // Clear all items from the cart for a given user
    public void clearCartByEmail(String email) {
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "DELETE FROM cart WHERE user_email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(); // Exception Handling
        }
    }
}
