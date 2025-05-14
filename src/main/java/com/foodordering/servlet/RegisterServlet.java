package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.Customer;
import com.foodordering.services.*;

/*
 
 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: Overrides doPost() method to process review form.
 * - Encapsulation: Uses Customer model to hold user-submitted data.
 * - Exception Handling: try-catch block to catch and redirect on failure.
 */

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet { // Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;

    // Polymorphism: Overriding doPost method to handle review submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Encapsulation: create and populate Customer object
            Customer cus = new Customer();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String rating = request.getParameter("rating");
            String comment = request.getParameter("message");

            cus.setName(name);
            cus.setEmail(email);
            cus.setMobile(mobile);
            cus.setRate(rating);
            cus.setComment(comment);

            // Call service layer to insert data
            service service = new service();
            service.insertData(cus);

            // Redirect with parameters to enable update/delete in review-list
            response.sendRedirect("review-list?name=" + name + "&email=" + email + "&mobile=" + mobile);

        } catch (Exception e) {
            // Exception Handling: redirect to form with error flag
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=true");
        }
    }
}
