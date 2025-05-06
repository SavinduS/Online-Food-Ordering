// validate Forms
document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");

    form.addEventListener("submit", function (event) {
        const nic = form.elements["NIC"].value.trim();
        const phone = form.elements["phone_num"].value.trim();
        const password = form.elements["password"].value.trim();
        const confirmPassword = form.elements["password_confirm"].value.trim();
        const name = form.elements["name"].value.trim();

        if (name.split(" ").length < 2) {
            alert("Invalid name. Please enter at least a first name and a last name.");
            event.preventDefault();
            return;
        }

        if (nic.length < 10) {
            alert("Invalid NIC number. Please enter a valid NIC.");
            event.preventDefault();
            return;
        }

        if (!/^\d{10}$/.test(phone)) {
            alert("Invalid phone number. Please enter a valid 10-digit phone number.");
            event.preventDefault();
            return;
        }

        if (password.length < 6) {
            alert("Password must be at least 6 characters long.");
            event.preventDefault();
            return;
        }

        if (password !== confirmPassword) {
            alert("Passwords do not match. Please re-enter.");
            event.preventDefault();
            return;
        }
    });
});



//search item js
function filterTable() {
    const input = document.getElementById("searchInput");
    const filter = input.value.toUpperCase();
    const table = document.querySelector("table");
    const tr = table.getElementsByTagName("tr");

    for (let i = 1; i < tr.length; i++) { // Skip the header row
        const td = tr[i].getElementsByTagName("td");
        let rowMatches = false;

        for (let j = 0; j < td.length; j++) {
            const cell = td[j];

            
            if (cell.querySelector("select")) continue;

            
            const textNodes = Array.from(cell.childNodes)
                .filter(node => node.nodeType === Node.TEXT_NODE)
                .map(node => node.textContent.trim())
                .join(" ");

            if (textNodes.toUpperCase().includes(filter)) {
                rowMatches = true;
                break;
            }
        }

        tr[i].style.display = rowMatches ? "" : "none";
    }
}

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("searchInput").addEventListener("input", filterTable);
});








