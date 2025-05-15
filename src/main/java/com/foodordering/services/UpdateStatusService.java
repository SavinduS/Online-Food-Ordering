package com.foodordering.services;

import com.foodordering.model.UpdateStatusModel;
import com.foodordering.Util.DBConnect;
import java.sql.*;
import java.util.*;

public class UpdateStatusService {
	
	 public List<UpdateStatusModel> getAllOrders() {
	        List<UpdateStatusModel> list = new ArrayList<>();
	        
	        //table joining
	        String query = "SELECT o.id AS order_id, d.first_name, d.last_name, d.phone, d.address, d.city, d.postal_code, " +
	                     "o.food_name, o.quantity, o.price, o.status " +
	                     "FROM delivery d JOIN orders o ON d.id = o.delivery_id " +
	                     "ORDER BY o.id DESC";

	        try {
	        	Connection conn = DBConnect.getConnection();
	    		Statement statement = DBConnect.getConnection().createStatement();
	            ResultSet rs = statement.executeQuery(query); 
	            
	         // Loop through the result and add to the list
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

	 public boolean updateOrderStatus(int orderId, String newStatus) {
		    boolean isSuccess = false;

		    try {
		    	Connection conn = DBConnect.getConnection();
		        Statement statement = DBConnect.getConnection().createStatement();

		        String query = "UPDATE orders SET status='" + newStatus + "' WHERE id='" + orderId + "'";
		        
		        //execute query
		        int result = statement.executeUpdate(query);
		        statement.close();

		        if (result > 0) {
		            isSuccess = true;
		        } else {
		            isSuccess = false;
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return isSuccess;
		}


}
