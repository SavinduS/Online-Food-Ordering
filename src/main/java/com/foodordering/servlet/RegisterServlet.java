package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.Customer;
import com.foodordering.services.service;

/*
 
 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: The doPost() method is overridden to handle POST requests.
 * - Encapsulation: Customer object fields are accessed via setters.
 * - Separation of Concerns: This servlet only handles control flow; database logic is delegated to the service class.
 *
 */

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Polymorphism: Overriding doPost to handle form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Read and sanitize form inputs
            String name = request.getParameter("name").trim();
            String email = request.getParameter("email").trim();
            String mobile = request.getParameter("mobile").trim();
            String rating = request.getParameter("rating");
            String comment = request.getParameter("message");

            // Create and populate the model object (Customer)
            Customer cus = new Customer();
            cus.setName(name);
            cus.setEmail(email);
            cus.setMobile(mobile);
            cus.setRate(rating);
            cus.setComment(comment);

            // Call the service layer to insert data
            service service = new service();
            boolean inserted = service.insertData(cus); // returns false if review already exists

            // Redirect based on insertion result
            if (inserted) {
                response.sendRedirect("displayReviews?success=true&email=" + email + "&mobile=" + mobile);
            } else {
                response.sendRedirect("ReviewCreate.jsp?duplicate=true");
            }

        } catch (Exception e) {
            // Exception handling with fallback redirection
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=true");
        }
    }
}
