package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.CartService;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    CartService cartService = new CartService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String cartIdStr = request.getParameter("cart_id");
            String action = request.getParameter("action");

            if (cartIdStr == null || action == null) {
                response.sendRedirect("cart");
                return;
            }

            int cartId = Integer.parseInt(cartIdStr);

            cartService.updateQuantity(cartId, action);

            response.sendRedirect("cart");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating cart: " + e.getMessage());
        }
    }
}
