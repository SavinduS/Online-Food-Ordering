package com.foodordering.servlet;

import com.foodordering.model.CartModel;
import com.foodordering.services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/*
 * OOP Concepts:
  - Inheritance: This class extends HttpServlet.
  - Polymorphism: Overrides the doGet() method of HttpServlet.
  - Encapsulation: Uses CartModel to store and pass order data.
  - Exception Handling: Handles errors using try-catch and forwards to error.jsp.
 */

@WebServlet("/myOrder")
public class MyOrderServlet extends HttpServlet { 
// Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;
    private OrderService orderService;

    // Initialize the service class
    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
    }

    // Polymorphism: doGet method is overridden from HttpServlet
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get current session, do not create if missing
            HttpSession session = request.getSession(false);
            String userEmail = (session != null) ? (String) session.getAttribute("userEmail") : null;

            if (userEmail != null) {
                // Encapsulation: order items stored in CartModel objects
                List<CartModel> orderItems = orderService.getAllOrdersByEmail(userEmail);
                request.setAttribute("orderItems", orderItems);
            } else {
                // Redirect to login if not logged in
                response.sendRedirect("Login.jsp");
                return;
            }

            // Forward to myOrder.jsp to show orders
            request.getRequestDispatcher("myOrder.jsp").forward(request, response);

        } catch (Exception e) {
            // Exception Handling
            e.printStackTrace();
            request.setAttribute("error", "Failed to load your order history.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
