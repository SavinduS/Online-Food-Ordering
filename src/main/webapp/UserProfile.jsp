<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.foodordering.Util.DBConnect" %>
<%
    String email = (String) session.getAttribute("userEmail");

    if (email == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String firstName = "", lastName = "", phone = "";

    try {
        Connection conn = DBConnect.getConnection();
        PreparedStatement stmt = conn.prepareStatement("SELECT firstname, lastname, phonenumber FROM customerregistration WHERE email = ?");
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            firstName = rs.getString("firstname");
            lastName = rs.getString("lastname");
            phone = rs.getString("phonenumber");
        }

        rs.close();
        stmt.close();
        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Quickbites Profile</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="css/Footer.css"></link>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <script>
    function validateUpdateForm() {
      const pass = document.getElementById("newPassword").value;
      const confirm = document.getElementById("confirmPassword").value;
      if (pass !== "" && pass !== confirm) {
        alert("Passwords do not match!");
        return false;
      }
      return true;
    }
  </script>
</head>
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
<br><br>
<body class="flex flex-col min-h-screen bg-white z-10">

  <!-- Background & Overlay -->
  <div class="absolute inset-0 -z-10 bg-[url('https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1950&q=80')] bg-cover bg-center"></div>
  <div class="absolute inset-0 -z-10 bg-black/70 backdrop-blur-sm"></div>

  <!-- Page Content Wrapper to push footer down -->
  <div class="flex-grow pb-28">
    <!-- Main Content -->
    <div class="relative max-w-6xl mx-auto w-full bg-white/90 rounded-2xl shadow-xl overflow-hidden grid grid-cols-1 md:grid-cols-2 p-8 md:p-12">

      <!-- Profile Sidebar -->
      <div class="flex flex-col items-center text-center bg-white rounded-xl p-6 shadow-md">
        <h2 class="text-3xl font-bold text-gray-900">Hi, <%= firstName %> 👋</h2>
        <div class="text-left w-full mt-6 space-y-4 text-base text-gray-700">
          <p><strong>Full Name:</strong> <span class="text-lg font-semibold"><%= firstName + " " + lastName %></span></p>
          <p><strong>Email:</strong> <span class="text-lg font-semibold"><%= email %></span></p>
          <p><strong>Phone:</strong> <span class="text-lg font-semibold"><%= phone %></span></p>
        </div>

        <!-- Logout Button (Blue) -->
        <div class="mt-6">
          <a href="LogoutServlet" class="bg-blue-600 text-white px-5 py-2 rounded-full hover:bg-blue-700 transition text-base">
            👋 Log Out
          </a>
        </div>
        <br>
        <form action="DeleteAccountServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your account?');">
            <input type="hidden" name="email" value="<%= email %>">
            <button type="submit" class="bg-red-600 text-white px-6 py-2 rounded-lg hover:bg-red-700 transition">
              Delete Account
            </button>
        </form>
      </div>

      <!-- Edit Info Form -->
      <form action="UpdateProfileServlet" method="post" onsubmit="return validateUpdateForm();" class="mt-8 md:mt-0 md:ml-8 space-y-6 text-gray-800 w-full">
        <h2 class="text-2xl font-bold text-black">Edit Information</h2>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-medium mb-1">First Name</label>
            <input type="text" name="firstName" value="<%= firstName %>" required class="w-full p-3 border border-gray-300 rounded-lg" />
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">Last Name</label>
            <input type="text" name="lastName" value="<%= lastName %>" required class="w-full p-3 border border-gray-300 rounded-lg" />
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">Phone Number</label>
            <input type="text" name="phone" value="<%= phone %>" required class="w-full p-3 border border-gray-300 rounded-lg" />
          </div>
        </div>

        <!-- Password Fields -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-medium mb-1">New Password</label>
            <input type="password" name="password" id="newPassword" class="w-full p-3 border border-gray-300 rounded-lg" placeholder="Leave blank if no change">
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">Confirm Password</label>
            <input type="password" name="confirmPassword" id="confirmPassword" class="w-full p-3 border border-gray-300 rounded-lg">
          </div>
        </div>

        <input type="hidden" name="email" value="<%= email %>" />

        <div class="flex justify-between items-center gap-4 mt-6">
          <button type="submit" class="bg-black text-white px-6 py-2 rounded-lg hover:bg-gray-800 transition">
            Save Changes
          </button>
        </div>
      </form>
    </div>
  </div>

  <!-- Footer Start -->
  <footer class="footer z-10 relative mt-auto">
    <div class="footer-container">
        <div class="footer-column">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="#menu"><i class="fas fa-utensils"></i> Menu</a></li>
                <li><a href="#"><i class="fas fa-phone"></i> Contact</a></li>
                <li><a href="#"><i class="fas fa-question-circle"></i> FAQs</a></li>
                <li><a href="#"><i class="fas fa-user-secret"></i> Privacy Policy</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="https://www.facebook.com/"><i class="fab fa-facebook"></i></a>
                <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
                <a href="https://x.com/i/flow/login?lang=en"><i class="fab fa-twitter"></i></a>
            </div>
        </div>
        <div class="footer-column">
            <h3>Customer Support</h3>
            <p><i class="fas fa-envelope"></i> support@quickbites.com</p>
            <p><i class="fas fa-phone"></i> +1 234 567 890</p>
            <p><i class="fas fa-map-marker-alt"></i> 123 Food Street, City, USA</p>
        </div>
        <div class="footer-column">
            <h3>We Accept</h3>
            <div class="payment-icons">
                <i class="fab fa-cc-visa"></i>
                <i class="fab fa-cc-mastercard"></i>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 QuickBites. All Rights Reserved.</p>
    </div>
  </footer>
  <!-- Footer End -->

</body>
</html>