package com.foodordering.services;

import com.foodordering.model.CartItem;
import com.foodordering.Util.DBConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartService {

    public List<CartItem> getCartItemsByUserId(int userId) throws ClassNotFoundException {
        List<CartItem> cartItems = new ArrayList<>();
        String sql = "SELECT c.id, c.food_id, f.name AS food_name, f.price, c.quantity, c.added_at " +
                     "FROM cart c JOIN food f ON c.food_id = f.id WHERE c.user_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setId(rs.getInt("id"));
                item.setUserId(userId);
                item.setFoodId(rs.getInt("food_id"));
                item.setFoodName(rs.getString("food_name"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));
                item.setAddedAt(rs.getTimestamp("added_at"));

                cartItems.add(item);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartItems;
    }
}
