package com.foodordering.servlet;

import com.foodordering.model.CartModel;
import com.foodordering.model.Delivery;
import com.foodordering.services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/myOrder")
public class MyOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            Delivery delivery = (Delivery) session.getAttribute("delivery");

            if (delivery != null) {
                int deliveryId = delivery.getId();
                List<CartModel> orderItems = OrderService.getOrderItemsByDeliveryId(deliveryId);

                // Send order items to JSP
                request.setAttribute("orderItems", orderItems);
            }

            request.getRequestDispatcher("myOrder.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load your order summary.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
