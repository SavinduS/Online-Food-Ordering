package com.foodordering.servlet;

import com.foodordering.model.CartModel;
import com.foodordering.services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/myOrder")
public class MyOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession(false); // don't create new session
            String userEmail = (session != null) ? (String) session.getAttribute("userEmail") : null;

            if (userEmail != null) {
                List<CartModel> orderItems = orderService.getAllOrdersByEmail(userEmail);
                request.setAttribute("orderItems", orderItems);
            } else {
                // Redirect to login if session expired or not logged in
                response.sendRedirect("Login.jsp");
                return;
            }

            request.getRequestDispatcher("myOrder.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load your order history.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
