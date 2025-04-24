package com.foodordering.servlet;

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

        DeliveryService deliveryService = new DeliveryService();
        boolean isCancelled = false;
		try {
			isCancelled = deliveryService.cancelOrder(orderId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        if (isCancelled) {
        	
        	 // ✅ Remove the delivery from session
            HttpSession session = request.getSession();
            session.removeAttribute("delivery");  // or clear specific list if you're storing multiple

            // ✅ Optional: Also remove cartItems if related
            session.removeAttribute("cartItems");
            
            response.sendRedirect("myOrder.jsp");
        } else {
            response.getWriter().println("Order cancellation failed.");
        }
    }
}
