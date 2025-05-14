<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Privacy Policy & FAQ</title>
   <link rel="icon" type="image/png" href="images/Q.png" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-white text-gray-800 font-sans">

  <!-- Header Include -->
  <%@ include file="./partials/header.jsp" %>

  <!-- Hero Section -->
  <section class="bg-gradient-to-r from-orange-100 to-yellow-100 py-12 text-center">
    <h1 class="text-4xl font-bold mb-2">Privacy Policy & Frequently Asked Questions</h1>
    <p class="text-lg text-gray-600">Your trust matters to us. Read our policy and get your questions answered.</p>
  </section>

  <!-- Privacy Policy -->
  <section class="max-w-4xl mx-auto px-6 py-12">
    <h2 class="text-2xl font-semibold mb-4">Privacy Policy</h2>
    <p class="mb-4">We value your privacy and are committed to protecting your personal data. This Privacy Policy outlines how we collect, use, and safeguard your information.</p>
    
    <ul class="list-disc pl-6 space-y-2 text-gray-700">
      <li><strong>Data Collection:</strong> We collect your name, email, mobile number, and address when you place an order.</li>
      <li><strong>Use of Data:</strong> Data is used only to process orders, communicate with you, and improve our services.</li>
      <li><strong>Data Sharing:</strong> We do not sell or share your personal data with third parties, except when required by law.</li>
      <li><strong>Security:</strong> Your data is stored securely and access is limited to authorized personnel only.</li>
      <li><strong>Cookies:</strong> We use cookies to enhance your browsing experience. You can disable cookies in your browser settings.</li>
    </ul>
  </section>

  <!-- FAQ Section -->
  <section class="bg-gray-100 py-12">
    <div class="max-w-4xl mx-auto px-6">
      <h2 class="text-2xl font-semibold mb-6">Frequently Asked Questions (FAQ)</h2>

      <div class="space-y-4">
        <details class="bg-white p-4 rounded shadow">
          <summary class="font-medium cursor-pointer">How do I place an order?</summary>
          <p class="mt-2 text-gray-600">Browse our menu, add items to your cart, and proceed to checkout. You will need to log in or sign up.</p>
        </details>

        <details class="bg-white p-4 rounded shadow">
          <summary class="font-medium cursor-pointer">Can I cancel or edit my order?</summary>
          <p class="mt-2 text-gray-600">Yes, you can cancel or edit your order before it is out for delivery by going to the 'My Orders' page.</p>
        </details>

        <details class="bg-white p-4 rounded shadow">
          <summary class="font-medium cursor-pointer">How is my payment information handled?</summary>
          <p class="mt-2 text-gray-600">We use secure payment gateways. Your card information is not stored on our servers.</p>
        </details>

        <details class="bg-white p-4 rounded shadow">
          <summary class="font-medium cursor-pointer">Who can I contact for support?</summary>
          <p class="mt-2 text-gray-600">You can reach our support team via the 'Contact Us' page or email us at support@quickbites.com.</p>
        </details>
      </div>
    </div>
  </section>

  <!-- Footer Include -->
  <%@ include file="./partials/footer.jsp" %>

</body>
</html>
