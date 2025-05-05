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

@WebServlet("/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("id"));

        // ✅ Step 1: Create delivery object
        Delivery delivery = new Delivery();
        delivery.setId(orderId);

        // ✅ Step 2: Call service to mark the order as cancelled
        DeliveryService deliveryService = new DeliveryService();
        boolean isCancelled = false;
        try {
            isCancelled = deliveryService.cancelOrder(delivery); // This should do UPDATE not DELETE
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // ✅ Step 3: Redirect back to orders if successful
        if (isCancelled) {
            HttpSession session = request.getSession();
            // Don't remove 'delivery' or 'cartItems' because user may have multiple orders
            response.sendRedirect("myOrder");
        } else {
            response.getWriter().println("❌ Order cancellation failed.");
        }
    }
}
