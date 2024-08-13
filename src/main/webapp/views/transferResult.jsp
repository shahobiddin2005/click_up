<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 8/13/2024
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .result_transfer {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 85vh;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            padding: 20px;
        }

        .card {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        p {
            margin: 10px 0;
            color: #777;
        }

        .details p {
            text-align: left;
            color: #555;
        }

        .home-button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
        }

        .home-button:hover {
            background-color: #45a049;
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
                <a href="/payment" class="navbar__links"><i class="fa-regular fa-money-bill-1"></i> Payments</a>
            </li>
            <li class="navbar__item">
                <a href="/transfer" class="navbar__links highlight"><i class="fa-solid fa-arrow-right-arrow-left"></i>
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

<div class="result_transfer">
    <div class="container">
        <div class="card">
            <h1><i style="font-size: 60px; margin-bottom: 30px" class="fa-regular fa-circle-check"></i> <br>Transfer Successful!</h1>
            <p>Your transfer has been completed successfully.</p>
            <div class="details">
                <p><strong>Amount:</strong> $${transaction.getAmount()}</p>
                <p><strong>Sender:</strong> ${sender.getName()} ${sender.getSurname()}</p>
                <p><strong>Payment card:</strong> ${sender.getNumber().substring(0,6)}******${sender.getNumber().substring(12,16)}</p>
                <p><strong>Recipient:</strong> ${receiver.getName()} ${receiver.getSurname()}</p>
                <p><strong>Recipient's card:</strong> ${receiver.getNumber().substring(0,6)}******${receiver.getNumber().substring(12,16)}</p>
                <p><strong>Date:</strong> ${transaction.getDate().toLocalDateTime().getMonth()} ${transaction.getDate().toLocalDateTime().getDayOfMonth()}, ${transaction.getDate().toLocalDateTime().getYear()}</p>
                <p><strong>Time:</strong> ${transaction.getDate().toLocalDateTime().getHour()}:${transaction.getDate().toLocalDateTime().getMinute()}:${transaction.getDate().toLocalDateTime().getSecond()}</p>
                <p><strong>Description:</strong> ${transaction.getDescription()}</p>
            </div>
            <button class="home-button" onclick="goHome()">Go Home</button>
        </div>
    </div>
</div>

<script>
    function goHome() {
        window.location.href = '/home';  // Replace with your home page URL
    }
</script>


<script src="app.js" type="text/javascript"></script>
</body>
</html>
