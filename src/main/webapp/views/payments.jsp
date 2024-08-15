<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 8/8/2024
  Time: 01:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>EASY PAY | Payments</title>
    <link rel="icon" href="views/images/logo.png" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/views/app.css">
    <link rel="stylesheet" href="style.css">

    <style>
        /* Custom scrollbar styles */
        .payments-menu::-webkit-scrollbar {
            width: 6px; /* Set the scrollbar width */
        }

        .payments-menu::-webkit-scrollbar-track {
            background: #2b2b2b; /* Background of the scrollbar track */
        }

        .payments-menu::-webkit-scrollbar-thumb {
            background-color: #555; /* Color of the scrollbar thumb */
            border-radius: 10px; /* Roundness of the scrollbar thumb */
            border: 2px solid #2b2b2b; /* Padding around scrollbar thumb */
        }

        .payments_body {
            color: #e0e0e0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 85vh;
        }

        /* For Firefox */
        .payments-menu {
            scrollbar-width: thin; /* Thin scrollbar */
            scrollbar-color: #555 #2b2b2b; /* Thumb color and track color */
        }

        .payments-menu {
            text-align: center;
            background-color: #2b2b2b;
            border-radius: 10px;
            padding: 20px 40px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-height: 550px; /* Set max height for the card */
            overflow-y: auto; /* Enable vertical scrollbar */
        }

        .payments_body h2 {
            color: #ffffff;
            margin-bottom: 20px;
            text-align: center;
        }

        .payment-method {
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 10px;
            background-color: #3b3b3b;
            border-radius: 5px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .payment-method:hover {
            background-color: #4b4b4b;
        }

        .payment-method img {
            width: 24px;
            margin-right: 10px;
        }

        .payment-method span {
            flex: 1;
            color: #e0e0e0;
        }

        #title_logo {
            width: 50px;
            padding: 10px 0;
        }

        .hidden {
            display: none;
        }


        .card-input {
            position: relative;
            margin-bottom: 20px;
        }

        .card-input label {
            display: block;
            margin-bottom: 10px;
            color: #fff;
            font-weight: bold;
        }

        .card-input input {
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
            <li class="navbar__item">
                <a href="/payment" class="navbar__links highlight"><i class="fa-regular fa-money-bill-1"></i>
                    Payments</a>
            </li>
            <li class="navbar__item">
                <a href="/transfer" class="navbar__links"><i class="fa-solid fa-arrow-right-arrow-left"></i>
                    Transfers</a>
            </li>
            <li class="navbar__item">
                <a href="/cards" class="navbar__links"><i class="fa-regular fa-credit-card"></i> Cards</a>
            </li>
            <li class="navbar__item">
                <a href="/monitoring" class="navbar__links"><i class="fa-solid fa-clock-rotate-left"></i> Monitoring</a>
            </li>
            <li class="navbar__item">
                <a href="/settings" class="navbar__links"><i class="fa-solid fa-gear"></i> Settings</a>
            </li>
        </ul>
    </div>
</nav>

<div class="payments_body">
    <div class="payments-menu">
        <h2>Payments</h2>
        <!-- Repeat the payment-method divs as needed -->
        <div class="payment-method" onclick="mobile()">
            <img src="views/icons/mobile.png" alt="mobile">
            <span>Mobile operators</span>
        </div>
        <div class="payment-method" onclick="utility()">
            <img src="views/icons/utility.png" alt="utility">
            <span>Utility payments</span>
        </div>
        <div class="payment-method" onclick="internet()">
            <img src="views/icons/internet.png" alt="utility">
            <span>Internet Providers</span>
        </div>
        <div class="payment-method" onclick="tv()">
            <img src="views/icons/tv.png" alt="tv">
            <span>TV</span>
        </div>
        <div class="payment-method" onclick="education()">
            <img src="views/icons/education.png" alt="education">
            <span>Education</span>
        </div>
        <div class="payment-method" onclick="parking()">
            <img src="views/icons/bus.png" alt="Transport">
            <span>Transport and Parking</span>
        </div>
    </div>
</div>

<div class="mobile payments_body">
    <div class="payments-menu">
        <h2>Mobile operators</h2>
        <!-- Repeat the payment-method divs as needed -->
        <div class="payment-method" onclick="uzmobile()">
            <img src="https://uztelecom.uz/images/favicon.ico" alt="mobile">
            <span>Uzmobile</span>
        </div>
        <div class="payment-method" onclick="beeline()">
            <img src="https://beeline.uz/img/main/logoYearDark.svg" alt="beeline">
            <span>Beeline</span>
        </div>
        <div class="payment-method" onclick="ucell()">
            <img src="views/icons/ucell.png" alt="utility">
            <span>Ucell</span>
        </div>
        <div class="payment-method" onclick="mobiuz()">
            <img src="https://mobi.uz/local/templates/main_v2/images/mobi-label.svg" alt="tv">
            <span>MobiUz</span>
        </div>
        <div class="payment-method" onclick="oq()">
            <img src="https://api.logobank.uz/media/logos_png/OQ-01.png" alt="education">
            <span>OQ</span>
        </div>
        <div class="payment-method" onclick="humans()">
            <img src="https://api.logobank.uz/media/logos_png/Humans-01.png" alt="Transport">
            <span>Humans</span>
        </div>
        <div class="payment-method" onclick="backPay()">
            <img src="views/icons/back.png" alt="back">
            <span style="text-align: center">Back</span>
        </div>
    </div>
</div>

<div class="utility payments_body">
    <div class="payments-menu">
        <h2>Hali tayyor emas</h2>
        <!-- Repeat the payment-method divs as needed -->
        <div class="payment-method" onclick="backPay()">
            <img src="views/icons/back.png" alt="back">
            <span style="text-align: center">Back</span>
        </div>
    </div>
</div>

<div class="internet payments_body">
    <div class="payments-menu">
        <h2>Hali tayyor emas</h2>
        <!-- Repeat the payment-method divs as needed -->
        <div class="payment-method" onclick="backPay()">
            <img src="views/icons/back.png" alt="back">
            <span style="text-align: center">Back</span>
        </div>
    </div>
</div>

<div class="tv payments_body">
    <div class="payments-menu">
        <h2>Hali tayyor emas</h2>
        <!-- Repeat the payment-method divs as needed -->

        <div class="payment-method" onclick="backPay()">
            <img src="views/icons/back.png" alt="back">
            <span style="text-align: center">Back</span>
        </div>
    </div>
</div>

<div class="education payments_body">
    <div class="payments-menu">
        <h2>Hali tayyor emas</h2>
        <!-- Repeat the payment-method divs as needed -->

        <div class="payment-method" onclick="backPay()">
            <img src="views/icons/back.png" alt="back">
            <span style="text-align: center">Back</span>
        </div>
    </div>
</div>

<div class="transport payments_body">
    <div class="payments-menu">
        <h2>Hali tayyor emas</h2>
        <!-- Repeat the payment-method divs as needed -->

        <div class="payment-method" onclick="backPay()">
            <img src="views/icons/back.png" alt="back">
            <span style="text-align: center">Back</span>
        </div>
    </div>
</div>

<div class="mobile_pay payments_body">
    <form id="card-form" action="/payment" method="post" class="payments-menu">
        <img src="" alt="" id="title_logo">
        <h2 id="mobile_title"></h2>


        <div class="card-input">
            <input type="hidden" name="type" id="req_type">
            <input type="hidden" name="where" value="toMobile">
            <label for="phone">Enter phone number</label>
            <input type="text" id="phone" name="phone" maxlength="19" placeholder="+998 (XX) XXX XX XX"
                   oninput="formatPhoneNumber(this)" required>
        </div>

        <div class="card-input">
            <label for="balance">Enter amount</label>
            <input type="number" id="balance" name="amount" placeholder="123456789" required>
        </div>

        <button type="submit">Next</button>
        <br><br>
        <div class="payment-method" onclick="backMobile()">
            <img src="views/icons/back.png" alt="back">
            <span style="text-align: center">Back</span>
        </div>
    </form>
</div>

<script src="app.js" type="text/javascript"></script>
<script>
    let mobilePay = document.querySelector(".mobile");
    let utilityPay = document.querySelector(".utility");
    let internetPay = document.querySelector(".internet");
    let tvPay = document.querySelector(".tv");
    let educationPay = document.querySelector(".education");
    let transportPay = document.querySelector(".transport");
    let paymentBody = document.querySelector(".payments_body");
    let mobileTitle = document.getElementById("mobile_title")
    let titleLogo = document.getElementById("title_logo")
    let reqType = document.getElementById("req_type")
    let mobilePayInput = document.querySelector(".mobile_pay")

    let phoneNum = document.getElementById('phone');

    // mobile pay menu

    function uzmobile() {
        mobilePayInput.classList.remove("hidden")
        mobilePay.classList.add("hidden")

        mobileTitle.textContent = "UzMobile";
        titleLogo.setAttribute("src", "https://uztelecom.uz/images/favicon.ico")
        reqType.value = "mobilePay";
    }

    function beeline() {
        mobilePayInput.classList.remove("hidden")
        mobilePay.classList.add("hidden")

        mobileTitle.textContent = "Beeline";
        titleLogo.setAttribute("src", "https://beeline.uz/img/main/logoYearDark.svg")
        reqType.value = "mobilePay";
    }

    function ucell() {
        mobilePayInput.classList.remove("hidden")
        mobilePay.classList.add("hidden")

        mobileTitle.textContent = "Ucell";
        titleLogo.setAttribute("src", "views/icons/ucell.png")
        reqType.value = "mobilePay";
    }

    function mobiuz() {
        mobilePayInput.classList.remove("hidden")
        mobilePay.classList.add("hidden")

        mobileTitle.textContent = "MobiUz";
        titleLogo.setAttribute("src", "https://mobi.uz/local/templates/main_v2/images/mobi-label.svg")
        reqType.value = "mobilePay";
    }

    function oq() {
        mobilePayInput.classList.remove("hidden")
        mobilePay.classList.add("hidden")

        mobileTitle.textContent = "OQ";
        titleLogo.setAttribute("src", "https://api.logobank.uz/media/logos_png/OQ-01.png")
        reqType.value = "mobilePay";
    }

    function humans() {
        mobilePayInput.classList.remove("hidden")
        mobilePay.classList.add("hidden")

        mobileTitle.textContent = "Humans";
        titleLogo.setAttribute("src", "https://api.logobank.uz/media/logos_png/Humans-01.png")
        reqType.value = "mobilePay";
    }

    function backMobile(){
        mobilePay.classList.remove("hidden")

        mobilePayInput.classList.add("hidden")
        paymentBody.classList.add("hidden")
        utilityPay.classList.add("hidden")
        internetPay.classList.add("hidden")
        tvPay.classList.add("hidden")
        educationPay.classList.add("hidden")
        transportPay.classList.add("hidden")
    }

    // payments menu
    window.addEventListener("load", () => {
        paymentBody.classList.remove("hidden")

        mobilePay.classList.add("hidden")
        utilityPay.classList.add("hidden")
        internetPay.classList.add("hidden")
        tvPay.classList.add("hidden")
        educationPay.classList.add("hidden")
        transportPay.classList.add("hidden")
        mobilePayInput.classList.add("hidden")
    })

    function mobile() {
        mobilePay.classList.remove("hidden")

        paymentBody.classList.add("hidden")
        utilityPay.classList.add("hidden")
        internetPay.classList.add("hidden")
        tvPay.classList.add("hidden")
        educationPay.classList.add("hidden")
        transportPay.classList.add("hidden")
    }

    function utility() {
        utilityPay.classList.remove("hidden")

        paymentBody.classList.add("hidden")
        mobilePay.classList.add("hidden")
        internetPay.classList.add("hidden")
        tvPay.classList.add("hidden")
        educationPay.classList.add("hidden")
        transportPay.classList.add("hidden")
    }

    function internet() {
        internetPay.classList.remove("hidden")

        paymentBody.classList.add("hidden")
        utilityPay.classList.add("hidden")
        mobilePay.classList.add("hidden")
        tvPay.classList.add("hidden")
        educationPay.classList.add("hidden")
        transportPay.classList.add("hidden")
    }

    function tv() {
        tvPay.classList.remove("hidden")

        paymentBody.classList.add("hidden")
        mobilePay.classList.add("hidden")
        utilityPay.classList.add("hidden")
        internetPay.classList.add("hidden")
        educationPay.classList.add("hidden")
        transportPay.classList.add("hidden")
    }

    function education() {
        educationPay.classList.remove("hidden")

        paymentBody.classList.add("hidden")
        mobilePay.classList.add("hidden")
        utilityPay.classList.add("hidden")
        internetPay.classList.add("hidden")
        tvPay.classList.add("hidden")
        transportPay.classList.add("hidden")
    }

    function parking() {
        transportPay.classList.remove("hidden")

        paymentBody.classList.add("hidden")
        mobilePay.classList.add("hidden")
        utilityPay.classList.add("hidden")
        internetPay.classList.add("hidden")
        tvPay.classList.add("hidden")
        educationPay.classList.add("hidden")
    }

    function backPay() {
        paymentBody.classList.remove("hidden")

        mobilePay.classList.add("hidden")
        utilityPay.classList.add("hidden")
        internetPay.classList.add("hidden")
        tvPay.classList.add("hidden")
        educationPay.classList.add("hidden")
        transportPay.classList.add("hidden")
    }

    document.getElementById('card-form').addEventListener('submit', function (event) {
        // Cancel the form submission
        event.preventDefault();


        if (phoneNum.value.length !== 19) {
            phoneNum.classList.add("input_reject")
            return;
        }

        this.submit();
    });

    phoneNum.addEventListener("focus", function () {
        phoneNum.classList.remove("input_reject")
    })

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
</script>
</body>
</html>
