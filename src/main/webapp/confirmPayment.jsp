<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ page import="java.util.*, com.foodordering.model.Delivery, com.foodordering.model.CartModel, com.foodordering.services.DeliveryService, com.foodordering.services.OrderService" %>

<%
    String deliveryIdParam = request.getParameter("deliveryId");
    Delivery delivery = null;
    List<CartModel> itemsInCart = new ArrayList<>();
    double total = 0.0;

    if (deliveryIdParam != null && !deliveryIdParam.isEmpty()) {
        try {
            int deliveryId = Integer.parseInt(deliveryIdParam);
            DeliveryService deliveryService = new DeliveryService();
            OrderService orderService = new OrderService();

            delivery = deliveryService.getDeliveryById(deliveryId);
            itemsInCart = orderService.getOrderItemsByDeliveryId(deliveryId); // ✅ FIXED HERE
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Step 3: Payment Confirmation</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  <%@ include file="./partials/header.jsp" %>
</head>

<body class="font-[sans-serif] bg-gray-100">

<!-- Progress Bar -->
<div class="flex justify-between items-center max-w-4xl mx-auto mb-10 relative mt-10">
  <div class="absolute top-6 left-0 w-full h-1 bg-gray-300 z-0"></div>
  <div class="z-10 flex flex-col items-center">
    <span class="w-9 h-9 rounded-full bg-red-600 text-white flex items-center justify-center font-bold">1</span>
    <i class="fas fa-shopping-cart text-red-600 mt-2"></i>
    <p class="text-sm font-bold">Cart</p>
  </div>
  <div class="z-10 flex flex-col items-center">
    <span class="w-9 h-9 rounded-full bg-red-600 text-white flex items-center justify-center font-bold">2</span>
    <i class="fas fa-credit-card text-red-600 mt-2"></i>
    <p class="text-sm font-bold">Payment Info</p>
  </div>
  <div class="z-10 flex flex-col items-center">
    <span class="w-9 h-9 rounded-full bg-red-600 text-white flex items-center justify-center font-bold">3</span>
    <i class="fas fa-check-circle text-white mt-2"></i>
    <p class="text-sm font-bold">Confirmation</p>
  </div>
</div>

<!-- Confirmation Content -->
<div class="bg-white max-w-5xl mx-auto p-8 rounded-xl shadow-md border border-black">
  <h2 class="text-2xl font-bold text-center mb-8">Order Confirmation</h2>

  <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

    <!-- Delivery Info -->
    <div class="border p-6 rounded-md w-full">
      <h3 class="text-lg font-semibold mb-4 flex items-center gap-2">
        <i class="fas fa-user"></i> Your Details
      </h3>
      <div class="space-y-2 text-base">
        <% if (delivery != null) { %>
          <p><strong>Name:</strong> <%= delivery.getFirstName() %> <%= delivery.getLastName() %></p>
          <p><strong>Email:</strong> <%= delivery.getEmail() %></p>
          <p><strong>Phone:</strong> <%= delivery.getPhone() %></p>
          <p><strong>Address:</strong> <%= delivery.getAddress() %>, <%= delivery.getCity() %></p>
          <p><strong>Postal Code:</strong> <%= delivery.getPostalCode() %></p>
        <% } else { %>
          <p class="text-red-600 font-semibold">No delivery data available.</p>
        <% } %>
      </div>
      <% if (delivery != null) { %>
      <div class="mt-6">
        <a href="editDetails.jsp?deliveryId=<%= delivery.getId() %>" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded shadow font-semibold inline-block">
          <i class="fas fa-edit mr-2"></i> Edit Your Details
        </a>
      </div>
      <% } %>
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
            <th class="p-2 text-center">Quantity</th>
            <th class="p-2 text-center">Price</th>
          </tr>
        </thead>
        <tbody class="text-gray-800">
          <% if (itemsInCart != null && !itemsInCart.isEmpty()) {
              for (CartModel item : itemsInCart) {
                double itemTotal = item.getPrice() * item.getQuantity();
                total += itemTotal;
          %>
          <tr class="border-b">
            <td class="p-4">
              <div class="flex items-center gap-4">
                <img src="<%= request.getContextPath() %>/images/<%= item.getImageFilename() %>" class="w-16 h-16 object-cover rounded-md border" alt="Food Image">
                <span class="text-lg font-medium"><%= item.getFoodName() %></span>
              </div>
            </td>
            <td class="p-4 text-center"><%= item.getQuantity() %></td>
            <td class="p-4 text-center">Rs. <%= String.format("%.2f", itemTotal) %></td>
          </tr>
          <% } } else { %>
          <tr>
            <td colspan="3" class="text-red-500 p-4 text-center">No cart items found.</td>
          </tr>
          <% } %>
        </tbody>
        <tfoot>
          <tr class="font-semibold bg-gray-100">
            <td colspan="3" class="p-4 text-right">
              Total: Rs. <%= String.format("%.2f", total) %>
            </td>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>

  <!-- Confirm Order Button -->
  <div class="mt-10 flex justify-center">
    <form action="clear-cart" method="post">
      <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-8 py-4 rounded shadow transform hover:scale-105 transition-transform duration-300">
        <i class="fas fa-check-circle mr-2"></i><b>Confirm Your Order</b>
      </button>
    </form>
  </div>
</div>

<div><br><br></div>

<script src="js/confirmPayment.js"></script>
<%@ include file="./partials/footer.jsp" %>
</body>
</html>
