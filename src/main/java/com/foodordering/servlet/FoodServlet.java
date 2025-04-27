package com.foodordering.servlet;

import com.foodordering.model.Food;
import com.foodordering.services.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class FoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FoodService foodService;

    @Override
    public void init() throws ServletException {
        foodService = new FoodService();
    }

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

    /**
     * Loads all food categories and forwards to home.jsp
     */
    private void showFoodMenu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            

            List<Food> burgers = foodService.getFoodsByCategory("Burgers");
            List<Food> pizzas = foodService.getFoodsByCategory("Pizzas");
            List<Food> desserts = foodService.getFoodsByCategory("Desserts");
            List<Food> beverages = foodService.getFoodsByCategory("Beverages");

            

            // Pass to JSP
            request.setAttribute("burgers", burgers);
            request.setAttribute("pizzas", pizzas);
            request.setAttribute("desserts", desserts);
            request.setAttribute("beverages", beverages);

            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading food menu");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    /**
     * Displays a specific food item by ID
     */
    private void viewFoodItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Food foodItem = foodService.getFoodById(id);

            if (foodItem != null) {
                request.setAttribute("food", foodItem);
            } else {
                request.setAttribute("error", "Food item not found");
            }

            request.getRequestDispatcher("home.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error viewing food item");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}