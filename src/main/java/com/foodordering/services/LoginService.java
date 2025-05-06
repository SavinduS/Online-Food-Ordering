package com.foodordering.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.UserLoginModel;
import com.foodordering.model.employee;

public class LoginService {

    // Validate admin
	public employee validateEMP(String email, String password) {
	    employee emp = null;
	    try (Connection conn = DBConnect.getConnection()) {
	        String sql = "SELECT * FROM employee WHERE email = ? AND password = ?";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, email);
	        stmt.setString(2, password);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            emp = new employee();
	            emp.setEmpID(rs.getInt("empID"));
	            emp.setName(rs.getString("name"));
	            emp.setEmail(rs.getString("email"));
	            emp.setPhone_num(rs.getString("phone_num"));
	            emp.setNIC(rs.getString("NIC"));
	            emp.setPosition(rs.getString("position"));
	            emp.setPassword(rs.getString("password"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return emp;
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
