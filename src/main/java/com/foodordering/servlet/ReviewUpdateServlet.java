package com.foodordering.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import com.foodordering.model.Customer;
import com.foodordering.services.service;

/*
 
   OOP Concepts:
   Inheritance: This class extends HttpServlet.
   Polymorphism: Overrides doPost() to process the update.
   Encapsulation: Uses Customer model and sets values via setters.
   Exception Handling: try-catch used to catch DB or logic errors.
 */

@WebServlet("/ReviewUpdateServlet")
public class ReviewUpdateServlet extends HttpServlet { // Inheritance

    private static final long serialVersionUID = 1L;

    // Polymorphism: Override doPost to handle form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Read updated review details from form
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String rating = request.getParameter("rating");
            String comment = request.getParameter("comment");

            // Encapsulation: Fill Customer object using setters
            Customer cus = new Customer();
            cus.setEmail(email);
            cus.setMobile(mobile);
            cus.setRate(rating);
            cus.setComment(comment);

            // Call service layer to update the review in DB
            service service = new service();
            service.updateReview(cus);

            // Redirect to review display with success confirmation
            response.sendRedirect("displayReviews?success=updated&email=" + email + "&mobile=" + mobile);

        } catch (Exception e) {
            // Exception Handling: Redirect with error flag
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=update");
        }
    }
}
