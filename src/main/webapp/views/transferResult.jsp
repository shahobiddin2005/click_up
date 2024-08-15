<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 8/13/2024
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>EASY PAY | Result</title>
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
            height: 90vh;
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

<div class="result_transfer">
    <div class="container">
        <div class="card">
            <c:if test="${transaction.getStatus().toString() eq \"COMPLETED\"}">
                <h1><i style="font-size: 60px; margin-bottom: 30px" class="fa-regular fa-circle-check"></i> <br>Successful!
                </h1>
                <p>Your payment has been completed successfully.</p>
            </c:if>
            <c:if test="${transaction.getStatus().toString() eq \"FAILED\"}">
                <h1 style="color: red"><i style="font-size: 60px; margin-bottom: 30px"
                                          class="fa-regular fa-circle-xmark"></i> <br>Failed!
                </h1>
                <p>Your payment has been completed failed.</p>
            </c:if>
            <div class="details">
                <p><strong>Type:</strong> ${transaction.getType().toString()}</p>
                <p><strong>Amount:</strong> $${transaction.getAmount()}</p>
                <p><strong>Sender name:</strong> ${sender.getName()} ${sender.getSurname()}</p>
                <p><strong>Payment
                    card:</strong> ${sender.getNumber().substring(0,6)}******${sender.getNumber().substring(12,16)}</p>
                <c:if test="${transaction.getType().toString() eq \"TRANSFER\"}">
                    <p><strong>Recipient name:</strong> ${receiver.getName()} ${receiver.getSurname()}</p>
                    <p><strong>Recipient
                        card:</strong> ${receiver.getNumber().substring(0,6)}******${receiver.getNumber().substring(12,16)}
                    </p>
                </c:if>
                <c:if test="${not transaction.getType().toString() eq \"TRANSFER\"}">
                    <p><strong>Phone number:</strong> ${transaction.getReceiver()}
                    </p>
                </c:if>
                <p>
                    <strong>Date:</strong> ${transaction.getDate().toLocalDateTime().getMonth()} ${transaction.getDate().toLocalDateTime().getDayOfMonth()}, ${transaction.getDate().toLocalDateTime().getYear()}
                </p>
                <p>
                    <strong>Time:</strong> ${transaction.getDate().toLocalDateTime().getHour()}:${transaction.getDate().toLocalDateTime().getMinute()}:${transaction.getDate().toLocalDateTime().getSecond()}
                </p>
                <c:if test="${not transaction.getDescription() eq \"\"}">
                    <p><strong>Description:</strong> ${transaction.getDescription()}</p>
                </c:if>
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


</body>
</html>
