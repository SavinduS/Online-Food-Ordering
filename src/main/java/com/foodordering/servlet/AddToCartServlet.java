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
import com.foodordering.services.FoodService; // You need to implement this if not already

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    CartService cartService = new CartService();
    FoodService foodService = new FoodService(); // To fetch food details by ID

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");
            String foodIdStr = request.getParameter("food_id");

            if (userEmail == null || foodIdStr == null) {
                response.sendRedirect("Login.jsp");
                return;
            }

            int foodId = Integer.parseInt(foodIdStr);

            // Get the current cart from session or create a new one
            List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cartItems");
            if (cartItems == null) {
                cartItems = new ArrayList<>();
            }

            boolean itemExists = false;

            for (CartModel item : cartItems) {
                if (item.getFoodId() == foodId) {
                    item.setQuantity(item.getQuantity() + 1); // increase quantity
                    itemExists = true;
                    break;
                }
            }

            if (!itemExists) {
                // Get full food details from DB
                Food food = foodService.getFoodById(foodId); // You must implement this method

                CartModel cartItem = new CartModel();
                cartItem.setFoodId(foodId);
                cartItem.setFoodName(food.getName());
                cartItem.setPrice(food.getPrice());
                cartItem.setQuantity(1);
                cartItem.setImageFilename(food.getImageFilename());
                cartItem.setUserEmail(userEmail);

                cartItems.add(cartItem);
            }

            session.setAttribute("cartItems", cartItems);

            response.sendRedirect("home");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding to cart: " + e.getMessage());
        }
    }
}
