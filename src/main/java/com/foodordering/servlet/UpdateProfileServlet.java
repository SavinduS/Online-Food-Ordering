package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.*;

/*

 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: Overrides the doPost() method from the parent class.
 * - Encapsulation: User data is passed and updated through the UserService class.
 * - Exception Handling: All logic is wrapped inside try-catch.
 */

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet { // Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;

    // Polymorphism: Overrides the doPost method to process form submissions
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get user input values from the request
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Create instance of service layer
        UserService service = new UserService();

        try {
            // Check if password update is requested
            if (password != null && !password.isEmpty()) {
                if (password.equals(confirmPassword)) {
                    // Encapsulation: UserService handles update logic with model fields
                    service.updateUserWithPassword(email, firstName, lastName, phone, password);
                } else {
                    // Validation failed - passwords do not match
                    request.setAttribute("error", "Passwords do not match.");
                    RequestDispatcher dis = request.getRequestDispatcher("UserProfile.jsp");
                    dis.forward(request, response);
                    return;
                }
            }

            // Redirect back to profile after successful update
            response.sendRedirect("UserProfile.jsp");

        } catch (Exception e) {
            // Exception Handling
            e.printStackTrace();
            request.setAttribute("error", "Update failed.");
            RequestDispatcher dis = request.getRequestDispatcher("UserProfile.jsp");
            dis.forward(request, response);
        }
    }
}
