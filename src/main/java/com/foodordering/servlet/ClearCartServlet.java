package com.foodordering.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.CartService;

import java.io.IOException;

@WebServlet("/clear-cart") // 🟢 This is what maps the servlet to the URL
public class ClearCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CartService cartService = new CartService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail != null) {
                cartService.clearCartByEmail(userEmail);
            }

            session.removeAttribute("cartItems");

            response.sendRedirect("myOrder");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error clearing cart: " + e.getMessage());
        }
    }
}
