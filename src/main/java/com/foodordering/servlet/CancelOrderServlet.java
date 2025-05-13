package com.foodordering.servlet;

import com.foodordering.model.Delivery;
import com.foodordering.services.DeliveryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

/*
 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: This class overrides the doPost() method from HttpServlet.
 * - Encapsulation: Delivery object is used to hold and pass data using setters.
 */

@WebServlet("/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {

    // Inheritance: This class inherits from HttpServlet and uses its features

    // Polymorphism: Overriding the doPost method from the HttpServlet superclass
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get order ID from the form (from hidden input field)
        int orderId = Integer.parseInt(request.getParameter("id"));

        // Encapsulation: create Delivery object and set value using setter
        Delivery delivery = new Delivery();
        delivery.setId(orderId);

        // Use service layer to cancel the order
        DeliveryService deliveryService = new DeliveryService();
        boolean isCancelled = false;

        try {
            isCancelled = deliveryService.cancelOrder(delivery);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (isCancelled) {
            HttpSession session = request.getSession();
            response.sendRedirect("myOrder");
        } else {
            response.getWriter().println("Order cancellation failed.");
        }
    }
}
