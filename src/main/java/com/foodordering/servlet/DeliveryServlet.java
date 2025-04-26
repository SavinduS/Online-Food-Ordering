package com.foodordering.servlet;

import com.foodordering.model.Delivery;
import com.foodordering.model.Payment;
import com.foodordering.model.CartModel;

import com.foodordering.services.DeliveryService;
import com.foodordering.services.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/submitDelivery")
public class DeliveryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DeliveryService deliveryService;

    @Override
    public void init() throws ServletException {
        deliveryService = new DeliveryService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // ===== Get Delivery Fields =====
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String postalCode = request.getParameter("postalCode");

            Delivery delivery = new Delivery();
            delivery.setFirstName(firstName);
            delivery.setLastName(lastName);
            delivery.setEmail(email);
            delivery.setPhone(phone);
            delivery.setAddress(address);
            delivery.setCity(city);
            delivery.setPostalCode(postalCode);

            // ===== Get Payment Fields =====
            String cardholderName = request.getParameter("cardholderName");
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");

            Payment payment = new Payment(cardholderName, cardNumber, expiryDate, cvv);

            // ===== Save Delivery and Payment =====
            int deliveryId = deliveryService.saveDeliveryAndReturnId(delivery);
            boolean paymentSaved = deliveryService.savePaymentOnly(payment);

            if (deliveryId > 0 && paymentSaved) {
                // ✅ Session first
                HttpSession session = request.getSession();

                // ✅ Retrieve saved delivery and store
                Delivery savedDelivery = deliveryService.getDeliveryById(deliveryId);
                session.setAttribute("delivery", savedDelivery);

                // ✅ Get cart items for current user
                CartService cartService = new CartService();
                Integer userId = (Integer) session.getAttribute("userId");

                List<CartModel> cartItems = null;
                if (userId != null) {
                    cartItems = cartService.getCartItems(userId);
                }

                session.setAttribute("cartItems", cartItems);

                // ✅ Redirect to confirmation page
                response.sendRedirect("confirmPayment.jsp");

            } else {
                request.setAttribute("error", "Error saving your delivery or payment data.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unexpected server error.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
