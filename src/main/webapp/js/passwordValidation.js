function validatePasswords(event) {
    var password = document.querySelector('input[name="password"]').value;
    var confirmPassword = document.querySelector('input[name="confirmPassword"]').value;

    if (password !== confirmPassword) {
        event.preventDefault(); // stop form submission
        alert("Passwords do not match! Please re-enter.");
    }
}
