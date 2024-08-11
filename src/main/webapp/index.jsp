<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EASY PAY</title>
    <link rel="icon" href="views/images/logo.png" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="style.css">
</head>

<body>
<!-- Navbar Section -->
<nav class="navbar">
    <div class="navbar__container">
        <a href="#home" id="navbar__logo"> <img src="views/images/logo.png" alt=""/>EASY PAY</a>
        <div class="navbar__toggle" id="mobile-menu">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
        <ul class="navbar__menu">
            <li class="navbar__item">
                <a href="#home" class="navbar__links" id="home-page">Home</a>
            </li>
            <li class="navbar__item">
                <a href="#about" class="navbar__links" id="about-page">About</a>
            </li>
            <li class="navbar__item">
                <a href="#services" class="navbar__links" id="services-page">Services</a>
            </li>
            <li class="navbar__btn">
                <a href="/auth" class="button" id="signup">Register</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Hero Section -->

<div class="hero" id="home">
    <div class="hero__container">
        <h1 class="hero__heading">Choose your <span>service</span></h1>
        <p class="hero__description">Unlimited Possibilities</p>
        <button class="main__btn"><a href="#">Explore</a></button>
    </div>
</div>

<!-- About Section -->

<div class="main" id="about">
    <div class="main__container">
        <div class="main__img--container">
            <div class="main__img--card"><i class="fas fa-layer-group"></i></div>
        </div>
        <div class="main__content">
            <h1>What do we do?</h1>
            <h2>We help businesses scale</h2>
            <p>Schedule a call to lern more about our services</p>
            <button class="main__btn"><a href="/">Scheduel Call</a></button>
        </div>
    </div>
</div>

<!-- Services Section -->
<div class="services" id="services">
    <h1>Our Services</h1>
    <div class="services__wrapper">
        <div class="services__card">
            <h2>Custom Payments</h2>
            <p>AI Powered Technology</p>
            <div class="services__btn">
                <button>Get Started</button>
            </div>
        </div>
        <div class="services__card">
            <h2>Are you ready</h2>
            <p>Take the lepa</p>
            <div class="services__btn">
                <button>Get Started</button>
            </div>
        </div>
        <div class="services__card">
            <h2>Full Gradient</h2>
            <p>100 Combination</p>
            <div class="services__btn">
                <button>Get Started</button>
            </div>
        </div>
        <div class="services__card">
            <h2>Infinite Choices</h2>
            <p>1000's of service</p>
            <div class="services__btn">
                <button>Get Started</button>
            </div>
        </div>
    </div>
</div>

<!-- Feature Section -->
<div class="main" id="sign-up">
    <div class="main__container">
        <div class="main__content">
            <h1>Join Our Team</h1>
            <h2>Register Today</h2>
            <p>See what makes us different</p>
            <button class="main__btn"><a href="/auth">Register</a></button>
        </div>
        <div class="main__img--container">
            <div class="main__img--card" id="card-2"><i class="fas fa-users"></i></div>
        </div>
    </div>
</div>

<!-- Footer Section -->
<div class="footer__container">
    <div class="footer__links">
        <div class="footer__link--wrapper">
            <div class="footer__link--items">
                <h2>About Us</h2>
                <a href="/sign__up">How it works</a>
                <a href="/">Testimonials</a>
                <a href="/">Careers</a>
                <a href="/">Terms of Services</a>
            </div>
            <div class="footer__link--items">
                <h2>Contact Us</h2>
                <a href="/">Contact</a>
                <a href="/">Support</a>
                <a href="/">Destination</a>
            </div>
        </div>
        <div class="footer__link--wrapper">
            <div class="footer__link--items">
                <h2>Videos</h2>
                <a href="/">Submit Video</a>
                <a href="/">Ambassadors</a>
                <a href="/">Aegncy</a>
            </div>
            <div class="footer__link--items">
                <h2>Social Media</h2>
                <a href="/">Instagram</a>
                <a href="/">Youyube</a>
                <a href="/">Linkedin</a>
                <a href="/">Telegram</a>
            </div>
        </div>
    </div>
    <section class="social__media">
        <div class="social__media--wrap">
            <div class="footer__logo">
                <a href="/" id="footer__logo">EASY PAY</a>
            </div>
            <p class="website__rights">&copy; EASY PAY 2024. All rigth reserved</p>
            <div class="social__icon">
                <a href="https://instagram.com/shahobiddin__off" class="social__icon--link" target="_blank">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="https://www.youtube.com/@ShaxobiddinUralov-sn7ns" class="social__icon--link" target="_blank">
                    <i class="fab fa-youtube"></i>
                </a>
                <a href="https://www.linkedin.com/in/shaxobiddin-uralov-a0294628b/" class="social__icon--link"
                   target="_blank">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="https://t.me/Mr_shahobiddin" class="social__icon--link" target="_blank">
                    <i class="fab fa-telegram"></i>
                </a>
            </div>
        </div>
    </section>
</div>

<script src="app.js" type="text/javascript"></script>
</body>

</html>