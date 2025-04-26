<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body class="font-[sans-serif] bg-gray-100">

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
    
  </script>

<body class="flex flex-col min-h-screen bg-white z-10">

  <!-- Background & Overlay -->
  <div class="absolute inset-0 -z-10 bg-[url('https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=1950&q=80')] bg-cover bg-center"></div>
  <div class="absolute inset-0 -z-10 bg-black/70 backdrop-blur-sm"></div>
<br><br>
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

        
        <br>
        <br><br>
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

   <%@ include file="./partials/footer.jsp" %>

</body>
</html>