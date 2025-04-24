document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("paymentForm");

  form.addEventListener("submit", function (e) {
    if (!form.checkValidity()) {
      e.preventDefault();
      e.stopPropagation();
      alert("🚫 Please fill in all required fields correctly before continuing.");
    }
  });

  const backButton = document.getElementById("backButton");
  if (backButton) {
    backButton.addEventListener("click", function () {
      window.location.href = "cart.jsp";
    });
  }
});
