package com.foodordering.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.CartModel;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            int foodId = Integer.parseInt(request.getParameter("cart_id"));

            List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cartItems");

            if (cartItems != null && action != null) {
                for (CartModel item : cartItems) {
                    if (item.getFoodId() == foodId) {
                        if ("increase".equals(action)) {
                            item.setQuantity(item.getQuantity() + 1);
                        } else if ("decrease".equals(action) && item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1);
                        }
                        break;
                    }
                }
                session.setAttribute("cartItems", cartItems); // Update session
            }

            response.sendRedirect("cart"); // Forward to updated cart
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating quantity: " + e.getMessage());
        }
    }
}
