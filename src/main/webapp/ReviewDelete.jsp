<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Delete Review</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body class="bg-gray-100 font-sans min-h-screen flex items-center justify-center">

  <div class="bg-white p-10 rounded-lg shadow-lg w-full max-w-xl">
    <h2 class="text-3xl font-bold text-center mb-4 text-red-700">Delete Your Review</h2>

    <!-- ⚠️ Alert Message -->
    <p class="text-center text-sm text-yellow-700 bg-yellow-100 border border-yellow-300 p-3 rounded mb-6">
      <i class="fas fa-exclamation-circle mr-2"></i>
      This review will be permanently deleted. The fields below are not editable.
    </p>

    <form method="post" action="ReviewDeleteServlet" class="space-y-5">

      <!-- Name -->
      <div class="relative">
        <i class="fas fa-user absolute top-3.5 left-4 text-gray-600"></i>
        <input type="text" name="name" value="${param.name}" readonly
               class="w-full pl-12 pr-4 py-3 border border-gray-300 rounded-lg bg-gray-100 text-gray-700 cursor-not-allowed" />
      </div>

      <!-- Email -->
      <div class="relative">
        <i class="fas fa-envelope absolute top-3.5 left-4 text-gray-600"></i>
        <input type="email" name="email" value="${param.email}" readonly
               class="w-full pl-12 pr-4 py-3 border border-gray-300 rounded-lg bg-gray-100 text-gray-700 cursor-not-allowed" />
      </div>

      <!-- Mobile -->
      <div class="relative">
        <i class="fas fa-phone absolute top-3.5 left-4 text-gray-600"></i>
        <input type="tel" name="mobile" value="${param.mobile}" readonly
               class="w-full pl-12 pr-4 py-3 border border-gray-300 rounded-lg bg-gray-100 text-gray-700 cursor-not-allowed" />
      </div>

      <!-- Rating -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">Rating</label>
        <select name="rating" disabled
                class="w-full px-4 py-3 border border-gray-300 rounded-lg bg-gray-100 text-gray-700 cursor-not-allowed">
          <option value="1" ${param.rating == '1' ? 'selected' : ''}>1 - Poor</option>
          <option value="2" ${param.rating == '2' ? 'selected' : ''}>2 - Fair</option>
          <option value="3" ${param.rating == '3' ? 'selected' : ''}>3 - Good</option>
          <option value="4" ${param.rating == '4' ? 'selected' : ''}>4 - Very Good</option>
          <option value="5" ${param.rating == '5' ? 'selected' : ''}>5 - Excellent</option>
        </select>
      </div>

      <!-- Comment -->
      <div class="relative">
        <i class="fas fa-comment absolute top-3.5 left-4 text-gray-600"></i>
        <textarea name="comment" readonly
                  class="w-full pl-12 pr-4 pt-3 pb-2 min-h-[120px] border border-gray-300 rounded-lg bg-gray-100 text-gray-700 resize-none cursor-not-allowed">${param.comment}</textarea>
      </div>

      <!-- Delete Button -->
      <button type="submit"
              class="w-full bg-red-600 hover:bg-red-800 text-white py-3 rounded-lg font-medium flex items-center justify-center gap-2 transition">
        <i class="fas fa-trash-alt"></i> Delete Review
      </button>

    </form>
  </div>

</body>
</html>
