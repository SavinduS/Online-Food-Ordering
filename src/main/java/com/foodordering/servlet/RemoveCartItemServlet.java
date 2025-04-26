package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.CartService;

@WebServlet("/remove-cart-item")
public class RemoveCartItemServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    CartService cartService = new CartService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String cartIdStr = request.getParameter("cart_id");

            if (cartIdStr == null) {
                response.sendRedirect("cart");
                return;
            }

            int cartId = Integer.parseInt(cartIdStr);

            cartService.removeCart(cartId);

            response.sendRedirect("cart");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error removing cart item: " + e.getMessage());
        }
    }
}
