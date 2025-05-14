package com.foodordering.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.CartService;
import com.foodordering.model.CartModel;

/*

 * OOP Concepts:
 * - Inheritance: This class extends HttpServlet.
 * - Polymorphism: Overrides the doGet() method.
 * - Encapsulation: Uses CartModel to access item details via getters.
 * - Exception Handling: try-catch block is used to handle errors.
 */

@WebServlet("/cart")
public class CartServlet extends HttpServlet { // Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;
    CartService cartService = new CartService(); // Service layer handles logic

    // Polymorphism: Overriding doGet() to display cart items
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get logged-in user's email from session
            String userEmail = (String) request.getSession().getAttribute("userEmail");

            // Redirect if user not logged in
            if (userEmail == null) {
                response.sendRedirect("Login.jsp");
                return;
            }

            // Fetch cart items from the database
            List<CartModel> cartItems = cartService.getCartItems(userEmail); // Encapsulation via CartModel

            // Pass data to view (JSP)
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("cart.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle unexpected errors
            e.printStackTrace();
            response.getWriter().println("Error loading cart: " + e.getMessage());
        }
    }
}
