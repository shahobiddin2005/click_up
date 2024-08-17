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
    <title>EASY PAY | Home</title>
    <link rel="icon" href="views/images/logo.png" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/views/app.css">
    <link rel="stylesheet" href="style.css">
    <style>


        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }


        header h1 {
            margin: 0;
            font-size: 24px;
        }

        .balance {
            background-color: #333;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
        }

        .balance h2 {
            color: #fff;
            margin: 0;
            font-size: 36px;
        }

        .balance p {
            color: #fff;
            font-size: 18px;
        }

        .transactions {
            background-color: #282828;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .transaction:hover {
            background-color: #444;
        }

        .transactions h2, .settings h2 {
            color: #fff;
            font-size: 22px;
            margin-bottom: 20px;
        }

        .transaction {
            text-decoration: none;
            color: #999;
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #444;
        }

        .transaction:last-child {
            border-bottom: none;
        }

        .transaction p {
            margin: 0 30px;
            font-size: 16px;
        }

        .settings label {
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .settings input, .settings select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #555;
            background-color: #333;
            color: #f0f0f0;
            font-size: 16px;
        }

        .settings button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #6200ea;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .settings button:hover {
            background-color: #3700b3;
        }

        button {
            width: 150px;
            margin-top: 30px;
            padding: 12px;
            border: none;
            background-color: #222;
            color: white;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #555;
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
                <a href="/home" class="navbar__links highlight"><i class="fa-solid fa-house"></i> Home</a>
            </li>
            <li class="navbar__item">
                <a href="/payment" class="navbar__links"><i class="fa-regular fa-money-bill-1"></i> Payments</a>
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

<div class="container">
    <div class="balance">
        <h2>Welcome</h2>
        <h3 style="color: #999">${user.getName()} ${user.getSurname()}</h3>
        <form action="/auth" method="post">
            <input type="hidden" name="logOut" value="logOut">
            <button type="submit">Log Out</button>
        </form>
    </div>
    <div class="balance">
        <h2>Account Balance: $${totalBalance}</h2>
        <p>Last updated: ${serverTime.getMonth()} ${serverTime.getDayOfMonth()}, ${serverTime.getYear()}
            at ${serverTime.getHour()}:${serverTime.getMinute()}:${serverTime.getSecond()}</p>
    </div>

    <c:if test="${not transactions.isEmpty()}">
        <div href="/monitoring" class="transactions">
            <h2>Recent Transactions</h2>
            <a href="/monitoring" class="transaction">
                <p>${transactions.get(0).getType().toString()}</p>
                <p>${transactions.get(0).getAmount()}</p>
            </a>
            <c:if test="${transactions.size() >= 2}">
                <a href="/monitoring" class="transaction">
                    <p>${transactions.get(1).getType().toString()}</p>
                    <p>${transactions.get(1).getAmount()}</p>
                </a>
            </c:if>
            <c:if test="${transactions.size() >= 3}">
                <a href="/monitoring" class="transaction">
                    <p>${transactions.get(2).getType().toString()}</p>
                    <p>${transactions.get(2).getAmount()}</p>
                </a>
            </c:if>
            <c:if test="${transactions.size() >= 4}">
                <a href="/monitoring" class="transaction">
                    <p>${transactions.get(3).getType().toString()}</p>
                    <p>${transactions.get(3).getAmount()}</p>
                </a>
            </c:if>
        </div>
    </c:if>
</div>

<script src="app.js" type="text/javascript"></script>
</body>
</html>
