package com.foodordering.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodordering.model.*;
import com.foodordering.services.*;

;



@WebServlet("/UserRegServelet")
public class UserRegServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserRegServelet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserModel UserModel= new UserModel();
		
		UserModel.setFirstname(request.getParameter("firstName"));
		UserModel.setLastname(request.getParameter("lastName"));
		UserModel.setEmail(request.getParameter("email"));
		UserModel.setPassword(request.getParameter("password"));
		UserModel.setConfirmpass(request.getParameter("confirmPassword"));
		UserModel.setPhonenumber(request.getParameter("phone"));
		
		UserService service= new com.foodordering.services.UserService();
		
		service.insertData(UserModel);
		
		RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
		
		dis.forward(request, response);
	}

}
