<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>QuickBites</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/home.css">
    <%@ include file="./partials/header.jsp" %>
</head>
<body>


<div class="main-container">
    <!-- Hero Slider Section -->
    <section class="hero">
        <div class="slider">
            <div class="slide active">
                <div class="hero-content">
                    <h1><b>Delicious Burgers, Freshly Made!</b></h1>
                    <p>Order your favorite burger and get it delivered hot & fresh.</p>
                    <a href="#menu" class="order-now-btn"><b>Order Now</b></a>
                </div>
            </div>
            <div class="slide">
                <div class="hero-content">
                    <h1><b>Craving for Pizza?</b></h1>
                    <p>Enjoy cheesy, mouth-watering pizzas delivered in no time.</p>
                    <a href="#menu" class="order-now-btn"><b>Order Now</b></a>
                </div>
            </div>
            <div class="slide">
                <div class="hero-content">
                    <h1><b>Freshly Cooked Pasta, Just for You!</b></h1>
                    <p>Indulge in creamy, flavorful pasta dishes from QuickBites.</p>
                    <a href="#menu" class="order-now-btn"><b>Order Now</b></a>
                </div>
            </div>
        </div>

        <!-- Slider Controls -->
        <div class="slider-controls">
            <button onclick="prevSlide()"><i class="fas fa-chevron-left"></i></button>
            <button onclick="nextSlide()"><i class="fas fa-chevron-right"></i></button>
        </div>
    </section>

    <!-- Featured Categories Section -->
    <section class="featured-categories">
        <h2><b>Explore Our Categories</b></h2>
        <div class="categories-container">
            <div class="category" onclick="location.href='#burgers'">
                <img src="images/burger.jpg" alt="Burgers">
                <div class="category-info">
                    <i class="fas fa-hamburger"></i>
                    <h3><b>Burgers</b></h3>
                </div>
            </div>
            <div class="category" onclick="location.href='#pizzas'">
                <img src="images/pizza.jpg" alt="Pizzas">
                <div class="category-info">
                    <i class="fas fa-pizza-slice"></i>
                    <h3><b>Pizzas</b></h3>
                </div>
            </div>
            <div class="category" onclick="location.href='#desserts'">
                <img src="images/deserts.jpg" alt="Desserts">
                <div class="category-info">
                    <i class="fas fa-ice-cream"></i>
                    <h3><b>Desserts</b></h3>
                </div>
            </div>
            <div class="category" onclick="location.href='#beverages'">
                <img src="images/beverages.jpg" alt="Beverages">
                <div class="category-info">
                    <i class="fas fa-mug-hot"></i>
                    <h3><b>Beverages</b></h3>
                </div>
            </div>
        </div>
    </section>

    <!-- Products Section -->
    <section class="products" id="menu">
        <h2><b>Our Delicious Products</b></h2>

        <!-- Search -->
        <div class="flex items-center bg-white rounded px-2 py-1 ml-auto shadow-md w-full max-w-xs focus-within:ring-2 focus-within:ring-orange-500 transition duration-200">
            <input type="text" id="foodSearch"
                   placeholder="Search food..."
                   class="flex-grow outline-none px-2 py-1 text-sm text-black"/>
            <button id="searchButton" class="text-orange-600 text-lg">
                <i class="fas fa-search"></i>
            </button>
        </div>

        <!-- Burgers -->
        <div class="product-category" id="burgers">
            <h3><i class="fas fa-hamburger"></i> <b>Burgers</b></h3>
            <div class="product-container">
                <c:forEach var="burger" items="${burgers}">
                    <div class="product">
                        <img src="${pageContext.request.contextPath}/images/${burger.imageFilename}" alt="${burger.name}">
                        <h4><b>${burger.name}</b></h4>
                        <p>Rs. ${burger.price}</p>
                        <form action="add-to-cart" method="POST">
    						<input type="hidden" name="food_id" value="${burger.id}" />
   							<button type="submit" class="add-to-cart">Add to Cart</button>
						</form>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Pizzas -->
        <div class="product-category" id="pizzas">
            <h3><i class="fas fa-pizza-slice"></i> <b>Pizzas</b></h3>
            <div class="product-container">
                <c:forEach var="pizza" items="${pizzas}">
                    <div class="product">
                        <img src="${pageContext.request.contextPath}/images/${pizza.imageFilename}" alt="${pizza.name}">
                        <h4><b>${pizza.name}</b></h4>
                        <p>Rs. ${pizza.price}</p>
                        <form action="add-to-cart" method="POST">
    						<input type="hidden" name="food_id" value="${pizza.id}" />
    						<button type="submit" class="add-to-cart">Add to Cart</button>
						</form>

                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Desserts -->
        <div class="product-category" id="desserts">
            <h3><i class="fas fa-ice-cream"></i> <b>Desserts</b></h3>
            <div class="product-container">
                <c:forEach var="dessert" items="${desserts}">
                    <div class="product">
                        <img src="${pageContext.request.contextPath}/images/${dessert.imageFilename}" alt="${dessert.name}">
                        <h4><b>${dessert.name}</b></h4>
                        <p>Rs. ${dessert.price}</p>
                        <form action="add-to-cart" method="POST">
    						<input type="hidden" name="food_id" value="${dessert.id}" />
    						<button type="submit" class="add-to-cart">Add to Cart</button>
						</form>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Beverages -->
        <div class="product-category" id="beverages">
            <h3><i class="fas fa-mug-hot"></i> <b>Beverages</b></h3>
            <div class="product-container">
                <c:forEach var="beverage" items="${beverages}">
                    <div class="product">
                        <img src="${pageContext.request.contextPath}/images/${beverage.imageFilename}" alt="${beverage.name}">
                        <h4><b>${beverage.name}</b></h4>
                        <p>Rs. ${beverage.price}</p>
                        <form action="add-to-cart" method="POST">
   							<input type="hidden" name="food_id" value="${beverage.id}" />
    						<button type="submit" class="add-to-cart">Add to Cart</button>
						</form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works">
        <h2><b>How It Works</b></h2>
        <div class="steps-container">
            <div class="step"><i class="fas fa-utensils"></i><h3><b>Choose Your Meal</b></h3><p>Browse our menu and select your favorite items.</p></div>
            <div class="step"><i class="fas fa-shopping-cart"></i><h3><b>Add to Cart</b></h3><p>Pick your meals and add them to the cart.</p></div>
            <div class="step"><i class="fas fa-credit-card"></i><h3><b>Checkout & Pay</b></h3><p>Pay securely with various payment options.</p></div>
            <div class="step"><i class="fas fa-motorcycle"></i><h3><b>Get It Delivered</b></h3><p>Enjoy fast and fresh home delivery.</p></div>
        </div>
    </section>

    <!-- Special Offers Section -->
    <section class="special-offers">
        <div class="offers-content">
            <div class="offers-image">
                <img src="images/offer.jpg" alt="Special Offers">
            </div>
            <div class="offers-details">
                <h2><b><i class="fas fa-tags"></i> Special Offers & Discounts</b></h2>
                <div class="offers-container">
                    <div class="offer"><i class="fas fa-percentage"></i><h3><b>20% Off First Order</b></h3><p>Use code <strong>WELCOME20</strong></p></div>
                    <div class="offer"><i class="fas fa-gift"></i><h3><b>Buy 1 Get 1 Free</b></h3><p>On all medium pizzas</p></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="cta-section">
        <div class="cta-content">
            <div class="cta-app">
                <h2><b><i class="fas fa-mobile-alt"></i> Download Our App</b></h2>
                <div class="app-buttons">
                    <a href="#" class="app-store"><i class="fab fa-apple"></i> App Store</a>
                    <a href="#" class="google-play"><i class="fab fa-google-play"></i> Google Play</a>
                </div>
            </div>
            <div class="cta-newsletter">
                <h2><b><i class="fas fa-envelope"></i> Newsletter</b></h2>
                <form class="newsletter-form">
                    <input type="email" placeholder="Your email" required>
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
    </section>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const searchInput = document.getElementById("foodSearch");

  searchInput.addEventListener("input", function () {
    const searchText = searchInput.value.toLowerCase();
    const categories = document.querySelectorAll(".product-category");

    categories.forEach(category => {
      let matchFound = false;
      const products = category.querySelectorAll(".product");

      products.forEach(product => {
        const productName = product.querySelector("h4").textContent.toLowerCase();
        if (productName.includes(searchText)) {
          product.style.display = "block";
          matchFound = true;
        } else {
          product.style.display = "none";
        }
      });

      // Show/hide whole category
      category.style.display = matchFound ? "block" : "none";
    });
  });
});
</script>

<script src="js/home.js"></script>
<%@ include file="./partials/footer.jsp" %>
</body>
</html>