<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>

<%
    // Encapsulation: Retrieve user email from session using getter
    String userEmail = (String) session.getAttribute("userEmail");

    // If user is not logged in, redirect to login page
    if (userEmail == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Step 2: Payment Page</title>

  <!-- Tailwind & FontAwesome -->
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

  <!-- Header include (e.g., navigation, logo) -->
  <%@ include file="./partials/header.jsp" %>
</head>

<body class="font-[sans-serif] bg-gray-100">

<!-- Step Progress Bar -->
<div class="flex justify-between items-center max-w-4xl mx-auto mb-10 relative mt-10">
  <div class="absolute top-6 left-0 w-full h-1 bg-gray-300 z-0"></div>

  <!-- Step 1 -->
  <div class="z-10 flex flex-col items-center">
    <span class="w-9 h-9 rounded-full bg-red-600 text-white flex items-center justify-center font-bold">1</span>
    <i class="fas fa-shopping-cart text-red-600 mt-2"></i>
    <p class="text-sm font-bold">Cart</p>
  </div>

  <!-- Step 2 -->
  <div class="z-10 flex flex-col items-center">
    <span class="w-9 h-9 rounded-full bg-red-600 text-white flex items-center justify-center font-bold">2</span>
    <i class="fas fa-credit-card text-red-600 mt-2"></i>
    <p class="text-sm font-bold">Payment Info</p>
  </div>

  <!-- Step 3 -->
  <div class="z-10 flex flex-col items-center">
    <span class="w-9 h-9 rounded-full bg-gray-300 text-black flex items-center justify-center font-bold">3</span>
    <i class="fas fa-check-circle text-gray-400 mt-2"></i>
    <p class="text-sm font-bold text-gray-600">Confirmation</p>
  </div>
</div>

<!-- Main Form -->
<form id="paymentForm" action="submitDelivery" method="POST"
      class="grid md:grid-cols-2 gap-8 bg-white rounded-3xl shadow-lg p-10 max-w-6xl mx-auto">

  <!-- ✅ Hidden input: User email taken from session (Encapsulation) -->
  <input type="hidden" name="email" value="<%= userEmail %>"/>

  <!-- Left Side: Delivery Details -->
  <div>
    <h2 class="text-xl font-bold border-b-2 pb-2 mb-5 text-red-600 flex items-center gap-2">
      <i class="fas fa-map-marker-alt"></i> Delivery Details
    </h2>

    <!-- First & Last Name -->
    <div class="grid grid-cols-2 gap-4">
      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-user"></i> First Name</label>
        <input type="text" name="firstName" placeholder="Romesh" class="w-full border p-2 rounded" required>
      </div>
      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-user"></i> Last Name</label>
        <input type="text" name="lastName" placeholder="Perera" class="w-full border p-2 rounded" required>
      </div>
    </div>

    <br>

    <!-- Phone -->
    <div>
      <label class="font-semibold flex items-center gap-2"><i class="fas fa-phone"></i> Phone Number</label>
      <input type="tel" name="phone" placeholder="0771234567"
             class="w-full border p-2 rounded" pattern="[0-9]{10}" maxlength="10" required>
    </div>

    <br>

    <!-- Address -->
    <div>
      <label class="font-semibold flex items-center gap-2"><i class="fas fa-home"></i> Address</label>
      <input type="text" name="address" placeholder="123, Main Street" class="w-full border p-2 rounded" required>
    </div>

    <br>

    <!-- City and Postal Code -->
    <div class="grid grid-cols-2 gap-4">
      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-city"></i> City</label>
        <input type="text" name="city" placeholder="Colombo" class="w-full border p-2 rounded" required>
      </div>
      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-mail-bulk"></i> Postal Code</label>
        <input type="text" name="postalCode" placeholder="80250"
               class="w-full border p-2 rounded" pattern="[0-9]{5}" maxlength="5" inputmode="numeric" required>
      </div>
    </div>
  </div>

  <!-- Right Side: Payment Details -->
  <div>
    <h2 class="text-xl font-bold border-b-2 pb-2 mb-5 text-red-600 flex items-center gap-2">
      <i class="fas fa-credit-card"></i> Payment Details
    </h2>

    <!-- Cardholder Name -->
    <div>
      <label class="font-semibold flex items-center gap-2">
        <i class="fas fa-user"></i> Cardholder Name
      </label>
      <input type="text" name="cardholderName" placeholder="Romesh Perera"
             class="w-full border p-2 rounded" required>
    </div>

    <br>

    <!-- Card Number -->
    <div>
      <label class="font-semibold flex items-center gap-2">
        <i class="fas fa-credit-card"></i> Card Number
      </label>
      <input type="text" name="cardNumber" placeholder="1234 5678 9012 3456"
             class="w-full border p-2 rounded" pattern="[0-9]{16}" maxlength="16" inputmode="numeric" required>
    </div>

    <br>

    <!-- Expiry Date and CVV -->
    <div class="grid grid-cols-2 gap-4">
      <%
        // Dynamically set minimum expiry date (today's month)
        java.util.Calendar cal = java.util.Calendar.getInstance();
        int year = cal.get(java.util.Calendar.YEAR);
        int month = cal.get(java.util.Calendar.MONTH) + 1;
        String monthStr = (month < 10 ? "0" : "") + month;
      %>
      <div>
        <label class="font-semibold flex items-center gap-2">
          <i class="fas fa-calendar-alt"></i> Expiry Date
        </label>
        <input type="month" name="expiryDate" class="w-full border p-2 rounded" min="<%= year %>-<%= monthStr %>" required>
      </div>
      <div>
        <label class="font-semibold flex items-center gap-2">
          <i class="fas fa-lock"></i> CVV
        </label>
        <input type="password" name="cvv" placeholder="123"
               class="w-full border p-2 rounded" pattern="[0-9]{3}" maxlength="3" required>
      </div>
    </div>

    <br>

    <!-- Static Payment Methods (Visual only) -->
    <label class="font-semibold flex items-center gap-2"><i class="fas fa-money-bill-wave"></i> Payment Method</label>
    <div class="flex gap-4 text-3xl justify-center mt-2">
      <i class="fab fa-cc-visa text-blue-600 hover:scale-150 transition-transform"></i>
      <i class="fab fa-cc-mastercard text-orange-500 hover:scale-150 transition-transform"></i>
      <i class="fab fa-cc-paypal text-sky-600 hover:scale-150 transition-transform"></i>
      <i class="fab fa-cc-apple-pay text-gray-800 hover:scale-150 transition-transform"></i>
    </div>
  </div>
</form>

<!-- Navigation Buttons -->
<div class="max-w-6xl mx-auto px-10 mt-6 flex justify-between items-center">
  <!-- Back Button -->
  <a href="cart.jsp">
    <button type="button" class="bg-gray-600 hover:bg-gray-700 text-white px-6 py-3 rounded flex items-center gap-2 shadow">
      <i class="fas fa-arrow-left"></i> Back
    </button>
  </a>

  <!-- Submit Button (triggers form by form ID) -->
  <button type="submit" form="paymentForm" class="bg-red-600 hover:bg-red-700 text-white px-6 py-3 rounded flex items-center gap-2 shadow">
    Next <i class="fas fa-arrow-right"></i>
  </button>
</div>

<div><br><br></div>

<!-- JavaScript -->
<script src="js/payment.js"></script>
<%@ include file="./partials/footer.jsp" %>
</body>
</html>
