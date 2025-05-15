<%@ page import="java.util.*" %>
<%@ page import="com.foodordering.model.Delivery" %>
<%@ page import="com.foodordering.services.*" %>

<%
    // Step 1: Check login session
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    //  Step 2: Get deliveryId from request
    String deliveryIdParam = request.getParameter("deliveryId");
    Delivery delivery = null;
    List<CartModel> itemsInCart = new ArrayList<>();
    double total = 0.0;

    //  Step 3: Load data only if deliveryId exists
    if (deliveryIdParam != null && !deliveryIdParam.isEmpty()) {
        try {
            int deliveryId = Integer.parseInt(deliveryIdParam);
            DeliveryService deliveryService = new DeliveryService();
            OrderService orderService = new OrderService();

            delivery = deliveryService.getDeliveryById(deliveryId);
            itemsInCart = orderService.getOrderItemsByDeliveryId(deliveryId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //  Step 4: Block access if data missing (protection!)
    if (delivery == null || itemsInCart == null || itemsInCart.isEmpty()) {
        response.sendRedirect("payment.jsp?error=unauthorized");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Delivery Details</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>

<body class="bg-gray-100 font-[Poppins] min-h-screen flex flex-col">
<main class="flex-grow flex items-center justify-center">
  <div class="w-full max-w-xl bg-white p-8 shadow-lg rounded-lg border border-black">
    <h2 class="text-2xl font-bold mb-6 text-center text-red-600">Edit Delivery Details</h2>

    <% if (delivery != null) { %>
    <form action="UpdateDeliveryServlet" method="post" onsubmit="return confirmUpdate()" class="space-y-4">
      <input type="hidden" name="id" value="<%= delivery.getId() %>">

      <h2 class="text-xl font-bold border-b-2 pb-2 mb-5 text-red-600 flex items-center gap-2">
        <i class="fas fa-map-marker-alt"></i> Delivery Details
      </h2>

      <div class="grid grid-cols-2 gap-4">
        <div>
          <label class="font-semibold flex items-center gap-2"><i class="fas fa-user"></i> First Name</label>
          <input type="text" name="firstName" value="<%= delivery.getFirstName() %>" class="w-full border p-2 rounded" required>
        </div>
        <div>
          <label class="font-semibold flex items-center gap-2"><i class="fas fa-user"></i> Last Name</label>
          <input type="text" name="lastName" value="<%= delivery.getLastName() %>" class="w-full border p-2 rounded" required>
        </div>
      </div>

      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-envelope"></i> Email Address</label>
        <input type="email" name="email" value="<%= delivery.getEmail() %>" class="w-full border p-2 rounded" required>
      </div>

      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-phone"></i> Phone Number</label>
        <input type="tel" name="phone" value="<%= delivery.getPhone() %>" class="w-full border p-2 rounded" pattern="[0-9]{10}" maxlength="10" inputmode="numeric" required>
      </div>

      <div>
        <label class="font-semibold flex items-center gap-2"><i class="fas fa-home"></i> Street Address</label>
        <input type="text" name="address" value="<%= delivery.getAddress() %>" class="w-full border p-2 rounded" required>
      </div>

      <div class="grid grid-cols-2 gap-4">
        <div>
          <label class="font-semibold flex items-center gap-2"><i class="fas fa-city"></i> City</label>
          <input type="text" name="city" value="<%= delivery.getCity() %>" class="w-full border p-2 rounded" required>
        </div>
        <div>
          <label class="font-semibold flex items-center gap-2"><i class="fas fa-mail-bulk"></i> Postal Code</label>
          <input type="text" name="postalCode" value="<%= delivery.getPostalCode() %>" class="w-full border p-2 rounded" pattern="[0-9]{5}" maxlength="5" inputmode="numeric" required>
        </div>
      </div>

      <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded mt-6">
        <i class="fas fa-save mr-1"></i> Update
      </button>
    </form>

    <% } else { %>
      <div class="text-center py-12">
        <p class="text-red-600 text-lg font-semibold">
          <i class="fas fa-exclamation-triangle mr-2"></i>
          Delivery details not found.
        </p>
      </div>
    <% } %>
  </div>
</main>

<script>
  function confirmUpdate() {
    return confirm("Are you sure you want to update these details?");
  }
</script>

<%@ include file="./partials/footer.jsp" %>
</body>
</html>
