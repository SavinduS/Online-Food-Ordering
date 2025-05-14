package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/*
 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: Overrides the doGet() method.
 * - Session Handling: Invalidates the current session.
 */

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet { // Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;

    // Polymorphism: Overriding doGet method to process logout
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get existing session (do not create a new one)
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate(); // Clear all session attributes (logout)
        }

        // Redirect to login page after logout
        response.sendRedirect("Login.jsp");
    }
}
