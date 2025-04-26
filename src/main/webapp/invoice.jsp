<%@ page import="com.foodordering.model.Delivery" %>
<%@ page import="com.foodordering.model.CartModel" %>
<%@ page import="java.util.List" %>




<%
    Delivery delivery = (Delivery) session.getAttribute("delivery");
    List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cartItems");
    double total = 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>QuickBites - Invoice</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- html2pdf.js for PDF generation -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

  <%@ include file="./partials/header.jsp" %>

  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>
</head>

<body class="bg-white text-black pt-32 px-10 pb-10"><br><br>

  <!-- ✅ Invoice Content Wrapper -->
  <div id="invoiceContent" class="max-w-4xl mx-auto border p-8 rounded-lg shadow-lg">

    <!-- Header -->
    <div class="flex justify-between items-center mb-6">
      <div>
        <h1 class="text-3xl font-bold text-red-600">QUICKBITES</h1>
        <p class="text-sm">123 Main Street, Colombo, Sri Lanka</p>
        <p class="text-sm">+94 77 123 4567 | quickbites@email.com</p>
      </div>
      <div class="text-right">
        <h2 class="text-xl font-bold">INVOICE</h2>
        <p class="text-sm text-gray-700">Order ID: <strong>#<%= delivery != null ? delivery.getId() : "N/A" %></strong></p>
        <p class="text-sm">Date: <%= new java.util.Date() %></p>
      </div>
    </div>

    <!-- Customer Details -->
    <div class="grid grid-cols-2 gap-6 mb-8">
      <div>
        <h3 class="font-semibold text-gray-800 mb-1">Bill To:</h3>
        <% if (delivery != null) { %>
          <p><strong><%= delivery.getFirstName() %> <%= delivery.getLastName() %></strong></p>
          <p><%= delivery.getAddress() %>, <%= delivery.getCity() %></p>
          <p>Phone: <%= delivery.getPhone() %></p>
          <p>Email: <%= delivery.getEmail() %></p>
        <% } else { %>
          <p class="text-red-600">No delivery information available.</p>
        <% } %>
      </div>
    </div>

    <!-- Order Table -->
    <table class="w-full text-sm text-left border border-collapse mb-8">
      <thead class="bg-red-600 text-white">
        <tr>
          <th class="p-2 border">Product</th>
          <th class="p-2 border">Quantity</th>
          <th class="p-2 border">Price</th>
          <th class="p-2 border">Amount</th>
        </tr>
      </thead>
      <tbody>
        <% 
          if (cartItems != null && !cartItems.isEmpty()) {
            for (CartModel item : cartItems) {
              double itemTotal = item.getPrice() * item.getQuantity();
              total += itemTotal;
        %>
        <tr class="border">
          <td class="p-2 border"><%= item.getFoodName() %></td>
          <td class="p-2 border"><%= item.getQuantity() %></td>
          <td class="p-2 border">Rs. <%= String.format("%.2f", item.getPrice()) %></td>
          <td class="p-2 border">Rs. <%= String.format("%.2f", itemTotal) %></td>
        </tr>
        <%   } 
          } else { %>
        <tr>
          <td colspan="4" class="p-2 text-red-500 text-center">No cart items found.</td>
        </tr>
        <% } %>
      </tbody>
    </table>

    <!-- Total Summary -->
    <div class="text-right">
      <p class="text-base font-medium">Subtotal: Rs. <%= String.format("%.2f", total) %></p>
      <p class="text-lg font-bold text-black">Total: <span class="text-red-600">Rs. <%= String.format("%.2f", total) %></span></p>
    </div>

    <!-- Footer -->
    <div class="mt-10 text-sm text-gray-700">
      <p><b>Thank you for ordering with QuickBites!</b></p>
      <p>For any inquiries, please contact us at quickbites@email.com</p>
    </div>

  </div>
  <!-- ✅ Invoice End -->

  <!-- ✅ Download Button -->
  <div class="mt-8 text-center">
    <button onclick="downloadInvoice()" class="bg-red-600 hover:bg-red-700 text-white font-semibold px-6 py-2 rounded shadow">
      <i class="fas fa-download mr-1"></i> Download Receipt
    </button>
  </div><br><br>

  <!-- ✅ Script for PDF Download -->
  <script>
    function downloadInvoice() {
      const element = document.getElementById('invoiceContent');
      const opt = {
        margin: 0.5,
        filename: 'QuickBites_Invoice.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait' }
      };
      html2pdf().set(opt).from(element).save();
    }
  </script>

  <%@ include file="./partials/footer.jsp" %>
  
</body>
</html>
