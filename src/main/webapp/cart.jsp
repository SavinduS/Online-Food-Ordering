<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quickbites - Shopping Cart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/Footer.css">
</head>
<body class="bg-gray-100">

    <!-- Navigation Bar -->
    <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>QuickBites</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.13.2/cdn.min.js" defer></script>
</head>
<body>

<!-- Header -->
<header class="font-[sans-serif] sticky top-0 z-50 bg-orange-600 shadow-md">

  <div class="max-w-7xl mx-auto px-4 py-4 flex items-center justify-between">
    <!-- Logo -->
    <div class="text-white text-2xl font-bold flex items-center gap-2">
      <i class="fas fa-utensils"></i>
      <a href="#">QuickBites</a>
    </div>

    <!-- Navigation -->
    <nav class="hidden md:flex space-x-6 text-white font-medium items-center">
      <a href="home" class="hover:text-yellow-300">Home</a>
      <a href="Review.jsp" class="hover:text-yellow-300">Reviews</a>
      <a href="AboutUs.jsp" class="hover:text-yellow-300">About Us</a>
      <a href="#menu" class="bg-yellow-400 hover:bg-white hover:text-orange-600 text-black px-4 py-2 rounded shadow font-semibold">Order Now</a>
    </nav>

    <!-- Right Icons -->
    <div class="flex items-center gap-4">
      <div class="relative hidden md:flex items-center bg-white rounded px-2 py-1">
        <input type="text" id="foodSearch" placeholder="Search food..." class="outline-none px-2 w-40 text-sm">
        <button id="searchButton"><i class="fas fa-search text-orange-600"></i></button>
      </div>
      <a href="#" class="text-white text-xl relative">
        <i class="fas fa-shopping-cart"></i>
        <span class="absolute -top-2 -right-3 bg-yellow-300 text-black text-xs rounded-full px-1">0</span>
      </a>
      <a href="#" class="text-white text-xl"><i class="fas fa-user"></i></a>
    </div>

    <!-- Mobile Menu Toggle -->
    <div class="md:hidden text-white text-2xl">
      <i class="fas fa-bars"></i>
    </div>
  </div>
