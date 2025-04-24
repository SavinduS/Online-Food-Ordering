<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>QuickBites</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
</head>
<body class="bg-gray-50">

<!-- Header -->
<header class="sticky top-0 z-50 bg-orange-600 shadow-md font-[sans-serif]">
  <div class="max-w-7xl mx-auto px-4 py-4 flex items-center justify-between">

    <!-- Left: Logo -->
    <div class="text-white text-2xl font-bold flex items-center gap-2">
      <i class="fas fa-utensils"></i>
      <a href="#">QuickBites</a>
    </div>

    <!-- Middle: Navigation -->
    <nav class="hidden md:flex space-x-6 text-white font-medium items-center">
      <a href="home" class="hover:text-yellow-300">Home</a>
      <a href="Review.jsp" class="hover:text-yellow-300">Reviews</a>
      <a href="AboutUs.jsp" class="hover:text-yellow-300">About Us</a>
      <a href="#menu" class="bg-yellow-400 hover:bg-white hover:text-orange-600 text-black px-4 py-2 rounded shadow font-semibold">
        Order Now
      </a>
    </nav>

    <!-- Right: Icons + Log Out -->
    <div class="flex items-center gap-4">
     

      <!-- Cart Icon -->
      <a href="cart.jsp" class="text-white text-xl relative">
        <i class="fas fa-shopping-cart"></i>
        
      </a>

      <!-- User Icon -->
      <a href="profile.jsp" class="text-white text-xl"><i class="fas fa-user"></i></a>

      <!-- Log Out Button (Black) -->
    <a href="logout.jsp"
   class="bg-rose-700 hover:bg-rose-800 text-white px-4 py-1.5 rounded-md text-sm font-semibold shadow-md transition duration-200">
   Log Out
</a>
    
     
    </div>

    <!-- Mobile Menu Icon -->
    <div class="md:hidden text-white text-2xl">
      <i class="fas fa-bars"></i>
    </div>
  </div>
</header>



</body>
</html>
