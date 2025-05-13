package com.foodordering.servlet;

import com.foodordering.model.Delivery;
import com.foodordering.services.DeliveryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/*
 * OOP Concepts:
  - Inheritance: This class extends HttpServlet.
  - Polymorphism: Overrides the doPost() method from HttpServlet.
  - Encapsulation: Uses the Delivery model with setters to pass data.
  - Exception Handling: try-catch block is used to handle runtime errors.
 */

@WebServlet("/UpdateDeliveryServlet")
public class UpdateDeliveryServlet extends HttpServlet {
// Inheritance: This class extends HttpServlet

    private static final long serialVersionUID = 1L;
    private DeliveryService service;

    // Initializes the service layer object
    @Override
    public void init() throws ServletException {
        service = new DeliveryService();
    }

    // Polymorphism: Overrides the doPost method of the HttpServlet class
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // Get delivery fields from form submission
            int id = Integer.parseInt(request.getParameter("id"));
            String fname = request.getParameter("firstName");
            String lname = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String postalCode = request.getParameter("postalCode");

            // Encapsulation: Use setter methods to assign values to Delivery object
            Delivery delivery = new Delivery();
            delivery.setId(id);
            delivery.setFirstName(fname);
            delivery.setLastName(lname);
            delivery.setEmail(email);
            delivery.setPhone(phone);
            delivery.setAddress(address);
            delivery.setCity(city);
            delivery.setPostalCode(postalCode);

            // Call service method to update the delivery record
            boolean success = service.updateDelivery(delivery);

            if (success) {
                // Redirect to confirmation page with updated delivery ID
                response.sendRedirect("confirmPayment.jsp?deliveryId=" + id);
            } else {
                // If update fails, reload edit page with error message
                request.setAttribute("delivery", delivery);
                request.setAttribute("error", "Update failed");
                request.getRequestDispatcher("editDetails.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // Exception Handling: Display error message on edit page
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("editDetails.jsp").forward(request, response);
        }
    }
}
