package com.foodordering.services;

import com.foodordering.model.UpdateStatusModel;
import com.foodordering.Util.DBConnect;
import java.sql.*;
import java.util.*;

public class UpdateStatusService {
	
	 public List<UpdateStatusModel> getAllOrders() {
	        List<UpdateStatusModel> list = new ArrayList<>();
	        String sql = "SELECT o.id AS order_id, d.first_name, d.last_name, d.phone, d.address, d.city, d.postal_code, " +
	                     "o.food_name, o.quantity, o.price, o.status " +
	                     "FROM delivery d JOIN orders o ON d.id = o.delivery_id " +
	                     "ORDER BY o.id DESC";

	        try (Connection conn = DBConnect.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {

	            while (rs.next()) {
	                UpdateStatusModel o = new UpdateStatusModel();
	                o.setOrderId(rs.getInt("order_id"));
	                o.setFirstName(rs.getString("first_name"));
	                o.setLastName(rs.getString("last_name"));
	                o.setPhone(rs.getString("phone"));
	                o.setAddress(rs.getString("address"));
	                o.setCity(rs.getString("city"));
	                o.setPostalCode(rs.getString("postal_code"));
	                o.setFoodName(rs.getString("food_name"));
	                o.setQuantity(rs.getInt("quantity"));
	                o.setPrice(rs.getDouble("price"));
	                o.setStatus(rs.getString("status"));
	                list.add(o);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }

	    public void updateOrderStatus(int orderId, String newStatus) {
	        String sql = "UPDATE orders SET status = ? WHERE id = ?";

	        try (Connection conn = DBConnect.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            ps.setString(1, newStatus);
	            ps.setInt(2, orderId);
	            ps.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

}
