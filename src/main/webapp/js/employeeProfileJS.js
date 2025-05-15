//form validation
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

//Password Toggle Script

document.addEventListener("DOMContentLoaded", function () {
	
        const toggle = document.getElementById("showPasswordToggle");
        const pass1 = document.getElementById("password");
        const pass2 = document.getElementById("confirmPassword");

        toggle.addEventListener("change", function () {
            const type = this.checked ? "text" : "password";
            pass1.type = type;
            pass2.type = type;
        });
});
