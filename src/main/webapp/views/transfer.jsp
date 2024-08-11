<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 8/8/2024
  Time: 01:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>EASY PAY | Transfer</title>
    <link rel="icon" href="views/images/logo.png" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/views/app.css">
    <link rel="stylesheet" href="style.css">

    <style>
        .card-container {
            width: 410px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .card-input {
            position: relative;
            margin-bottom: 20px;
        }

        .card-input label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
        }

        .card-input #cardNumber {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            text-align: center;
            letter-spacing: 2px;
            text-combine: none;
        }

        <c:if test="${isCardNotFoun}">
        .card-input input {
            border-color: red;
            outline: none;
            box-shadow: 0 0 5px rgba(255, 10, 10, 0.8);
        }
        </c:if>

        .card-input input:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .card-input .input_reject {
            border-color: red;
            outline: none;
            box-shadow: 0 0 5px rgba(255, 10, 10, 0.8);
        }

        #card-icon {
            position: absolute;
            top: 50%;
            right: 5px;
            transform: translatex(5%);
            width: 50px;
            height: 35px;
            background-size: contain;
            background-repeat: no-repeat;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
<nav class="navbar">
    <div class="navbar__container">
        <a href="/home" id="navbar__logo"> <img src="views/images/logo.png" alt=""/>EASY PAY</a>
        <div class="navbar__toggle" id="mobile-menu">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
        <ul class="navbar__menu">
            <li class="navbar__item">
                <a href="/home" class="navbar__links"><i class="fa-solid fa-house"></i> Home</a>
            </li>
            <li  class="navbar__item">
                <a href="/payment" class="navbar__links"><i class="fa-regular fa-money-bill-1"></i> Payments</a>
            </li>
            <li  class="navbar__item">
                <a href="/transfer" class="navbar__links highlight"><i class="fa-solid fa-arrow-right-arrow-left"></i> Transfers</a>
            </li>
            <li  class="navbar__item">
                <a href="/cards" class="navbar__links"><i class="fa-regular fa-credit-card"></i> Cards</a>
            </li>
            <li  class="navbar__item">
                <a href="/monitoring" class="navbar__links"><i class="fa-solid fa-clock-rotate-left"></i> Monitoring</a>
            </li>
            <li  class="navbar__item">
                <a href="/settings" class="navbar__links"><i class="fa-solid fa-gear"></i> Settings</a>
            </li>
        </ul>
    </div>
</nav>


<div class="card-container">
    <form id="card-form" action="/transfer" method="post">
        <div class="card-input">
            <label for="cardNumber">Card Number</label>
            <input type="text" id="cardNumber" maxlength="19" placeholder="XXXX XXXX XXXX XXXX" required>
            <div id="card-icon"></div>
        </div>
        <p id="input_reject_text" style="color: red; transform: translateY(-70%); padding: 0; margin: 0;"></p>
        <button type="submit" id="transfer_button">Transfer</button>
    </form>
</div>


<script>
        // ========================================================================
    const cardNumberInput = document.getElementById('cardNumber');
    const cardIcon = document.getElementById('card-icon');
    let inputReject = document.getElementById('input_reject_text');

    cardNumberInput.addEventListener('input', formatCardNumber);

    cardNumberInput.addEventListener("focus", function () {
        inputReject.textContent = ""
        cardNumberInput.classList.remove("input_reject")
    })

    function formatCardNumber(event) {
        let input = event.target.value.replace(/\D/g, '').substring(0, 16); // Limit to 16 digits and remove non-digits
        input = input.match(/.{1,4}/g)?.join(' ') || ''; // Add space every 4 digits

        event.target.value = input;

        updateCardIcon(input);
    }

    function updateCardIcon(number) {
        let icon = '';
        const firstDigit = number.charAt(0);
        const first4Digit = number.substring(0, 4);

        if (firstDigit === '4') {
            icon = 'views/images/visa.png'; // Path to Visa logo
        } else if (firstDigit === '5') {
            icon = 'views/images/mastercard.png'; // Path to Mastercard logo
        } else if (first4Digit === '8600' || first4Digit === '5614') {
            icon = 'views/images/uzcard.png'; // Path to Mastercard logo
        } else if (first4Digit === '9860') {
            icon = 'views/images/humo.png'; // Path to Mastercard logo
        } else {
            icon = ''; // Default or empty if not recognized
        }

        cardIcon.style.backgroundImage = "url(" + icon + ")";
    }

    document.getElementById('card-form').addEventListener('submit', function (event) {
        // Cancel the form submission
        event.preventDefault();

        let cardNumber = document.getElementById('cardNumber');

        if (cardNumber.value.length !== 19) {
            inputReject.textContent = "Card number must be 16 digits long!"
            cardNumber.classList.add("input_reject")
            return;
        }

        cardNumber = cardNumber.toString().replaceAll(" ", "");
        this.submit();
    });

</script>

<script src="app.js" type="text/javascript"></script>
</body>
</html>
