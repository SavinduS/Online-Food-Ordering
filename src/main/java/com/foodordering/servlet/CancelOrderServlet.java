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

        // ✅ Create a Delivery object and set the ID
        Delivery delivery = new Delivery();
        delivery.setId(orderId);

        DeliveryService deliveryService = new DeliveryService();
        boolean isCancelled = false;
        try {
            isCancelled = deliveryService.cancelOrder(delivery);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (isCancelled) {
            HttpSession session = request.getSession();
            session.removeAttribute("delivery");
            session.removeAttribute("cartItems");

            response.sendRedirect("myOrder.jsp");
        } else {
            response.getWriter().println("Order cancellation failed.");
        }
    }
}

