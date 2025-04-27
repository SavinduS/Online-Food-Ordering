<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="icon" type="image/png" href="images/Q.png" />
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
      <a href="home" >QuickBites</a>
    </div>

    <!-- Middle: Navigation -->
    <nav id="navbar" class="hidden md:flex space-x-6 text-white font-medium items-center">
      <a href="home" class="nav-link" data-page="home"><b>Home</b></a>
      <a href="ReviewCreate.jsp" class="nav-link" data-page="ReviewCreate.jsp"><b>Reviews</b></a>
      <a href="AboutUs.jsp" class="nav-link" data-page="AboutUs.jsp"><b>About Us</b></a>
      <a href="home#menu" class="bg-yellow-400 hover:bg-white hover:text-orange-600 text-black px-4 py-2 rounded shadow font-semibold">
        Order Now
      </a>
    </nav>

    <!-- Right: Icons + Log Out -->
    <div class="flex items-center gap-4">
      
      <!-- Cart Icon: only if logged in -->
      <c:if test="${not empty sessionScope.userEmail}">
        <a href="cart" class="relative">
          <i class="fas fa-shopping-cart text-white text-2xl"></i>
        </a>
      </c:if>

      <!-- Dynamic Profile Icon -->
      <c:choose>
        <c:when test="${sessionScope.role == 'user'}">
          <a href="UserProfile.jsp" class="text-white text-xl">
            <i class="fas fa-user"></i>
          </a>
        </c:when>
        <c:when test="${sessionScope.role == 'admin'}">
          <a href="AdminDashboard.jsp" class="text-white text-xl">
            <i class="fas fa-user"></i>
          </a>
        </c:when>
      </c:choose>

      <!-- Log Out Button: always show -->
      <a href="LogoutServlet" class="bg-rose-700 hover:bg-rose-800 text-white px-4 py-1.5 rounded-md text-sm font-semibold shadow-md transition duration-200">
        Log Out
      </a>

    </div>

    <!-- Mobile Menu Icon -->
    <div class="md:hidden text-white text-2xl">
      <i class="fas fa-bars"></i>
    </div>
  </div>
</header>

<!-- Highlight Active Nav Link -->
<script>
  const currentPath = window.location.pathname.split("/").pop(); 
  document.querySelectorAll(".nav-link").forEach(link => {
    if (link.getAttribute("data-page") === currentPath) {
      link.classList.add("border-b-2", "border-yellow-400", "pb-1", "text-yellow-300");
    } else {
      link.classList.add("hover:text-yellow-300", "transition", "duration-200");
    }
  });
</script>

</body>
</html>
