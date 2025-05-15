<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/png" href="images/Q.png" />
  <title>Sign Up - Quickbites</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="flex items-center justify-center min-h-screen bg-gradient-to-br from-black via-gray-900 to-black text-white">

  <div class="w-full max-w-4xl flex rounded-lg shadow-2xl overflow-hidden">

    <!-- Left Side -->
    <div class="w-1/2 relative">
      <img src="asserts/burger.jpg" alt="Burger" class="w-full h-full object-cover rounded-l-lg">
      <div class="absolute inset-0 bg-black bg-opacity-50 p-8 text-white flex flex-col justify-center">
        <h1 class="text-3xl font-bold">Quickbites</h1>
        <p class="mt-4 text-lg font-semibold">Delicious food is waiting for you</p>
        <p class="mt-2 text-gray-300">Join thousands of food lovers and get your favorite meals delivered to your doorstep.</p>
        <div class="mt-6">
          <p class="text-xl font-bold">2M+</p>
          <p class="text-sm text-gray-300">Happy Customers</p>
        </div>
        <div class="mt-4">
          <p class="text-xl font-bold">500+</p>
          <p class="text-sm text-gray-300">Restaurants</p>
        </div>
      </div>
    </div>

    <!-- Right Side -->
    <div class="w-1/2 p-8 bg-gray-900 text-white rounded-r-lg shadow-lg">
      <h2 class="text-2xl font-bold">Create Account</h2>
      <p class="text-gray-400">Start ordering your favorite food today</p>

      <form action="UserRegServelet" method="post" class="mt-6" onsubmit="return validatePasswords(event)">
        <div class="flex space-x-4">
          <input type="text" name="firstName" placeholder="First Name" class="w-1/2 p-3 border border-gray-600 rounded-lg bg-gray-700 text-white" required>
          <input type="text" name="lastName" placeholder="Last Name" class="w-1/2 p-3 border border-gray-600 rounded-lg bg-gray-700 text-white" required>
        </div>
        <input type="email" name="email" placeholder="Email Address" class="w-full mt-4 p-3 border border-gray-600 rounded-lg bg-gray-700 text-white" required>

        <!-- Password Field with Eye Toggle -->
        <div class="relative mt-4">
          <input type="password" name="password" id="password" placeholder="Password" class="w-full p-3 pr-10 border border-gray-600 rounded-lg bg-gray-700 text-white" required>
          <i class="fas fa-eye absolute right-3 top-3.5 text-gray-400 cursor-pointer" onclick="togglePassword('password', this)"></i>
        </div>

        <!-- Confirm Password Field with Eye Toggle -->
        <div class="relative mt-4">
          <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" class="w-full p-3 pr-10 border border-gray-600 rounded-lg bg-gray-700 text-white" required>
          <i class="fas fa-eye absolute right-3 top-3.5 text-gray-400 cursor-pointer" onclick="togglePassword('confirmPassword', this)"></i>
        </div>

        <input type="tel" name="phone" placeholder="Phone Number" class="w-full mt-4 p-3 border border-gray-600 rounded-lg bg-gray-700 text-white" pattern="[0-9]{10}" title="Enter a 10-digit phone number" required>

        <div class="mt-2 flex items-center text-sm">
          <input type="checkbox" name="agree" required class="mr-2">
          <p class="text-gray-400">I agree to the <span class="text-red-500">Terms of Service</span> and <span class="text-red-500">Privacy Policy</span></p>
        </div>
        <button type="submit" class="w-full mt-4 bg-red-600 text-white py-3 rounded-lg hover:bg-red-700 transition duration-300 ease-in-out">Create Account</button>

        <div class="mt-6 text-center text-gray-500">Or continue with</div>
        <div class="flex justify-center mt-4 space-x-4">
          <button type="button" class="flex items-center justify-center w-12 h-12 border border-gray-600 rounded-full text-gray-600 hover:text-white hover:bg-[#DB4437] transition duration-300">
            <i class="fa-brands fa-google text-2xl"></i>
          </button>
          <button type="button" class="flex items-center justify-center w-12 h-12 border border-gray-600 rounded-full text-gray-600 hover:text-white hover:bg-[#1877F2] transition duration-300">
            <i class="fa-brands fa-facebook-f text-2xl"></i>
          </button>
        </div>

        <p class="text-center text-gray-400 mt-4">
          Already have an account?
          <a href="Login.jsp" class="text-red-500 underline hover:text-red-600">Sign in</a>
        </p>
      </form>
    </div>
  </div>

  <!-- JavaScript for Validation and Eye Toggle -->
  <script>
    function togglePassword(fieldId, icon) {
      const input = document.getElementById(fieldId);
      if (input.type === "password") {
        input.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
      } else {
        input.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
      }
    }

    function validatePasswords(event) {
      const pw = document.getElementById("password").value.trim();
      const cpw = document.getElementById("confirmPassword").value.trim();

      if (pw !== cpw) {
        alert("Passwords do not match!");
        event.preventDefault();
        return false;
      }
      return true;
    }
  </script>
</body>
</html>
