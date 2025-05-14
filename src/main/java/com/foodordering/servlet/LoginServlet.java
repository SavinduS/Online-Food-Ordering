package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.*;
import com.foodordering.services.*;

/*
 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: Overrides doPost() method to handle login request.
 * - Encapsulation: Uses model classes (employee, UserLoginModel) to pass credentials.
 * - Session Handling: Stores login state and user roles using HttpSession.
 */

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet { // Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;

    // Polymorphism: Overriding doPost method to handle login form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get credentials from request
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Encapsulation: Pass credentials via model objects
        employee emp = new employee(email, password);
        UserLoginModel user = new UserLoginModel(email, password);

        // Call service to validate login
        LoginService service = new LoginService();
        employee employee = service.validateEMP(email, password); // Validate admin

        // Admin Login Success
        if (employee != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedEmployee", employee); // Store user object
            session.setAttribute("role", employee.getPosition()); // Store role
            response.sendRedirect("AdminDashboard.jsp");

        // Customer Login Success
        } else if (service.validateCustomer(user)) {
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);
            session.setAttribute("role", "user");
            response.sendRedirect("home");

        // Login Failed
        } else {
            request.setAttribute("error", "Invalid email or password");
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        }
    }
}
