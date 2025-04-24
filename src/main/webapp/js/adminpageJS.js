// validate Forms
document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");

    form.addEventListener("submit", function (event) {
        const nic = form.elements["NIC"].value.trim();
        const phone = form.elements["phone_num"].value.trim();
        const password = form.elements["password"].value.trim();
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
    });
});


//search item js
function filterTable() {
    var input, filter, table, tr, td, i, j, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.querySelector("table");
    tr = table.getElementsByTagName("tr");

    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            if (td[j]) {
                txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                    break;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
}

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("searchInput").addEventListener("input", filterTable);
});


