let email = document.getElementById("myInput5");
const emailerror = document.getElementById("email-error");
const emailpattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
let phone = document.getElementById("myInput4");
const phoneerror = document.getElementById("phone-error");
let password = document.getElementById("myInput8");
const passworderror = document.getElementById("password-error");
let confirmPassword = document.getElementById("myInput9");
const cpswerror = document.getElementById("cpassword-error");
let form = document.getElementById("form1")

email.addEventListener("focusout",function()
{
    if(!emailpattern.test(email.value)){
        emailerror.style.display="block";
        email.style.borderColor="red";
    }
    else{
        emailerror.style.display="none";
        email.style.borderColor="";
    }
});

phone.addEventListener("focusout",function()
{
    if(phone.value.length!=10){
        phoneerror.style.display="block";
        phone.style.borderColor="red";
    }
    else{
        phoneerror.style.display="none";
        phone.style.borderColor="";
    }
});

function calculateAge(dateOfBirth) {
    const today = new Date();
    const dob = new Date(dateOfBirth);
    let age = today.getFullYear() - dob.getFullYear();
    const monthDiff = today.getMonth() - dob.getMonth();

    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
        age--;
    }

    return age;
}


const dobInput = document.getElementById("dob");
const ageInput = document.getElementById("myInput3");

dobInput.addEventListener("change", function() {
    const age = calculateAge(this.value);
    ageInput.value = age;
});


const initialAge = calculateAge(dobInput.value);
ageInput.value = initialAge;


password.addEventListener("focusout",function()
{
    if(password.value.length<8){
        passworderror.style.display="block";
        password.style.borderColor="red";
    }
    else{
        passworderror.style.display="none";
        password.style.borderColor="";
    }
});

confirmPassword.addEventListener("focusout",function()
{
    if(confirmPassword.value === password.value){
        cpswerror.style.display="none";
        confirmPassword.style.borderColor="";
    }
    else{
        cpswerror.style.display="block";
        confirmPassword.style.borderColor="red";
    }
});

const citiesByState = {
    Kerala: ["Kochi", "Thrissur","Trivandrum", "Malappuram"],
    TamilNadu: ["Chennai", "Salem","Erode", "Coimbatore"],
    Karnataka: ["Bangalore", "Belur", "Whitefield", "Electronic city","100 feet"]
};

function populateCities() {
    const stateDropdown = document.getElementById("state");
    const cityDropdown = document.getElementById("city");

    const selectedState = stateDropdown.value;
    const cities = citiesByState[selectedState];

    cityDropdown.innerHTML = "";
    for (const city of cities) {
        const option = document.createElement("option");
        option.text = city;
        cityDropdown.add(option);
    }
}

populateCities();

form.addEventListener("submit", function(event) {
    if (
        email.style.borderColor === "red" ||
        phone.style.borderColor === "red" ||
        confirmPassword.style.borderColor === "red" ||
        password.style.borderColor === "red"
    ) {
        alert("Please fix the validation errors before submitting the form.");
        event.preventDefault();
    }
    else{
        alert("registration successfull");
        

    }
});

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

