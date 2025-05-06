document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");

    form.addEventListener("submit", function (event) {
        const phone = form.elements["phone_num"].value.trim();
        const password = form.elements["password"].value.trim();
        const confirmPassword = form.elements["password_confirm"].value.trim();

        if (!/^\d{10}$/.test(phone)) {
            alert("Invalid phone number. It must contain exactly 10 digits.");
            event.preventDefault();
            return;
        }

        if (!phone.startsWith("0")) {
            alert("Phone number must start with 0.");
            event.preventDefault();
            return;
        }

        if (password.length > 0 && password.length < 6) {
            alert("Password must be at least 6 characters.");
            event.preventDefault();
            return;
        }

        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            event.preventDefault();
            return;
        }
    });
});