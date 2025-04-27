<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, com.foodordering.Util.DBConnect" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>

  <style>
    /* Light background animation */
    @keyframes gradientMove {
      0%, 100% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
    }
    .animated-bg {
      background: linear-gradient(270deg, #f8fafc, #e2e8f0, #f8fafc);
      background-size: 600% 600%;
      animation: gradientMove 20s ease infinite;
    }
  </style>

  <script>
    tailwind.config = {
      theme: {
        extend: {
          animation: {
            'fade-in-up': 'fadeInUp 1s ease-out both',
            'bounce-slow': 'bounceSlow 2s infinite',
          },
          keyframes: {
            fadeInUp: {
              '0%': { opacity: '0', transform: 'translateY(20px)' },
              '100%': { opacity: '1', transform: 'translateY(0)' },
            },
            bounceSlow: {
              '0%, 100%': { transform: 'translateY(0)' },
              '50%': { transform: 'translateY(-5px)' },
            }
          }
        }
      }
    }
  </script>

</head>

<body class="font-[sans-serif] relative overflow-hidden bg-white min-h-screen flex flex-col">

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
<br><br>
<!-- Background Animation -->
<div class="absolute inset-0 -z-10 animated-bg"></div>

<!-- Main Content -->
<div class="flex-grow flex items-center justify-center pb-28 p-6">
  <div class="relative max-w-6xl w-full bg-white/90 rounded-2xl shadow-2xl overflow-hidden grid grid-cols-1 md:grid-cols-2 p-8 md:p-12 backdrop-blur-md animate-fade-in-up duration-1000">

    <!-- Profile Sidebar -->
    <div class="flex flex-col items-center text-center bg-white/90 rounded-xl p-8 shadow-md text-black space-y-6">
      
      <!-- Avatar + Hi User Section -->
      <div class="flex flex-col items-center space-y-4">
        <div class="w-24 h-24 flex items-center justify-center rounded-full bg-gray-200 border-4 border-white shadow-md hover:animate-bounce-slow cursor-pointer">
          <i class="fas fa-user text-4xl text-gray-600"></i>
        </div>
        <h2 class="text-3xl font-bold">Hi, <%= firstName %> 👋</h2>
      </div>

      <!-- User Details -->
      <div class="text-left w-full mt-6 space-y-4">
        <p><strong>Full Name:</strong> <span class="text-lg font-semibold"><%= firstName + " " + lastName %></span></p>
        <p><strong>Email:</strong> <span class="text-lg font-semibold"><%= email %></span></p>
        <p><strong>Phone:</strong> <span class="text-lg font-semibold"><%= phone %></span></p>
      </div>

      <!-- Delete Account Button -->
      <form action="DeleteAccountServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your account?');" class="w-full mt-6">
        <input type="hidden" name="email" value="<%= email %>">
        <button type="submit" class="w-full bg-red-600 hover:bg-red-700 py-3 rounded-lg text-white font-semibold transition">
          Delete Account
        </button>
      </form>

    </div>

    <!-- Edit Profile Form -->
    <form action="UpdateProfileServlet" method="post" onsubmit="return validateUpdateForm();" class="mt-8 md:mt-0 md:ml-8 space-y-6 text-black">

      <h2 class="text-2xl font-bold">Edit Information</h2>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="block text-sm font-medium mb-1">First Name</label>
          <input type="text" name="firstName" value="<%= firstName %>" required class="w-full p-3 rounded-lg bg-white border border-gray-300 text-black placeholder-gray-400 focus:ring-2 focus:ring-blue-400" />
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">Last Name</label>
          <input type="text" name="lastName" value="<%= lastName %>" required class="w-full p-3 rounded-lg bg-white border border-gray-300 text-black placeholder-gray-400 focus:ring-2 focus:ring-blue-400" />
        </div>
        <div class="md:col-span-2">
          <label class="block text-sm font-medium mb-1">Phone Number</label>
          <input type="text" name="phone" value="<%= phone %>" required class="w-full p-3 rounded-lg bg-white border border-gray-300 text-black placeholder-gray-400 focus:ring-2 focus:ring-blue-400" />
        </div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="block text-sm font-medium mb-1">New Password</label>
          <input type="password" name="password" id="newPassword" class="w-full p-3 rounded-lg bg-white border border-gray-300 text-black placeholder-gray-400 focus:ring-2 focus:ring-blue-400" placeholder="Leave blank if no change">
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">Confirm Password</label>
          <input type="password" name="confirmPassword" id="confirmPassword" class="w-full p-3 rounded-lg bg-white border border-gray-300 text-black placeholder-gray-400 focus:ring-2 focus:ring-blue-400">
        </div>
      </div>

      <input type="hidden" name="email" value="<%= email %>">

      <div class="pt-4">
        <button type="submit" class="w-full bg-black hover:bg-gray-800 py-3 rounded-lg text-white font-semibold transition">
          Save Changes
        </button>
      </div>

    </form>

  </div>
</div>

<%@ include file="./partials/footer.jsp" %>

</body>
</html>