</header>

    <!-- Cart Container -->
    <div class="max-w-5xl mx-auto mt-8 p-6 bg-white shadow-lg rounded-lg">
        
        <!-- Breadcrumbs -->
        <nav class="text-sm text-gray-500 mb-4">
            Home / <span class="text-red-600 font-semibold">Your Basket</span>
        </nav>

        <h2 class="text-3xl font-bold mb-4">Your Basket</h2>

        <!-- Cart Items -->
        <div class="space-y-6">
            <!-- Item 1 -->
            <div class="flex items-center border-b pb-4">
                <img src="burger.jpg" alt="Burger" class="w-24 h-24 rounded-lg mr-4">
                <div class="flex-1">
                    <h3 class="text-lg font-bold">Cheese Burger</h3>
                    <p class="text-gray-500 text-sm">Ref: 123456</p>
                    <p class="text-green-600 text-sm"><i class="fa fa-check"></i> Home Delivery</p>
                </div>
                <div class="flex items-center">
                    <button class="px-3 py-1 bg-gray-200 rounded-lg">-</button>
                    <span class="px-4">1</span>
                    <button class="px-3 py-1 bg-gray-200 rounded-lg">+</button>
                </div>
                <p class="text-xl font-bold ml-6">$10.99</p>
                <button class="ml-4 text-red-500"><i class="fa fa-trash"></i></button>
            </div>

            <!-- Item 2 -->
            <div class="flex items-center border-b pb-4">
                <img src="pizza.jpg" alt="Pizza" class="w-24 h-24 rounded-lg mr-4">
                <div class="flex-1">
                    <h3 class="text-lg font-bold">Pepperoni Pizza</h3>
                    <p class="text-gray-500 text-sm">Ref: 654321</p>
                    <p class="text-green-600 text-sm"><i class="fa fa-check"></i> Home Delivery</p>
                </div>
                <div class="flex items-center">
                    <button class="px-3 py-1 bg-gray-200 rounded-lg">-</button>
                    <span class="px-4">1</span>
                    <button class="px-3 py-1 bg-gray-200 rounded-lg">+</button>
                </div>
                <p class="text-xl font-bold ml-6">$15.99</p>
                <button class="ml-4 text-red-500"><i class="fa fa-trash"></i></button>
            </div>
        </div>

        <!-- Checkout Summary -->
        <div class="flex justify-between items-start mt-6">
            <!-- Delivery Options -->
            <div class="w-1/2 p-4 bg-gray-50 rounded-lg border">
                <h3 class="text-lg font-semibold mb-2">Delivery Options</h3>
                <label class="block">
                    <input type="radio" name="delivery" checked class="mr-2"> Home Delivery
                </label>
                <label class="block mt-2">
                    <input type="radio" name="delivery" class="mr-2"> Click & Collect
                </label>
            </div>

            <!-- Total -->
            <div class="w-1/3 bg-gray-50 p-4 rounded-lg border">
                <p class="flex justify-between text-lg font-semibold">
                    <span>Subtotal:</span> <span>$26.98</span>
                </p>
                <p class="flex justify-between text-sm text-gray-500">
                    <span>Delivery:</span> <span>Free</span>
                </p>
                <p class="flex justify-between text-xl font-bold mt-2">
                    <span>Total:</span> <span>$26.98</span>
                </p>
                <button class="w-full mt-4 bg-black text-white py-2 rounded-lg hover:bg-gray-800">
                    Checkout
                </button>
            </div>
        </div>

        <!-- Delivery Information -->
        <div class="mt-8 p-4 bg-gray-50 rounded-lg border">
            <h3 class="text-lg font-semibold">Delivery Information:</h3>
            <p class="text-gray-600 text-sm mt-2">
                Standard Delivery is <span class="font-bold">2-4 working days</span>.
            </p>
            <p class="text-gray-600 text-sm mt-2">
                You can upgrade to <span class="font-bold">Next Day Delivery</span> during checkout for orders before 10 PM.
            </p>
        </div>

    </div>
    <br>
   
    <!-- Footer Section -->
<footer class="footer">
    <div class="footer-container">
        
        <!-- Quick Links -->
        <div class="footer-column">
            <h3>Quick Links</h3>
            <ul>
                <li><a href=""><i class="fas fa-home"></i> Home</a></li>
                <li><a href="#menu"><i class="fas fa-utensils"></i> Menu</a></li>
                <li><a href="#"><i class="fas fa-phone"></i> Contact</a></li>
                <li><a href="#"><i class="fas fa-question-circle"></i> FAQs</a></li>
                <li><a href="#"><i class="fas fa-user-secret"></i> Privacy Policy</a></li>
            </ul>
        </div>

        <!-- Social Media Links -->
        <div class="footer-column">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="https://www.facebook.com/"><i class="fab fa-facebook"></i></a>
                <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
                <a href="https://x.com/i/flow/login?lang=en"><i class="fab fa-twitter"></i></a>
            </div>
        </div>

        <!-- Customer Support -->
        <div class="footer-column">
            <h3>Customer Support</h3>
            <p><i class="fas fa-envelope"></i> support@quickbites.com</p>
            <p><i class="fas fa-phone"></i> +1 234 567 890</p>
            <p><i class="fas fa-map-marker-alt"></i> 123 Food Street, City, USA</p>
        </div>

        <!-- Payment Methods -->
        <div class="footer-column">
            <h3>We Accept</h3>
            <div class="payment-icons">
                <i class="fab fa-cc-visa"></i>
                <i class="fab fa-cc-mastercard"></i>
            </div>
        </div>

    </div>

    <!-- Footer Bottom -->
    <div class="footer-bottom">
        <p>&copy; 2024 QuickBites. All Rights Reserved.</p>
    </div>
</footer>
</body>
</html>