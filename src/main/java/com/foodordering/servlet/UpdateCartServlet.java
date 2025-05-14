package com.foodordering.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.CartModel;

/*
 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: Overrides the doPost() method from HttpServlet.
 * - Encapsulation: Uses CartModel setters/getters to update object values.
 * - Session Handling: Reads and updates the cart in the session.
 * - Exception Handling: All logic wrapped in try-catch block.
 */

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet { // Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;

    // Polymorphism: Overriding doPost method to handle quantity updates
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();

            // Read action and foodId from the request
            String action = request.getParameter("action");
            int foodId = Integer.parseInt(request.getParameter("cart_id"));

            // Get current cart from session
            List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cartItems");

            // If cart and action are valid, update the item's quantity
            if (cartItems != null && action != null) {
                for (CartModel item : cartItems) {
                    if (item.getFoodId() == foodId) {
                        // Encapsulation: update quantity using setter
                        if ("increase".equals(action)) {
                            item.setQuantity(item.getQuantity() + 1);
                        } else if ("decrease".equals(action) && item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1);
                        }
                        break;
                    }
                }

                // Save updated cart back to session
                session.setAttribute("cartItems", cartItems);
            }

            // Redirect to cart page after update
            response.sendRedirect("cart");

        } catch (Exception e) {
            // Exception Handling
            e.printStackTrace();
            response.getWriter().println("Error updating quantity: " + e.getMessage());
        }
    }
}
