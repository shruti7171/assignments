// LOGIN VALIDATION
function loginValidation() {
    let email = document.getElementById("loginEmail").value;
    let password = document.getElementById("loginPassword").value;

    let emailError = document.getElementById("loginEmailError");
    let passwordError = document.getElementById("loginPasswordError");

    emailError.innerHTML = "";
    passwordError.innerHTML = "";

    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email === "" && password === "") {
        emailError.innerHTML = "Email is required";
        passwordError.innerHTML = "Password is required";
        return false;
    }

    if (!emailPattern.test(email)) {
        emailError.innerHTML = "Invalid email format";
        return false;
    }

    if (password === "") {
        passwordError.innerHTML = "Password is required";
        return false;
    }

    if (password.length < 6) {
        passwordError.innerHTML = "Password must be at least 6 characters";
        return false;
    }

    alert("Login Successful");
    return true;
}


// REGISTER VALIDATION
function registerValidation() {
    let name = document.getElementById("name").value;
    let email = document.getElementById("email").value;
    let phone = document.getElementById("phone").value;
    let password = document.getElementById("password").value;

    let nameError = document.getElementById("nameError");
    let emailError = document.getElementById("emailError");
    let phoneError = document.getElementById("phoneError");
    let passwordError = document.getElementById("passwordError");

    nameError.innerHTML = "";
    emailError.innerHTML = "";
    phoneError.innerHTML = "";
    passwordError.innerHTML = "";

    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    let phonePattern = /^[0-9]{10}$/;

    if (name === "" && email === "" && phone === "" && password === "") {
        nameError.innerHTML = "All fields are required";
        return false;
    }

    if (!emailPattern.test(email)) {
        emailError.innerHTML = "Invalid email format";
        return false;
    }

    if (!phonePattern.test(phone)) {
        phoneError.innerHTML = "Phone number must be 10 digits";
        return false;
    }

    if (password.length < 6) {
        passwordError.innerHTML = "Password must be at least 6 characters";
        return false;
    }

    alert("Registration Successful");
    return true;
}
