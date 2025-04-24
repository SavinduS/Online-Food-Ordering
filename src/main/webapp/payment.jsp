<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Step 2: Payment Page</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>
<body class="font-[sans-serif] bg-gray-100">


  <!-- Step Progress Bar -->
  <br><br><div class="flex justify-between items-center max-w-4xl mx-auto mb-10 relative">
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
      <span class="w-9 h-9 rounded-full bg-gray-300 text-black flex items-center justify-center font-bold">3</span>
      <i class="fas fa-check-circle text-gray-400 mt-2"></i>
      <p class="text-sm font-bold text-gray-600">Confirmation</p>
    </div>
  </div>

  <!-- Payment Form -->
<form id="paymentForm" action="submitDelivery" method="POST" class="grid md:grid-cols-2 gap-8 bg-white rounded-3xl shadow-lg p-10 max-w-6xl mx-auto">

  <!-- Delivery Details -->
  <div>
    <h2 class="text-xl font-bold border-b-2 pb-2 mb-5 text-red-600 flex items-center gap-2">
      <i class="fas fa-map-marker-alt"></i> Delivery Details
    </h2>
    <div class="grid grid-cols-2 gap-4">
      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-user"></i> First Name</label>
        <input type="text" name="firstName" class="w-full border p-2 rounded" placeholder="Romesh" required>
      </div>
      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-user"></i> Last Name</label>
        <input type="text" name="lastName" class="w-full border p-2 rounded" placeholder="De Silva" required>
      </div>
    </div>

    <br>
    <div>
      <label class="font-semibold flex items-center gap-2"><i class="fas fa-envelope"></i> Email Address</label>
      <input type="email" name="email" class="w-full border p-2 rounded" placeholder="romeshdesilva@gmail.com" required>
    </div>

    <br>
    <div>
      <label class="font-semibold flex items-center gap-2"><i class="fas fa-phone"></i> Phone Number</label>
      <input type="tel" name="phone" class="w-full border p-2 rounded" placeholder="0770657948" pattern="[0-9]{10}" maxlength="10" required>
    </div>

    <br>
    <div>
      <label class="font-semibold flex items-center gap-2"><i class="fas fa-home"></i> Street Address</label>
      <input type="text" name="address" class="w-full border p-2 rounded" placeholder="12, Temple Street" required>
    </div>

    <br>
    <div class="grid grid-cols-2 gap-4">
      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-city"></i> City</label>
        <input type="text" name="city" class="w-full border p-2 rounded" placeholder="Galle" required>
      </div>
      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-mail-bulk"></i> Postal Code</label>
        <input type="text" name="postalCode" class="w-full border p-2 rounded" placeholder="80250" pattern="[0-9]{5}" maxlength="5" inputmode="numeric" required>
      </div>
    </div>
  </div>
  

<!-- Payment Details -->
<div>
  <h2 class="text-xl font-bold border-b-2 pb-2 mb-5 text-red-600 flex items-center gap-2">
    <i class="fas fa-credit-card"></i> Payment Details
  </h2>

  <div>
    <label class="font-semibold flex items-center gap-2">
      <i class="fas fa-user"></i> Cardholder Name
    </label>
    <input type="text" name="cardholderName" class="w-full border p-2 rounded" placeholder="Romesh De Silva" required>
  </div>

  <div>
    <br>
    <label class="font-semibold flex items-center gap-2 mt-2">
      <i class="fas fa-credit-card"></i> Card Number
    </label>
    <input type="text" name="cardNumber" class="w-full border p-2 rounded" placeholder="1234567812345678" pattern="[0-9]{16}" maxlength="16" inputmode="numeric" required>
  </div>

  <div class="grid grid-cols-2 gap-4">
    <div>
      <br>
      <label class="font-semibold flex items-center gap-2 mt-2">
        <i class="fas fa-calendar-alt"></i> Expiry Date
      </label>
      <input type="month" name="expiryDate" class="w-full border p-2 rounded" min="2025-05" required>
    </div>
    <div>
      <br>
      <label class="font-semibold flex items-center gap-2 mt-2">
        <i class="fas fa-lock"></i> CVV
      </label>
      <input type="password" name="cvv" class="w-full border p-2 rounded" placeholder="123" pattern="[0-9]{3}" maxlength="3" required>
    </div>
  </div>


        <div>
          <br><label class="font-semibold flex items-center gap-2 mt-2"><i class="fas fa-money-bill-wave"></i> Payment Method</label>
          <div class="flex gap-4 text-3xl justify-center mt-2">
            <i class="fab fa-cc-visa text-blue-600 hover:scale-150 transition-transform"></i>
            <i class="fab fa-cc-mastercard text-orange-500 hover:scale-150 transition-transform"></i>
            <i class="fab fa-cc-paypal text-sky-600 hover:scale-150 transition-transform"></i>
            <i class="fab fa-cc-apple-pay text-gray-800 hover:scale-150 transition-transform"></i>
          </div>
        </div>
    </div>

    <!-- Navigation Buttons -->
    <div class="col-span-2 flex justify-between mt-10 px-4">
      <button type="button" id="backButton" class="bg-gray-500 hover:bg-gray-600 text-white px-6 py-3 rounded flex items-center gap-2">
        <i class="fas fa-arrow-left"></i> Back
      </button>
      <button type="submit" class="bg-red-600 hover:bg-red-700 text-white px-6 py-3 rounded flex items-center gap-2">
        Next <i class="fas fa-arrow-right"></i>
      </button>
    </div>
  </form>
  
  <div><br><br></div>

  <script src="js/payment.js"></script>
  <%@ include file="./partials/footer.jsp" %>
</body>
</html>
