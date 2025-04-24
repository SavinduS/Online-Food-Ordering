<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>QuickBites - Online Food Ordering</title>
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
                    <h1>Delicious Burgers, Freshly Made!</h1>
                    <p>Order your favorite burger and get it delivered hot & fresh.</p>
                    <a href="#menu" class="order-now-btn">Order Now</a>
                </div>
            </div>
            <div class="slide">
                <div class="hero-content">
                    <h1>Craving for Pizza?</h1>
                    <p>Enjoy cheesy, mouth-watering pizzas delivered in no time.</p>
                    <a href="#menu" class="order-now-btn">Order Now</a>
                </div>
            </div>
            <div class="slide">
                <div class="hero-content">
                    <h1>Freshly Cooked Pasta, Just for You!</h1>
                    <p>Indulge in creamy, flavorful pasta dishes from QuickBites.</p>
                    <a href="#menu" class="order-now-btn">Order Now</a>
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
        <h2>Explore Our Categories</h2>
        <div class="categories-container">
            <div class="category" onclick="location.href='#burgers'">
                <img src="images/burger.jpg" alt="Burgers">
                <div class="category-info">
                    <i class="fas fa-hamburger"></i>
                    <h3>Burgers</h3>
                </div>
            </div>
            <div class="category" onclick="location.href='#pizzas'">
                <img src="images/pizza.jpg" alt="Pizzas">
                <div class="category-info">
                    <i class="fas fa-pizza-slice"></i>
                    <h3>Pizzas</h3>
                </div>
            </div>
            <div class="category" onclick="location.href='#desserts'">
                <img src="images/deserts.jpg" alt="Desserts">
                <div class="category-info">
                    <i class="fas fa-ice-cream"></i>
                    <h3>Desserts</h3>
                </div>
            </div>
            <div class="category" onclick="location.href='#beverages'">
                <img src="images/beverages.jpg" alt="Beverages">
                <div class="category-info">
                    <i class="fas fa-mug-hot"></i>
                    <h3>Beverages</h3>
                </div>
            </div>
        </div>
    </section>

    <!-- Products Section -->
<section class="products" id="menu">
    <h2>Our Delicious Products</h2>

    <!-- Burgers -->
    <div class="product-category" id="burgers">
        <h3><i class="fas fa-hamburger"></i> Burgers</h3>
        <div class="product-container">
            <c:forEach var="burger" items="${burgers}">
                <div class="product">
                    <img src="${pageContext.request.contextPath}/images/${burger.imageFilename}" alt="${burger.name}">
                    <h4>${burger.name}</h4>
                    <p>Rs. ${burger.price}</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Pizzas -->
    <div class="product-category" id="pizzas">
        <h3><i class="fas fa-pizza-slice"></i> Pizzas</h3>
        <div class="product-container">
            <c:forEach var="pizza" items="${pizzas}">
                <div class="product">
                    <img src="${pageContext.request.contextPath}/images/${pizza.imageFilename}" alt="${pizza.name}">
                    <h4>${pizza.name}</h4>
                    <p>Rs. ${pizza.price}</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Desserts -->
    <div class="product-category" id="desserts">
        <h3><i class="fas fa-ice-cream"></i> Desserts</h3>
        <div class="product-container">
            <c:forEach var="dessert" items="${desserts}">
                <div class="product">
                    <img src="${pageContext.request.contextPath}/images/${dessert.imageFilename}" alt="${dessert.name}">
                    <h4>${dessert.name}</h4>
                    <p>Rs. ${dessert.price}</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Beverages -->
    <div class="product-category" id="beverages">
        <h3><i class="fas fa-mug-hot"></i> Beverages</h3>
        <div class="product-container">
            <c:forEach var="beverage" items="${beverages}">
                <div class="product">
                    <img src="${pageContext.request.contextPath}/images/${beverage.imageFilename}" alt="${beverage.name}">
                    <h4>${beverage.name}</h4>
                    <p>Rs. ${beverage.price}</p>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </c:forEach>
        </div>
    </div>
</section>


    <!-- How It Works Section -->
    <section class="how-it-works">
        <h2>How It Works</h2>
        <div class="steps-container">
            <div class="step"><i class="fas fa-utensils"></i><h3>Choose Your Meal</h3><p>Browse our menu and select your favorite items.</p></div>
            <div class="step"><i class="fas fa-shopping-cart"></i><h3>Add to Cart</h3><p>Pick your meals and add them to the cart.</p></div>
            <div class="step"><i class="fas fa-credit-card"></i><h3>Checkout & Pay</h3><p>Pay securely with various payment options.</p></div>
            <div class="step"><i class="fas fa-motorcycle"></i><h3>Get It Delivered</h3><p>Enjoy fast and fresh home delivery.</p></div>
        </div>
    </section>

    <!-- Special Offers Section -->
    <section class="special-offers">
        <div class="offers-content">
            <div class="offers-image">
                <img src="images/offer.jpg" alt="Special Offers">
            </div>
            <div class="offers-details">
                <h2><i class="fas fa-tags"></i> Special Offers & Discounts</h2>
                <div class="offers-container">
                    <div class="offer"><i class="fas fa-percentage"></i><h3>20% Off First Order</h3><p>Use code <strong>WELCOME20</strong></p></div>
                    <div class="offer"><i class="fas fa-gift"></i><h3>Buy 1 Get 1 Free</h3><p>On all medium pizzas</p></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="cta-section">
        <div class="cta-content">
            <div class="cta-app">
                <h2><i class="fas fa-mobile-alt"></i> Download Our App</h2>
                <div class="app-buttons">
                    <a href="#" class="app-store"><i class="fab fa-apple"></i> App Store</a>
                    <a href="#" class="google-play"><i class="fab fa-google-play"></i> Google Play</a>
                </div>
            </div>
            <div class="cta-newsletter">
                <h2><i class="fas fa-envelope"></i> Newsletter</h2>
                <form class="newsletter-form">
                    <input type="email" placeholder="Your email" required>
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
    </section>
</div>

<script src="js/home.js"></script>
<%@ include file="./partials/footer.jsp" %>
</body>
</html>
