package com.foodordering.servlet;

import com.foodordering.model.Delivery;
import com.foodordering.model.Payment;
import com.foodordering.model.CartModel;

import com.foodordering.services.DeliveryService;
import com.foodordering.services.CartService;
import com.foodordering.services.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/submitDelivery")
public class DeliveryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DeliveryService deliveryService;
    private CartService cartService;
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        deliveryService = new DeliveryService();
        cartService = new CartService();
        orderService = new OrderService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail == null || userEmail.isEmpty()) {
                response.sendRedirect("Login.jsp");
                return;
            }

            // ✅ Force email from session
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String postalCode = request.getParameter("postalCode");

            Delivery delivery = new Delivery();
            delivery.setFirstName(firstName);
            delivery.setLastName(lastName);
            delivery.setEmail(userEmail); // ✅ Force login email
            delivery.setPhone(phone);
            delivery.setAddress(address);
            delivery.setCity(city);
            delivery.setPostalCode(postalCode);

            // ✅ Get Payment Fields
            String cardholderName = request.getParameter("cardholderName");
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");

            Payment payment = new Payment(cardholderName, cardNumber, expiryDate, cvv);

            // ✅ Save to DB
            int deliveryId = deliveryService.saveDeliveryAndReturnId(delivery);
            boolean paymentSaved = deliveryService.savePaymentOnly(payment);
            List<CartModel> sessionCart = (List<CartModel>) session.getAttribute("cartItems");

            if (deliveryId > 0 && paymentSaved && sessionCart != null && !sessionCart.isEmpty()) {
                // ✅ Clear old cart and insert new items
                cartService.clearCartByEmail(userEmail);
                for (CartModel item : sessionCart) {
                    item.setUserEmail(userEmail);
                    cartService.addCart(item);
                }

                // ✅ Save order and redirect
                orderService.saveOrderItems(deliveryId, sessionCart);
                response.sendRedirect("confirmPayment.jsp?deliveryId=" + deliveryId);
            } else {
                request.setAttribute("error", "Delivery or payment failed or cart empty.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unexpected server error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
