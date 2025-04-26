package com.foodordering.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.CartService;
import com.foodordering.model.CartModel;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String userEmail = (String) request.getSession().getAttribute("userEmail");

            if (userEmail == null) {
                response.sendRedirect("Login.jsp");
                return;
            }

            List<CartModel> cartItems = cartService.getCartItems(userEmail);

            request.setAttribute("cartItems", cartItems);

            request.getRequestDispatcher("cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error loading cart: " + e.getMessage());
        }
    }
}
