<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Cart</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>
<body class="font-[sans-serif] bg-gray-100">



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
                <a href="payment.jsp" class="block">
				  <button class="w-full mt-4 bg-black text-white py-2 rounded-lg hover:bg-gray-800">
				    Checkout
				  </button>
				</a>
				                
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
   
<%@ include file="./partials/footer.jsp" %>
</body>
</html>