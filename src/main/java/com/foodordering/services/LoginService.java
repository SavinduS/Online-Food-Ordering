package com.foodordering.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodordering.Util.*;
import com.foodordering.model.*;

public class LoginService {

    public boolean validateLogin(UserLoginModel user) {
        boolean isValid = false;

        try {
            Connection conn = DBConnect.getConnection();

            String sql = "SELECT * FROM customerregistration WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                isValid = true;
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isValid;
    }
}

