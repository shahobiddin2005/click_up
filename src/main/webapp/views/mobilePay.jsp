<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 8/8/2024
  Time: 01:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
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

        .card-input select {
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

<div class="mobile_pay payments_body">
    <form id="card-form" action="/payment" method="post" class="payments-menu">
        <h2>Mobile payment</h2>

        <div>
            <p><strong>Phone number:</strong> ${phone}</p>
            <p><strong>Amount:</strong> $${amount}</p>
        </div>
        <br>
        <div class="card-input">
            <label for="sender">Choose your card</label>
            <select class="input" name="sender" id="sender" required>
                <option selected value=""></option>
                <c:forEach var="card" items="${cards}">
                    <option value="${card.getNumber()}">
                            ${card.getNumber().substring(0, 4)} **** ${card.getNumber().substring(12, 16)} | $${Math.round(card.getBalance())}
                    </option>
                </c:forEach>
            </select>
        </div>
        <input type="hidden" name="type" value="mobilePay">
        <input type="hidden" name="phone" value="${phone}">
        <input type="hidden" name="amount" value="${amount}">

        <button type="submit">Click for Pay</button>
    </form>
</div>

<script src="app.js" type="text/javascript"></script>
</body>
</html>
