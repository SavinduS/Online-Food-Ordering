package com.foodordering.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.CartModel;
import com.foodordering.model.Food;
import com.foodordering.services.CartService;
import com.foodordering.services.FoodService;

/*
 * OOP Concepts:
  - Encapsulation: Uses CartModel and Food objects to set and get values using setters and getters.
  - Inheritance: This servlet extends HttpServlet and inherits its methods.
  - Polymorphism: Overrides the doPost() method of HttpServlet.
  - Exception Handling: try-catch block is used to handle runtime errors.
 */

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
// Inheritance: This class inherits from HttpServlet
	
    private static final long serialVersionUID = 1L;

    // Service layer objects created for reuse (separation of concerns)
    CartService cartService = new CartService();
    FoodService foodService = new FoodService();

    // Polymorphism: Overriding doPost method from HttpServlet
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();

            // Get user email and food_id from request
            String userEmail = (String) session.getAttribute("userEmail");
            String foodIdStr = request.getParameter("food_id");

            // Simple validation: check if user is logged in and food_id is present
            if (userEmail == null || foodIdStr == null) {
                response.sendRedirect("Login.jsp");
                return;
            }

            // Parse food ID from string to int
            int foodId = Integer.parseInt(foodIdStr);

            // Get existing cart from session or create a new one
            List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cartItems");
            if (cartItems == null) {
                cartItems = new ArrayList<>();
            }

            boolean itemExists = false;

            // Loop through cart to see if food is already added
            for (CartModel item : cartItems) {
                if (item.getFoodId() == foodId) {
                    item.setQuantity(item.getQuantity() + 1); // Update quantity
                    itemExists = true;
                    break;
                }
            }

            // If item not found, add new item
            if (!itemExists) {
                Food food = foodService.getFoodById(foodId); // Fetch food from DB

                // Encapsulation: setting values through setters
                CartModel cartItem = new CartModel();
                cartItem.setFoodId(foodId);
                cartItem.setFoodName(food.getName());
                cartItem.setPrice(food.getPrice());
                cartItem.setQuantity(1);
                cartItem.setImageFilename(food.getImageFilename());
                cartItem.setUserEmail(userEmail);

                cartItems.add(cartItem);
            }

            // Save updated cart to session
            session.setAttribute("cartItems", cartItems);

            // Redirect to homepage
            response.sendRedirect("home");

        } catch (Exception e) {
            // Exception Handling
            e.printStackTrace();
            response.getWriter().println("Error adding to cart: " + e.getMessage());
        }
    }
}
