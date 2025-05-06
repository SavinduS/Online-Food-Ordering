package com.foodordering.servlet;

import com.foodordering.model.employee;
import com.foodordering.Util.DBConnect;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet("/employeeProfile")
public class employeeProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public employeeProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int empID = Integer.parseInt(request.getParameter("empID"));
        String phone = request.getParameter("phone_num");
        String password = request.getParameter("password");
        String confirm = request.getParameter("password_confirm");

        if (!password.isEmpty() && !password.equals(confirm)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("EmployeeProfile.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnect.getConnection()) {
            String sql = password.isEmpty() ?
                "UPDATE employee SET phone_num = ? WHERE empID = ?" :
                "UPDATE employee SET phone_num = ?, password = ?, password_confirm = ? WHERE empID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, phone);
            if (!password.isEmpty()) {
                stmt.setString(2, password);
                stmt.setString(3, confirm);
                stmt.setInt(4, empID);
            } else {
                stmt.setInt(2, empID);
            }

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("EmployeeProfile.jsp");
    }
	}


