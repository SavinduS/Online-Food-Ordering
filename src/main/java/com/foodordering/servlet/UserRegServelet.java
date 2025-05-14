package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.*;
import com.foodordering.services.*;

/*
 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: Overrides doGet() and doPost() methods.
 * - Encapsulation: Uses UserModel and sets data via setter methods.
 */

@WebServlet("/UserRegServelet")
public class UserRegServelet extends HttpServlet { // Inheritance: This class extends HttpServlet

	private static final long serialVersionUID = 1L;
	
	// Default constructor
	public UserRegServelet() {
		super();
	}

	// Polymorphism: Overriding doGet method (not used for form here)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	// Polymorphism: Overriding doPost method to handle registration form
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Create new UserModel object and fill it using encapsulation (setters)
		UserModel UserModel = new UserModel();
		UserModel.setFirstname(request.getParameter("firstName"));
		UserModel.setLastname(request.getParameter("lastName"));
		UserModel.setEmail(request.getParameter("email"));
		UserModel.setPassword(request.getParameter("password"));
		UserModel.setConfirmpass(request.getParameter("confirmPassword"));
		UserModel.setPhonenumber(request.getParameter("phone"));

		// Call service layer to save user
		UserService service = new UserService();
		service.insertData(UserModel);

		// Forward user to login page after successful registration
		RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
		dis.forward(request, response);
	}
}
