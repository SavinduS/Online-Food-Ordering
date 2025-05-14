package com.foodordering.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import com.foodordering.services.service;

/*
 
 * OOP Concepts:
   Inheritance: This class extends HttpServlet.
   Polymorphism: Overrides doPost() method to handle form submission.
   Encapsulation: Review data is passed through service layer.
   Exception Handling: try-catch block protects from runtime failure.
 */

@WebServlet("/ReviewDeleteServlet")
public class ReviewDeleteServlet extends HttpServlet { // Inheritance

    private static final long serialVersionUID = 1L;

    // Polymorphism: Overrides doPost to handle deletion logic
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Read email and mobile from request (used to uniquely identify the review)
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");

            // Call service layer to delete review
            service service = new service();
            service.deleteReview(email, mobile);

            // Redirect to display page with confirmation
            response.sendRedirect("displayReviews?success=true&deleted=true");

        } catch (Exception e) {
            // Exception Handling: Redirect with error flag
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=delete");
        }
    }
}
