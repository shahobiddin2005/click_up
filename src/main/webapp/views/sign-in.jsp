<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 8/8/2024
  Time: 00:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>EASY PAY | Sign In</title>
    <link rel="icon" href="views/images/logo.png" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/views/app.css">
    <link rel="stylesheet" href="/style.css">
    <style>


        @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");

        .form_body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 85vh;
            width: 100%;
            padding: 0 10px;
        }

        .wrapper {
            width: 400px;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #fff;
        }

        .input-field {
            position: relative;
            border-bottom: 2px solid #ccc;
            margin: 15px 0;
        }

        .input-field label {
            position: absolute;
            top: 50%;
            left: 0;
            transform: translateY(-50%);
            color: #fff;
            font-size: 16px;
            pointer-events: none;
            transition: 0.15s ease;
        }

        .input-field input {
            width: 100%;
            height: 40px;
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            color: #fff;
        }

        .input-field input:focus ~ label,
        .input-field input:valid ~ label {
            font-size: 0.8rem;
            top: 10px;
            transform: translateY(-120%);
        }

        .forget {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 25px 0 35px 0;
            color: #fff;
        }

        #remember {
            accent-color: #fff;
        }

        .forget label {
            display: flex;
            align-items: center;
        }

        .forget label p {
            margin-left: 8px;
        }

        .wrapper a {
            color: #efefef;
            text-decoration: none;
        }

        .wrapper a:hover {
            text-decoration: underline;
        }

        button {
            background: #fff;
            color: #000;
            font-weight: 600;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 3px;
            font-size: 16px;
            border: 2px solid transparent;
            transition: 0.3s ease;
        }

        button:hover {
            color: #fff;
            border-color: #fff;
            background: rgba(255, 255, 255, 0.15);
        }

        .register {
            text-align: center;
            margin-top: 30px;
            color: #fff;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #999;
        }
    </style>
</head>
<body>
<nav class="navbar">
    <div class="navbar__container">
        <a href="/auth" id="navbar__logo"> <img src="/views/images/logo.png" alt=""/>EASY PAY</a>
    </div>
</nav>

<div class="form_body">
    <div class="wrapper sign_in">
        <form action="/auth/sign-in" class="sign-up-form" method="post">
            <h2>Sign In</h2>
            <c:if test="${notFound}">
                <div>
                    <p style="color:red;">${message}</p>
                </div>
            </c:if>
            <div class="input-field">
                <input type="text" class="phone" name="phone" oninput="formatPhoneNumber(this)" required>
                <label>Enter your phone</label>
            </div>
            <div class="input-field">
                <input type="password" id="password" minlength="5" name="password" required>
                <label>Enter your password</label>
                <i style="color: #fff" class="fas fa-eye toggle-password btn-1"></i>
            </div>
            <div class="forget">
                <a href="#">Forgot password?</a>
            </div>
            <button type="submit">Sign In</button>
            <div class="register">
                <p>Don't have an account? <a href="/auth/sign-up">Sign Up</a></p>
            </div>
        </form>
    </div>
</div>

<script src="app.js" type="text/javascript"></script>
<script>

    document.querySelector('.sign-up-form').addEventListener('submit', function (event) {
        // Cancel the form submission
        event.preventDefault();

        //
        // if (phoneNum.value.length !== 19) {
        //     alert("Phone number incorrect")
        //     return;
        // }
        //
        // const input = document.getElementById("password1");
        // const input1 = document.getElementById("password2");
        //
        // if (input !== input1) {
        //     alert("Passwords do not match")
        //     return;
        // }

        this.submit();
    });

    function formatPhoneNumber(input) {
        const value = input.value.replace(/\D/g, ''); // Remove all non-digit characters
        let formattedNumber = '';

        if (value.length > 3) {
            formattedNumber += "+998" + ' ';
        } else {
            formattedNumber += "+998";
        }
        if (value.length > 5) {
            formattedNumber += '(' + value.substring(3, 5) + ') ';
        } else if (value.length > 3) {
            formattedNumber += '(' + value.substring(3, 5);
        }
        if (value.length > 8) {
            formattedNumber += value.substring(5, 8) + ' ';
        } else if (value.length > 5) {
            formattedNumber += value.substring(5, 8);
        }
        if (value.length > 10) {
            formattedNumber += value.substring(8, 10) + ' ';
        } else if (value.length > 8) {
            formattedNumber += value.substring(8, 10);
        }
        if (value.length > 12) {
            formattedNumber += value.substring(10, 12);
        } else if (value.length > 10) {
            formattedNumber += value.substring(10, 12);
        }

        input.value = formattedNumber;
    }

    const togglePassword1 = document.querySelectorAll('.btn-1');
    const togglePassword2 = document.querySelectorAll('.btn-2');

    togglePassword1.forEach(btn => {
        btn.addEventListener('click', function () {
            const input = document.getElementById("password");
            const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
            input.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    });

    togglePassword2.forEach(btn => {
        btn.addEventListener('click', function () {
            const input = document.getElementById("password1");
            const input1 = document.getElementById("password2");
            const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
            input.setAttribute('type', type);
            input1.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    });
</script>
</body>
</html>
