<%@ page session="true" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodordering.model.CartModel" %>

<%
    List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cartItems");
    int cartCount = (cartItems != null) ? cartItems.size() : 0;
%>

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
      <a href="home">QuickBites</a>
    </div>

    <!-- Middle: Desktop Nav -->
    <nav id="navbar" class="hidden md:flex space-x-6 text-white font-medium items-center">
      <a href="home" class="nav-link" data-page="home"><b>Home</b></a>
      <a href="ReviewDisplay.jsp" class="nav-link" data-page="ReviewDisplay.jsp"><b>Reviews</b></a>
      <a href="AboutUs.jsp" class="nav-link" data-page="AboutUs.jsp"><b>About Us</b></a>
      <a href="home#menu" class="bg-yellow-400 hover:bg-white hover:text-orange-600 text-black px-4 py-2 rounded shadow font-semibold">
        Order Now
      </a>
    </nav>

    <!-- Right: Icons -->
    <div class="flex items-center gap-4">

      <!-- Cart Icon with Count -->
      <c:if test="${not empty sessionScope.userEmail}">
        <a href="cart" class="relative text-white text-2xl">
          <i class="fas fa-shopping-cart"></i>
          <c:if test="<%= cartCount > 0 %>">
            <span class="absolute -top-2 -right-2 bg-red-600 text-white text-xs px-2 py-0.5 rounded-full">
              <%= cartCount %>
            </span>
          </c:if>
        </a>
      </c:if>

      <!-- Profile Icon -->
      <c:choose>
        <c:when test="${sessionScope.role == 'user'}">
          <a href="UserProfile.jsp" class="text-white text-xl">
            <i class="fas fa-user"></i>
          </a>
        </c:when>
        <c:when test="${sessionScope.role == 'Manager' || sessionScope.role == 'Staff' || sessionScope.role == 'Delivery_Person'}">
          <a href="AdminDashboard.jsp" class="text-white text-xl">
            <i class="fas fa-user"></i>
          </a>
        </c:when>
      </c:choose>

      <!-- Log Out Button -->
      <a href="LogoutServlet" class="bg-rose-700 hover:bg-rose-800 text-white px-4 py-1.5 rounded-md text-sm font-semibold shadow-md transition duration-200">
        Log Out
      </a>

      <!-- Mobile Toggle -->
      <button id="menu-toggle" class="md:hidden text-white text-2xl">
        <i class="fas fa-bars"></i>
      </button>
    </div>
  </div>

  <!-- Mobile Menu -->
  <div id="mobile-menu" class="md:hidden hidden px-4 pb-4 bg-orange-500 text-white space-y-3 text-center">
    <a href="home" class="block font-semibold">Home</a>
    <a href="ReviewDisplay.jsp" class="block font-semibold">Reviews</a>
    <a href="AboutUs.jsp" class="block font-semibold">About Us</a>
    <a href="home#menu" class="block font-semibold bg-yellow-400 text-black px-3 py-1 rounded">Order Now</a>
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

<!-- Toggle Script -->
<script>
  document.addEventListener('DOMContentLoaded', () => {
    const toggle = document.getElementById('menu-toggle');
    const mobileMenu = document.getElementById('mobile-menu');

    if (toggle && mobileMenu) {
      toggle.addEventListener('click', () => {
        mobileMenu.classList.toggle('hidden');
      });
    }
  });
</script>

</body>
</html>
