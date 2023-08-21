let email = document.getElementById("myInput5");
let phone = document.getElementById("myInput4");
let password = document.getElementById("myInput8");
let confirmPassword = document.getElementById("myInput9");
let form = document.getElementById("registrationForm")

function validateForm() {
    
    if (!isValidEmail(document.form1.email.value)) {
        alert("Please enter a valid email address.");
        return false;
    }
    
    if (!isValidPhoneNumber(document.form1.Phone.value)) {
        alert("Please enter a valid phone number.");
        return false;
    }

    if (!isPasswordMatch()) {
        alert("Passwords do not match.");
        return false;
    }

    alert("Registration Successful!");
}
function isValidEmail(email) {
    let emailformat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailformat.test(email);
}

function isValidPhoneNumber(phone) {
    var numformat = /^[0-9]{3}[-\s]?[0-9]{3}[-\s]?[0-9]{4}$/;
    return numformat.test(phone);
}

function isPasswordMatch() {
    var password = document.form1.psw.value;
    var confirmPassword = document.form1.confirmPsw.value;
    return password === confirmPassword;
}
let citySelect = document.getElementById("city");
citySelect.addEventListener("focusin", myFocusFunction);
citySelect.addEventListener("focusout", myBlurFunction);

let stateSelect = document.getElementById("state");
stateSelect.addEventListener("focusin", myFocusFunction);
stateSelect.addEventListener("focusout", myBlurFunction);

let dateofbirth = document.getElementById("dob");
dateofbirth.addEventListener("focusin", myFocusFunction);
dateofbirth.addEventListener("focusout", myBlurFunction);

for (let i = 1; i <= 11; i++) {
    let input = document.getElementById("myInput" + i);
    input.addEventListener("focusin", myFocusFunction);
    input.addEventListener("focusout", myBlurFunction);
}

function myFocusFunction() {
    this.style.backgroundColor = "bisque";
}

function myBlurFunction() {
    this.style.backgroundColor = "";
}