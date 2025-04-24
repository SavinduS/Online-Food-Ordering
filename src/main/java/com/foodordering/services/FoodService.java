package com.foodordering.service;

import com.foodordering.model.Food;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodService {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/onlinefoodordering";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "123456";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ This is required for MySQL 8+
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    public List<Food> getAllFoods() {
        List<Food> foodList = new ArrayList<>();
        String sql = "SELECT * FROM food";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                foodList.add(mapResultSetToFood(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodList;
    }

    public List<Food> getFoodsByCategory(String category) {
        List<Food> foodList = new ArrayList<>();
        String sql = "SELECT * FROM food WHERE category = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, category);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    foodList.add(mapResultSetToFood(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foodList;
    }

    public Food getFoodById(int id) {
        String sql = "SELECT * FROM food WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToFood(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Food mapResultSetToFood(ResultSet rs) throws SQLException {
        Food food = new Food();
        food.setId(rs.getInt("id"));
        food.setName(rs.getString("name"));
        food.setCategory(rs.getString("category"));
        food.setPrice(rs.getDouble("price"));
        food.setImageFilename(rs.getString("image_filename"));
        return food;
    }
}
