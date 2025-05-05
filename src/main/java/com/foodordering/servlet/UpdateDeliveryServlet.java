package com.foodordering.servlet;

import com.foodordering.model.Delivery;
import com.foodordering.services.DeliveryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateDeliveryServlet")
public class UpdateDeliveryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DeliveryService service;

    @Override
    public void init() throws ServletException {
        service = new DeliveryService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("🔔 UpdateDeliveryServlet POST called");

        try {
            // Get form values
            int id = Integer.parseInt(request.getParameter("id"));
            String fname = request.getParameter("firstName");
            String lname = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String postalCode = request.getParameter("postalCode");

            System.out.println("📥 Received update request for ID: " + id);
            System.out.println("📌 Name: " + fname + " " + lname + ", Email: " + email + ", Postal: " + postalCode);

            // Create delivery object
            Delivery delivery = new Delivery();
            delivery.setId(id);
            delivery.setFirstName(fname);
            delivery.setLastName(lname);
            delivery.setEmail(email);
            delivery.setPhone(phone);
            delivery.setAddress(address);
            delivery.setCity(city);
            delivery.setPostalCode(postalCode);

            // Try to update in DB
            boolean success = service.updateDelivery(delivery);
            System.out.println("🛠 Update success status: " + success);

            if (success) {
                System.out.println("✅ Update succeeded. Redirecting with deliveryId...");
                // ✅ Redirect with deliveryId so confirmPayment.jsp can load via request param
                response.sendRedirect("confirmPayment.jsp?deliveryId=" + id);
            } else {
                System.out.println("❌ Update failed. Forwarding back to editDetails.jsp");
                request.setAttribute("delivery", delivery);
                request.setAttribute("error", "Update failed");
                request.getRequestDispatcher("editDetails.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("editDetails.jsp").forward(request, response);
        }
    }
}
