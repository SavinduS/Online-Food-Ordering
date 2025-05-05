package com.foodordering.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.UserLoginModel;
import com.foodordering.model.employee;

public class LoginService {

    // Validate admin
	public String getEmployeePosition(employee emp) {
	    String position = null;
	    try (Connection conn = DBConnect.getConnection()) {
	        String sql = "SELECT position FROM employee WHERE email = ? AND password = ?";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, emp.getEmail());
	        stmt.setString(2, emp.getPassword());
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            position = rs.getString("position"); // "Manager", "Staff", etc.
	        }
	        rs.close();
	        stmt.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return position;
	}



    // Validate customer
    public boolean validateCustomer(UserLoginModel user) {
        boolean isCustomer = false;
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT * FROM customerregistration WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                isCustomer = true;
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isCustomer;
    }
}
