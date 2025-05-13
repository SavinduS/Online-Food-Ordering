package com.foodordering.services;

import com.foodordering.model.Food;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodService {

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/onlinefoodordering";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "12345";

    // Creates and returns a new DB connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    // Static block to load MySQL JDBC driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Get all food items from the database
    public List<Food> getAllFoods() {
        List<Food> foodList = new ArrayList<>();
        String sql = "SELECT * FROM food";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                foodList.add(mapResultSetToFood(rs)); // Use encapsulation to set values
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return foodList;
    }

    // Get food items by specific category
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

    // Get a food item by its ID
    public Food getFoodById(int id) {
        String sql = "SELECT * FROM food WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToFood(rs); // Uses private method to map values
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Private helper method to map database result to a Food object
    private Food mapResultSetToFood(ResultSet rs) throws SQLException {
        Food food = new Food();

        // Encapsulation: setting values using setter methods
        food.setId(rs.getInt("id"));
        food.setName(rs.getString("name"));
        food.setCategory(rs.getString("category"));
        food.setPrice(rs.getDouble("price"));
        food.setImageFilename(rs.getString("image_filename"));

        return food;
    }
}
