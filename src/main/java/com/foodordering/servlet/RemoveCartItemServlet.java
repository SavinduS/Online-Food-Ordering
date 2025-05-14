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
 * - Polymorphism: Overrides doPost() method to handle form submission.
 * - Encapsulation: CartModel is used to access foodId via getter.
 */

@WebServlet("/remove-cart-item")
public class RemoveCartItemServlet extends HttpServlet { // Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;

    // Polymorphism: Overrides doPost method to process remove request
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Retrieve session and cart item to be removed
            HttpSession session = request.getSession();
            int foodId = Integer.parseInt(request.getParameter("cart_id")); // Encapsulation via getter

            // Get cart from session
            List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cartItems");

            // Remove the matching item by foodId
            if (cartItems != null) {
                cartItems.removeIf(item -> item.getFoodId() == foodId);
                session.setAttribute("cartItems", cartItems); // Update session after removal
            }

            // Redirect back to cart page
            response.sendRedirect("cart");

        } catch (Exception e) {
            // Exception handling
            e.printStackTrace();
            response.getWriter().println("Error removing item: " + e.getMessage());
        }
    }
}
