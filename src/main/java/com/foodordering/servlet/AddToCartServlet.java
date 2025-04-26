package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.CartService;
import com.foodordering.model.CartModel;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    CartService cartService = new CartService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String userEmail = (String) request.getSession().getAttribute("userEmail");
            String foodIdStr = request.getParameter("food_id");

            if (userEmail == null || foodIdStr == null) {
                response.sendRedirect("Login.jsp");
                return;
            }

            int foodId = Integer.parseInt(foodIdStr);

            CartModel cart = new CartModel();
            cart.setUserEmail(userEmail);
            cart.setFoodId(foodId);
            cart.setQuantity(1);

            cartService.addCart(cart);

            response.sendRedirect("cart");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding to cart: " + e.getMessage());
        }
    }
}
