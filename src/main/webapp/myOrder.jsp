<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodordering.model.CartModel" %>
<%@ page import="com.foodordering.model.Delivery" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Orders</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>
<body class="bg-gray-100 font-[Poppins]">

<div class="max-w-6xl mx-auto px-4 py-12">
  <h1 class="text-3xl font-bold text-center text-red-600 mb-10">Thank You for Ordering!</h1>

  <!-- Order Card -->
  <div class="bg-white rounded-xl shadow-md p-8 border border-black">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">

      <!-- Order Details -->
      <div class="border p-6 rounded-md w-full flex flex-col justify-between">
        <%
          Delivery delivery = (Delivery) session.getAttribute("delivery");
        %>
        <div>
          <h2 class="text-xl font-bold mb-4">Order ID #<%= (delivery != null) ? delivery.getId() : "N/A" %></h2>

          <p class="mb-4">
            <strong>Status:</strong> 
            <span class="bg-yellow-400 text-white px-2 py-1 rounded font-semibold">Processing</span>
          </p>

          <h3 class="font-semibold text-lg mb-2">Delivery Address</h3>
          <% if (delivery != null) { %>
            <div class="space-y-2 text-base">
              <div class="flex items-center gap-2">
                <i class="fas fa-user text-black-600"></i>
                <span><b>Name:</b> <%= delivery.getFirstName() %> <%= delivery.getLastName() %></span>
              </div>
              <div class="flex items-center gap-2">
                <i class="fas fa-map-marker-alt text-black-600"></i>
                <span><b>Address:</b> <%= delivery.getAddress() %>, <%= delivery.getCity() %></span>
              </div>
              <div class="flex items-center gap-2">
                <i class="fas fa-envelope text-black-600"></i>
                <span><b>Postal Code:</b> <%= delivery.getPostalCode() %></span>
              </div>
              <div class="flex items-center gap-2">
                <i class="fas fa-phone text-black-600"></i>
                <span><b>Phone:</b> <%= delivery.getPhone() %></span>
              </div>
            </div>
          <% } else { %>
            <p class="text-red-600 font-semibold">No delivery data available.</p>
          <% } %>
        </div>

        <!-- Buttons -->
        <div class="mt-6 flex flex-col md:flex-row items-center gap-4 justify-center">
          <form action="CancelOrderServlet" method="post" onsubmit="return confirmCancel()">
            <input type="hidden" name="id" value="<%= (delivery != null) ? delivery.getId() : "" %>" />
            <button type="submit"
              class="bg-red-600 hover:bg-red-700 text-white font-semibold px-6 py-2 rounded shadow flex items-center gap-2 w-48 justify-center">
              <i class="fas fa-times"></i> Cancel Order
            </button>
          </form>
          <a href="invoice.jsp" target="_blank">
            <button type="button"
              class="bg-green-600 hover:bg-green-700 text-white font-semibold px-6 py-2 rounded shadow flex items-center gap-2 w-60 justify-center">
              <i class="fas fa-download"></i> Download Receipt
            </button>
          </a>
        </div>
      </div>

      <!-- Order Summary -->
      <div class="border p-6 rounded-md w-full">
        <h3 class="text-lg font-semibold mb-4 flex items-center gap-2">
          <i class="fas fa-shopping-cart"></i> Order Summary
        </h3>

        <table class="w-full text-left border-collapse">
          <thead>
            <tr class="bg-red-600 text-white">
              <th class="p-2 text-center">Product</th>
              <th class="p-2 text-center">Qty</th>
              <th class="p-2 text-center">Price</th>
            </tr>
          </thead>
          <tbody class="text-gray-800">
            <%
              double total = 0;
              List<CartModel> itemsInCart = (List<CartModel>) request.getAttribute("orderItems");
              if (itemsInCart != null && !itemsInCart.isEmpty()) {
                for (CartModel item : itemsInCart) {
                  double itemTotal = item.getPrice() * item.getQuantity();
                  total += itemTotal;
            %>
            <tr class="border-b">
              <td class="p-4">
                <div class="flex items-center gap-4">
                  <img src="<%= request.getContextPath() %>/images/<%= item.getImageFilename() %>" 
                       class="w-16 h-16 object-cover rounded-md border" alt="Food Image">
                  <span class="text-lg font-medium"><%= item.getFoodName() %></span>
                </div>
              </td>
              <td class="p-4 text-center align-middle"><%= item.getQuantity() %></td>
              <td class="p-4 text-center align-middle whitespace-nowrap">
                <span class="text-gray-800">Rs. <%= String.format("%.2f", itemTotal) %></span>
              </td>
            </tr>
            <%
                }
              } else {
            %>
            <tr><td colspan="3" class="text-red-500 p-2 text-center">No order items found.</td></tr>
            <% } %>
          </tbody>
          <tfoot>
            <tr class="font-semibold bg-gray-100">
              <td colspan="3" class="p-4">
                <div class="flex justify-between items-center w-full">
                  <span class="text-left"><b>Total:</b></span>
                  <span class="text-right"><b>Rs. <%= String.format("%.2f", total) %></b></span>
                </div>
              </td>
            </tr>
          </tfoot>
        </table>
      </div>

    </div>
  </div>
</div>

<script src="js/myOrder.js"></script>
<%@ include file="./partials/footer.jsp" %>

<script>
function confirmCancel() {
  return confirm("Are you sure you want to cancel this order?");
}
</script>

</body>
</html>
