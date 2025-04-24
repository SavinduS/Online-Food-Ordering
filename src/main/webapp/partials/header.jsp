<!DOCTYPE html>
<html lang="en">
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

</body>
</html>
