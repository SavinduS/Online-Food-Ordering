package com.foodordering.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.CartModel;

@WebServlet("/remove-cart-item")
public class RemoveCartItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            int foodId = Integer.parseInt(request.getParameter("cart_id")); // foodId

            List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cartItems");

            if (cartItems != null) {
                cartItems.removeIf(item -> item.getFoodId() == foodId);
                session.setAttribute("cartItems", cartItems); // Update session
            }

            response.sendRedirect("cart");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error removing item: " + e.getMessage());
        }
    }
}
