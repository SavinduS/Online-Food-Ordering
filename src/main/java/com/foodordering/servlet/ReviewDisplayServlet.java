package com.foodordering.servlet;

import com.foodordering.model.Customer;
import com.foodordering.services.service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/*
 
 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: doGet() is overridden to handle GET requests.
 * - Encapsulation: Uses Customer model objects with getter/setter methods.
 * - Exception Handling: try-catch ensures graceful error handling.
 
 */

@WebServlet("/displayReviews")
public class ReviewDisplayServlet extends HttpServlet { // Inheritance

    private static final long serialVersionUID = 1L;

    // Polymorphism: Overriding doGet() to handle data loading and redirection
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Instantiate service (DAO-like layer)
            service s = new service();

            // Get all reviews from the database
            List<Customer> allReviews = s.getAllReviews();

            // Limit to latest 6 reviews for display
            List<Customer> latest6 = allReviews.stream().limit(6).toList();

            // Set data for the view (JSP)
            request.setAttribute("reviews", latest6); // Review list
            request.setAttribute("email", request.getParameter("email"));     // Optional feedback param
            request.setAttribute("mobile", request.getParameter("mobile"));
            request.setAttribute("success", request.getParameter("success")); // For showing success alert
            request.setAttribute("deleted", request.getParameter("deleted")); // For showing delete confirmation

            // Forward to the JSP view
            request.getRequestDispatcher("ReviewDisplay.jsp").forward(request, response);

        } catch (Exception e) {
            // If any exception occurs, redirect to form with error flag
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=load");
        }
    }
}
