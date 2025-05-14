<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Review</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>

<body class="bg-gray-100 font-sans flex flex-col min-h-screen">

  <!-- Page Content Wrapper -->
  <main class="flex-grow flex justify-center px-4 pt-12 pb-24">

    <!-- Form Card -->
    <div class="bg-white p-10 rounded-3xl shadow-2xl w-full max-w-xl border-t-[6px] border-red-600">

      <div class="text-center mb-8">
        <h2 class="text-3xl font-extrabold text-red-700 mb-2 flex justify-center items-center gap-3">
          <i class="fas fa-pen-nib"></i> Edit Your Feedback <i class="fas fa-comment-dots text-yellow-400"></i>
        </h2>
        <p class="text-gray-500 text-sm">Make changes to your previous review.</p>
      </div>

      <form action="ReviewUpdateServlet" method="post" class="space-y-6">

        <!-- Email -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
          <input type="email" name="email" value="${param.email}" readonly
                 class="w-full px-4 py-3 bg-gray-100 border border-gray-300 rounded-lg text-gray-700 cursor-not-allowed">
        </div>

        <!-- Mobile -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Mobile</label>
          <input type="tel" name="mobile" value="${param.mobile}" readonly
                 class="w-full px-4 py-3 bg-gray-100 border border-gray-300 rounded-lg text-gray-700 cursor-not-allowed">
        </div>

        <!-- Rating -->
        <div>
          <label for="rating" class="block text-sm font-medium text-gray-700 mb-1">Your Rating</label>
          <select id="rating" name="rating" required
                  class="w-full px-4 py-3 border border-gray-300 rounded-lg bg-white focus:outline-none focus:border-red-600">
            <option value="" disabled>Choose a rating</option>
            <option value="1" ${param.rating == '1' ? 'selected' : ''}>1 - Poor</option>
            <option value="2" ${param.rating == '2' ? 'selected' : ''}>2 - Fair</option>
            <option value="3" ${param.rating == '3' ? 'selected' : ''}>3 - Good</option>
            <option value="4" ${param.rating == '4' ? 'selected' : ''}>4 - Very Good</option>
            <option value="5" ${param.rating == '5' ? 'selected' : ''}>5 - Excellent</option>
          </select>
        </div>

        <!-- Comment -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Comment</label>
          <textarea name="comment" required rows="4"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-red-600 resize-none">${param.comment}</textarea>
        </div>

        <!-- Submit Button -->
        <button type="submit"
                class="w-full bg-red-600 hover:bg-red-700 text-white font-semibold py-3 rounded-lg transition flex items-center justify-center gap-2">
          <i class="fas fa-paper-plane"></i> Update Review
        </button>

      </form>
    </div>
  </main>

  <%@ include file="./partials/footer.jsp" %>
</body>
</html>
