package com.foodordering.servlet;

import com.foodordering.model.CartItem;
import com.foodordering.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 🔐 Get logged-in user's ID from session
            HttpSession session = request.getSession(false);
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // 🛒 Get all cart items for the user
            List<CartItem> cartItems = cartService.getCartItemsByUserId(userId);
            request.setAttribute("cartItems", cartItems);

            // ✅ Forward to cart display JSP
            request.getRequestDispatcher("cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load cart");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
