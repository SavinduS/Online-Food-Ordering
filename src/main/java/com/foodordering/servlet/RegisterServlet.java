package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.Customer;
import com.foodordering.services.service;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 🔁 Read and sanitize form input
            String name = request.getParameter("name").trim();
            String email = request.getParameter("email").trim();
            String mobile = request.getParameter("mobile").trim();
            String rating = request.getParameter("rating");
            String comment = request.getParameter("message");

            // ✅ Logging for debugging
            System.out.println("🔥 RegisterServlet: Form received");
            System.out.println("Name: " + name + " | Email: " + email + " | Mobile: " + mobile);

            // 👤 Create model
            Customer cus = new Customer();
            cus.setName(name);
            cus.setEmail(email);
            cus.setMobile(mobile);
            cus.setRate(rating);
            cus.setComment(comment);

            // 🚀 Insert review
            service service = new service();
            boolean inserted = service.insertData(cus);

            if (inserted) {
                response.sendRedirect("displayReviews?success=true&email=" + email + "&mobile=" + mobile);
            } else {
                response.sendRedirect("ReviewCreate.jsp?duplicate=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=true");
        }
    }
}
