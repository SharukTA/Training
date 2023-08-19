let email = document.getElementById("myInput5");
  let phone = document.getElementById("myInput4");
  let password = document.getElementById("myInput8");
  let confirmPassword = document.getElementById("myInput9");
  let form = document.getElementById("registrationForm");


  form.addEventListener("submit", function (event) {
        if (!isValidEmail(email.value)) {
          event.preventDefault();
          alert("Please enter a valid email address.");
        } else if (!isValidnumber(phone.value)) {
          event.preventDefault();
          alert("Please enter a valid phone number.");
        } else if (password.value !== confirmPassword.value) {
          event.preventDefault();
          alert("Passwords do not match. Please re-enter your password.");
        } else {
          alert("Registration Successfull");
        }
    });

    function isValidEmail(email) {
        let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailPattern.test(email);
    }
    function isValidnumber(number){
        const phonePattern = /^[0-9]{3}[-\s]?[0-9]{3}[-\s]?[0-9]{4}$/;
        return phonePattern.test(number);

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