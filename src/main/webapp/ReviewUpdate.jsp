<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Review</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

 



<body class="bg-gray-100 font-sans min-h-screen flex items-center justify-center">

  <div class="bg-white p-10 rounded-lg shadow-lg w-full max-w-xl">
    <h2 class="text-2xl font-bold text-center mb-6 text-red-700">Update Your Review</h2>

    <form method="post" action="ReviewUpdateServlet" class="space-y-5 flex-grow">

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
        <label for="rating" class="block text-sm font-medium text-gray-700 mb-1">Select Your Rating:</label>
        <select id="rating" name="rating" required
                class="w-full px-4 py-3 border border-gray-300 rounded-lg bg-white text-gray-800 focus:outline-none focus:border-red-600">
          <option value="" disabled>Choose a rating</option>
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
        <textarea name="comment" required
                  class="w-full pl-12 pr-4 pt-3 pb-2 min-h-[120px] border border-gray-300 rounded-lg focus:outline-none focus:border-red-600 resize-none">${param.comment}</textarea>
      </div>

      <!-- Submit Button -->
      <button type="submit"
              class="w-full bg-red-600 hover:bg-red-800 text-white py-3 rounded-lg font-medium flex items-center justify-center gap-2 transition">
        <i class="fas fa-paper-plane"></i> Update Review
      </button>

    </form>
  </div>

</body>
</html>
