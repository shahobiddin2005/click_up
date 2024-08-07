<%--
  Created by IntelliJ IDEA.
  User: Windows 10
  Date: 8/8/2024
  Time: 01:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Responsive Navbar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/views/main.css">
</head>
<body>
<nav>
    <div class="logo">
        <img src="assets/Logo64x64.png" alt="logo" />
        <h1>LOGO</h1>
    </div>
    <ul>
        <li>
            <a href="/home"><i class="fa-solid fa-house"></i> Home</a>
        </li>
        <li>
            <a href="/payment"><i class="fa-regular fa-money-bill-1"></i> Payments</a>
        </li>
        <li>
            <a href="/transfer"><i class="fa-solid fa-arrow-right-arrow-left"></i> Transfers</a>
        </li>
        <li>
            <a href="/cards"><i class="fa-regular fa-credit-card"></i> Cards</a>
        </li>
        <li>
            <a href="/monitoring" class="active_view"><i class="fa-solid fa-clock-rotate-left"></i> Monitoring</a>
        </li>
        <li>
            <a href="/settings"><i class="fa-solid fa-gear"></i> Settings</a>
        </li>
    </ul>
        <div class="hamburger">
            <span class="line"></span>
            <span class="line"></span>
            <span class="line"></span>
        </div>
</nav>
<div class="menubar">
    <ul>
        <li>
            <a href="/home"><i class="fa-solid fa-house"></i> Home</a>
        </li>
        <li>
            <a href="/payment"><i class="fa-regular fa-money-bill-1"></i> Payments</a>
        </li>
        <li>
            <a href="/transfer"><i class="fa-solid fa-arrow-right-arrow-left"></i> Transfers</a>
        </li>
        <li>
            <a href="/cards"><i class="fa-regular fa-credit-card"></i> Cards</a>
        </li>
        <li>
            <a href="/monitoring" class="active_view"><i class="fa-solid fa-clock-rotate-left"></i> Monitoring</a>
        </li>
        <li>
            <a href="/settings"><i class="fa-solid fa-gear"></i> Settings</a>
        </li>
    </ul>
</div>

<script>
    const mobileNav = document.querySelector(".hamburger");
    const navbar = document.querySelector(".menubar");

    const toggleNav = () => {
        navbar.classList.toggle("active");
        mobileNav.classList.toggle("hamburger-active");
    };
    mobileNav.addEventListener("click", () => toggleNav());
</script>
</body>
</html>
