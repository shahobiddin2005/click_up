<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 8/8/2024
  Time: 01:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>EASY PAY | Cards</title>
    <link rel="icon" href="views/images/logo.png" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/views/app.css">
    <link rel="stylesheet" href="style.css">
    <style>
        #cards {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .card-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 20px;
            width: 100%;
            max-width: 400px;
        }

        .credit-card {
            width: 100%;
            height: 200px;
            border-radius: 15px;
            background: linear-gradient(135deg, #007bff 0%, #6a11cb 100%);
            color: white;
            padding: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            text-decoration: none;
            transition: transform 0.3s ease-in, box-shadow 0.3s ease-in;;
        }

        .card-chip img {
            width: 50px;
            height: 35px;
            background-color: #d4d4d4;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .card-number {
            font-size: 24px;
            letter-spacing: 3px;
            text-align: center;
        }

        .card-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
        }

        .card-holder,
        .card-expi  ration {
            display: flex;
            flex-direction: column;
        }

        .card-holder label,
        .card-expiration label {
            font-size: 12px;
            color: #ccc;
            margin-bottom: 5px;
        }

        .card-holder div,
        .card-expiration div {
            font-size: 16px;
            font-weight: bold;
        }

        .card-holder div {
            text-transform: uppercase;
        }


        .card-balance {
            display: flex;
            flex-direction: column;
            margin-top: 5px;
        }

        .card-balance label {
            font-size: 12px;
            color: #ccc;
            margin-bottom: 5px;
        }

        .card-balance div {
            font-size: 20px;
            font-weight: bold;
            color: #fff;
        }

        .credit-card p {
            width: 100%;
            text-align: center;
            margin: 0;
            padding: 0;
        }


        .credit-card:hover{
            transform: scale(1.075);
            box-shadow: 0 0 15px rgb(34, 253, 0);
            transition: transform 0.3s ease-in, box-shadow 0.3s ease-in;
        }

        .credit-card h1 {
            margin: 0;
            padding: 0;
            height: 0;
            width: 100%;
            text-align: center;
            font-size: 150px;
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
                <a href="/transfer" class="navbar__links"><i class="fa-solid fa-arrow-right-arrow-left"></i> Transfers</a>
            </li>
            <li  class="navbar__item">
                <a href="/cards" class="navbar__links highlight"><i class="fa-regular fa-credit-card"></i> Cards</a>
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

<div id="cards">
    <div class="card-list">
        <c:forEach var="card" items="${cards}">
            <c:set var="imgUrl" value="" />
            <c:if test="${card.getType().toString() eq \"VISA\"}"><c:set var="imgUrl" value="views/images/visa.png" /></c:if>
            <c:if test="${card.getType().toString() eq \"MASTERCARD\"}"><c:set var="imgUrl" value="views/images/mastercard.png" /></c:if>
            <c:if test="${card.getType().toString() eq \"UZCARD\"}"><c:set var="imgUrl" value="views/images/uzcard.png" /></c:if>
            <c:if test="${card.getType().toString() eq \"HUMO\"}"><c:set var="imgUrl" value="views/images/humo.png" /></c:if>

            <a href="/cards" class="credit-card">
                <div class="card-chip"><img src="${imgUrl}" alt="img"></div>
                <div class="card-number"><c:out value="${card.getNumber()}"/></div>
                <div class="card-details">
                    <div class="card-holder">
                        <label>Card Holder</label>
                        <div><c:out value="${card.getName()}"/> <c:out value="${card.getSurname()}"/></div>
                    </div>
                    <div class="card-expiration">
                        <label>Expires</label>
                        <div><c:out value="${card.getExp()}"/></div>
                    </div>
                </div>
                <div class="card-balance">
                    <label>Balance</label>
                    <div><c:out value="${card.getBalance()}" /></div>
                </div>
            </a>
        </c:forEach>
        <!-- Add more cards here if needed -->
        <a href="/cards/add" class="credit-card">
            <h1>+</h1>
            <p>ADD CARD</p>
        </a>
    </div>
</div>
<script src="app.js" type="text/javascript"></script>
</body>
</html>
