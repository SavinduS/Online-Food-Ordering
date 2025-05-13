package com.foodordering.servlet;

import com.foodordering.model.Food;
import com.foodordering.services.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/*
 * OOP Concepts:
  - Inheritance: This class extends HttpServlet.
  - Polymorphism: Overrides doGet() method from HttpServlet.
  - Encapsulation: Uses the Food model to pass data using getters/setters.
  - Exception Handling: try-catch used to handle and forward errors.
 */

@WebServlet("/home")
public class FoodServlet extends HttpServlet {
// Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;
    private FoodService foodService;

    // Initializes the FoodService instance
    @Override
    public void init() throws ServletException {
        foodService = new FoodService();
    }

    // Polymorphism: Overrides doGet method to handle GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("view".equalsIgnoreCase(action)) {
            viewFoodItem(request, response);
        } else {
            showFoodMenu(request, response);
        }
    }

    // Loads all food categories and passes them to home.jsp
    private void showFoodMenu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Service layer is called to get each food category
            List<Food> burgers = foodService.getFoodsByCategory("Burgers");
            List<Food> pizzas = foodService.getFoodsByCategory("Pizzas");
            List<Food> desserts = foodService.getFoodsByCategory("Desserts");
            List<Food> beverages = foodService.getFoodsByCategory("Beverages");

            // Set data as request attributes (Encapsulation via model class)
            request.setAttribute("burgers", burgers);
            request.setAttribute("pizzas", pizzas);
            request.setAttribute("desserts", desserts);
            request.setAttribute("beverages", beverages);

            // Forward to home.jsp
            request.getRequestDispatcher("home.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle errors and forward to error page
            e.printStackTrace();
            request.setAttribute("error", "Error loading food menu");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // Loads and displays a single food item by its ID
    private void viewFoodItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            // Get food item using FoodService
            Food foodItem = foodService.getFoodById(id);

            if (foodItem != null) {
                request.setAttribute("food", foodItem); // Encapsulation
            } else {
                request.setAttribute("error", "Food item not found");
            }

            // Forward to home.jsp with item details or error
            request.getRequestDispatcher("home.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error viewing food item");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
