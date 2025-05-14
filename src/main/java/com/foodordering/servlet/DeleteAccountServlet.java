package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.*;

/*
 
 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: Overrides the doPost() method of HttpServlet.
 * - Exception Handling: Errors are handled using try-catch block.
 */

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet { // Inheritance: This class extends HttpServlet
    private static final long serialVersionUID = 1L;

    // Polymorphism: Overriding doPost method to handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user email from form input
        String email = request.getParameter("email");

        try {
            // Use service layer to delete the user
            UserService service = new UserService();
            service.deleteUserByEmail(email);

            // Invalidate current session after deleting the user
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate(); // Logs out the user
            }

            // Redirect to login page after successful deletion
            response.sendRedirect("Login.jsp");

        } catch (Exception e) {
            // Exception Handling: Redirect back with error message
            e.printStackTrace();
            request.setAttribute("error", "Account deletion failed.");
            RequestDispatcher dis = request.getRequestDispatcher("UserProfile.jsp");
            dis.forward(request, response);
        }
    }
}
