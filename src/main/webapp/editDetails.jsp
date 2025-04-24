<%@ page import="java.util.List" %>
<%@ page import="com.foodordering.model.CartItem" %>
<%@ page import="com.foodordering.model.Delivery" %>

<%
	Delivery delivery = (Delivery) session.getAttribute("delivery");
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Details</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>

<body class="bg-gray-100 font-[Poppins] min-h-screen flex flex-col">
  <main class="flex-grow flex items-center justify-center">
    <div class="w-full max-w-xl bg-white p-8 shadow-lg rounded-lg border border-black">
      <h2 class="text-2xl font-bold mb-6 text-center text-red-600">Edit Delivery Details</h2>

      <% if (delivery != null) { %>
        <form action="UpdateDeliveryServlet" method="post" class="space-y-4">
          <input type="hidden" name="id" value="<%= delivery.getId() %>">

          <input type="text" name="firstName" value="<%= delivery.getFirstName() %>" placeholder="First Name" class="w-full border rounded px-4 py-2" required>
          <input type="text" name="lastName" value="<%= delivery.getLastName() %>" placeholder="Last Name" class="w-full border rounded px-4 py-2" required>
          <input type="email" name="email" value="<%= delivery.getEmail() %>" placeholder="Email" class="w-full border rounded px-4 py-2" required>
          <input type="text" name="phone" value="<%= delivery.getPhone() %>" placeholder="Phone Number" class="w-full border rounded px-4 py-2" required>
          <input type="text" name="address" value="<%= delivery.getAddress() %>" placeholder="Address" class="w-full border rounded px-4 py-2" required>
          <input type="text" name="city" value="<%= delivery.getCity() %>" placeholder="City" class="w-full border rounded px-4 py-2" required>
          <input type="text" name="postalCode" value="<%= delivery.getPostalCode() %>" placeholder="Postal Code" class="w-full border rounded px-4 py-2" required>
         
		
          <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded">
            <i class="fas fa-save mr-1"></i> Update
          </button>
        </form>
      <% } else { %>
        <div class="text-center py-12">
          <p class="text-red-600 text-lg font-semibold">
            <i class="fas fa-exclamation-triangle mr-2"></i>
            No delivery details found to edit.
          </p>
        </div>
      <% } %>
    </div>
  </main>

  <%@ include file="./partials/footer.jsp" %>
</body>
</html>
