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

/*
 * OOP Concepts:
  - Inheritance: This class extends HttpServlet (Java EE servlet base class).
  - Polymorphism: Overrides the doPost() method of HttpServlet.
  - Encapsulation: Uses Delivery, Payment, CartModel objects to hold data via setters/getters.
  - Exception Handling: try-catch block used to catch and forward any errors.
 */

@WebServlet("/submitDelivery")
public class DeliveryServlet extends HttpServlet { 
// Inheritance: This class extends HttpServlet
	
    private static final long serialVersionUID = 1L;

    private DeliveryService deliveryService;
    private CartService cartService;
    private OrderService orderService;

    // Servlet lifecycle method to initialize service layer objects
    @Override
    public void init() throws ServletException {
        deliveryService = new DeliveryService();
        cartService = new CartService();
        orderService = new OrderService();
    }

    // Polymorphism: doPost method overrides the parent class's version
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            // Basic validation to check if user is logged in
            if (userEmail == null || userEmail.isEmpty()) {
                response.sendRedirect("Login.jsp");
                return;
            }

            // Get delivery details from request parameters
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String postalCode = request.getParameter("postalCode");

            // Encapsulation: Use setters to store form data into Delivery object
            Delivery delivery = new Delivery();
            delivery.setFirstName(firstName);
            delivery.setLastName(lastName);
            delivery.setEmail(userEmail); // Force login email
            delivery.setPhone(phone);
            delivery.setAddress(address);
            delivery.setCity(city);
            delivery.setPostalCode(postalCode);

            // Get payment details from form
            String cardholderName = request.getParameter("cardholderName");
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");

            // Encapsulation: Payment details stored using constructor
            Payment payment = new Payment(cardholderName, cardNumber, expiryDate, cvv);

            // Save delivery and payment into database
            int deliveryId = deliveryService.saveDeliveryAndReturnId(delivery);
            boolean paymentSaved = deliveryService.savePaymentOnly(payment);
            List<CartModel> sessionCart = (List<CartModel>) session.getAttribute("cartItems");

            // If everything is saved and cart is not empty
            if (deliveryId > 0 && paymentSaved && sessionCart != null && !sessionCart.isEmpty()) {

                // Clear existing cart from database
                cartService.clearCartByEmail(userEmail);

                // Save each cart item with associated user email
                for (CartModel item : sessionCart) {
                    item.setUserEmail(userEmail); // Encapsulation
                    cartService.addCart(item);
                }

                // Save order items and redirect to confirmation page
                orderService.saveOrderItems(deliveryId, sessionCart);
                response.sendRedirect("confirmPayment.jsp?deliveryId=" + deliveryId);

            } else {
                // Show error if saving failed or cart is empty
                request.setAttribute("error", "Delivery or payment failed or cart empty.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // Exception Handling
            e.printStackTrace();
            request.setAttribute("error", "Unexpected server error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
