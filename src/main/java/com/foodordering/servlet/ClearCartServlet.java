package com.foodordering.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.CartService;

import java.io.IOException;

/*
  OOP Concepts:
  - Inheritance: This class extends HttpServlet and inherits servlet behavior.
  - Polymorphism: Overrides the doPost() method from the parent class.
  - Encapsulation: Uses CartService object to call logic, and session to hold user-specific data.
  - Exception Handling: try-catch block is used to handle runtime errors.
 */

@WebServlet("/clear-cart")
public class ClearCartServlet extends HttpServlet {
//Inheritance: This class extends HttpServlet
	
    private static final long serialVersionUID = 1L;

    // Instance of service class used to access business logic
    private CartService cartService = new CartService();

    // Polymorphism: Overrides doPost method from HttpServlet
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get session and extract the user's email
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            // If user is logged in, clear their cart from the database
            if (userEmail != null) {
                cartService.clearCartByEmail(userEmail); // Encapsulation and layer separation
            }

            // Remove cartItems from session
            session.removeAttribute("cartItems");

            // Redirect to myOrder page
            response.sendRedirect("myOrder");

        } catch (Exception e) {
            // Handle any unexpected error
            e.printStackTrace();
            response.getWriter().println("Error clearing cart: " + e.getMessage());
        }
    }
}
