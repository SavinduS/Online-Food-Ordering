document.addEventListener("DOMContentLoaded", function () {
    const orderCard = document.getElementById("orderCard");
    const noOrdersMessage = document.getElementById("no-orders");

    // Optional toggle (if needed for front-end logic)
    let hasOrders = true; // You can control this from backend later

    if (!hasOrders) {
        orderCard.style.display = "none";
        noOrdersMessage.style.display = "block";
    }
});
