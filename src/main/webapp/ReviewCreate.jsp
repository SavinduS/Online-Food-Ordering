<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // 🔐 Session validation
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("Login.jsp");
        return;
    }%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Review Create</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>

<body class="bg-white font-sans overflow-x-hidden flex flex-col min-h-screen">

<!-- Hero Wave Section (Fixed Height) -->
<section class="relative h-[180px] bg-white">
  <div class="absolute top-0 left-0 w-full overflow-hidden leading-[0] z-0">
    <svg class="relative block w-full h-full" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
      <path d="M0,64 C480,160 1440,-40 1920,80 L1920,0 L0,0 Z" fill="url(#grad1)" />
      <defs>
        <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%" stop-color="#FFA500" />
          <stop offset="50%" stop-color="#FFC933" />
          <stop offset="100%" stop-color="#FFE066" />
        </linearGradient>
      </defs>
    </svg>
  </div><br><br><br><br>
</section><br><br><br><br>

<!-- Feedback Summary Message + Button (3D Style & Centered) -->
<section class="relative z-10 flex justify-center bg-[#f9f9f9] px-4 pb-24 -mt-32"><br><br><br>
  <div class="w-full max-w-3xl text-center bg-white/90 backdrop-blur-md p-12 rounded-[2rem]
              border border-yellow-100 shadow-[0_20px_60px_rgba(0,0,0,0.2)] 
              transition-all duration-300 hover:-translate-y-1">
    
    <h1 class="text-4xl font-bold text-gray-800 mb-4 drop-shadow-md">
      Your feedback makes every bite better!
    </h1><br>
    
    <p class="text-lg text-gray-600 mb-8">
  Tell us what you think, and help us make QuickBites even better for everyone.<br>
  Your honest feedback helps us improve our service, fine-tune our flavors, and bring more joy to every meal we serve.
  Whether it's a small suggestion or a big idea — we’re listening!
</p>
    
    <a href="ReviewDisplay.jsp"
       class="inline-block bg-yellow-400 hover:bg-yellow-500 text-white font-semibold 
              px-8 py-3 rounded-full shadow-lg transition hover:shadow-2xl">
      Our Reviews
    </a><br><br>
  </div>
</section>

     
  <!-- Icons + Slogan Section with Orange-Yellow Gradient -->
  <section class="relative py-24 px-6 bg-gradient-to-br from-[#FFA500] via-[#FFC933] to-[#FFE066] overflow-hidden z-10">
    <div class="absolute w-72 h-72 bg-[#fff3cd] rounded-full top-[-50px] left-[-80px] opacity-40 z-0"></div>
    <div class="absolute w-80 h-80 bg-[#ffe8a1] rounded-full bottom-[-60px] right-[-100px] opacity-40 z-0"></div>

    <div class="relative z-10 max-w-5xl mx-auto flex flex-col items-center justify-center gap-8 text-center">
      <div class="flex gap-12 justify-center items-center">
        <div class="group w-24 h-24 rounded-full bg-white shadow-md flex items-center justify-center border border-yellow-400 hover:bg-yellow-100 transition">
          <i class="fas fa-pen-nib text-3xl text-yellow-500 group-hover:text-yellow-600 transition"></i>
        </div>
        <div>
          <h2 class="text-3xl md:text-4xl font-extrabold text-white drop-shadow-[2px_4px_6px_rgba(0,0,0,0.4)]">We'd love to hear from you!</h2>
          <p class="text-lg text-white/90 mt-2 drop-shadow-[1px_2px_4px_rgba(0,0,0,0.25)]">Help us make QuickBites tastier — one review at a time.</p>
        </div>
        <div class="group w-24 h-24 rounded-full bg-white shadow-md flex items-center justify-center border border-yellow-400 hover:bg-red-100 transition">
          <i class="fas fa-heart text-3xl text-red-400 group-hover:text-red-600 transition"></i>
        </div>
      </div>
    </div>
  </section>

  <!-- Review Form Section -->
  <section class="relative bg-white py-16">
    <div class="max-w-xl mx-auto bg-white p-10 rounded-3xl shadow-[0_30px_90px_rgba(0,0,0,0.25)] border border-yellow-100">
      <h2 class="text-2xl font-bold text-gray-800 text-center mb-6">Submit Your Review</h2>
      <form id="reviewForm" action="RegisterServlet" method="post" autocomplete="off" class="space-y-6">
        <div class="relative">
          <i class="fas fa-user absolute top-3.5 left-4 text-yellow-300 text-xl opacity-20"></i>
          <input type="text" name="name" placeholder="Your Name*" required class="w-full pl-12 py-3 border border-gray-200 rounded-lg focus:outline-none focus:border-yellow-400 bg-white shadow-sm">
        </div>
        <div class="relative">
          <i class="fas fa-envelope absolute top-3.5 left-4 text-yellow-300 text-xl opacity-20"></i>
          <input type="email" name="email" placeholder="Your Email*" required class="w-full pl-12 py-3 border border-gray-200 rounded-lg focus:outline-none focus:border-yellow-400 bg-white shadow-sm">
        </div>
        <div class="relative">
          <i class="fas fa-phone absolute top-3.5 left-4 text-yellow-300 text-xl opacity-20"></i>
          <input type="tel" name="mobile" placeholder="Your Phone Number*" pattern="[0-9]{10}" maxlength="10" required class="w-full pl-12 py-3 border border-gray-200 rounded-lg focus:outline-none focus:border-yellow-400 bg-white shadow-sm">
        </div>
        <div class="relative">
          <i class="fas fa-star absolute top-3.5 left-4 text-yellow-300 text-xl opacity-20"></i>
          <select name="rating" required class="w-full pl-12 pr-4 py-3 border border-gray-200 rounded-lg bg-white focus:outline-none focus:border-yellow-400 shadow-sm">
            <option value="" disabled selected>Rating*</option>
            <option value="1">1 - Poor</option>
            <option value="2">2 - Fair</option>
            <option value="3">3 - Good</option>
            <option value="4">4 - Very Good</option>
            <option value="5">5 - Excellent</option>
          </select>
        </div>
        <div class="relative">
          <i class="fas fa-comment-dots absolute top-4 left-4 text-yellow-300 text-xl opacity-20"></i>
          <textarea name="message" rows="4" placeholder="Your Review*" required class="w-full pl-12 pt-4 pr-4 pb-2 border border-gray-200 rounded-lg focus:outline-none focus:border-yellow-400 resize-none shadow-sm bg-white"></textarea>
        </div>
        <button type="submit" class="bg-yellow-400 hover:bg-yellow-500 text-white font-semibold py-3 rounded-lg w-full transition">
          Submit Review
        </button>
      </form>
     </section>


  <%@ include file="./partials/footer.jsp" %>
</body>
</html>
