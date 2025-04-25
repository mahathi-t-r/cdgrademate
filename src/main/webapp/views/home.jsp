<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GradeMate - Effortless Assignment Submissions & Grading</title>
    <style>
        /* CSS Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
            color: #333;
        }
        .navbar a {
            text-decoration: none;
            color: #333;
            margin: 0 15px;
            font-weight: 500;
        }
        .navbar .buttons a {
            padding: 10px 20px;
            border: 2px solid #27ae60;
            color: #27ae60;
            border-radius: 5px;
            transition: 0.3s;
        }
        .navbar .buttons a:first-child {
            background-color: #27ae60;
            color: #fff;
            margin-right: 10px;
        }
        .navbar .buttons a:hover {
            background-color: #27ae60;
            color: #fff;
        }
        .hero-section {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 100px 50px;
            background-color: #f8f8f8;
        }
        .hero-text {
            max-width: 50%;
            padding-right: 50px;
        }
        .hero-text h1 {
            font-size: 3.5em;
            font-weight: bold;
            margin: 0;
            line-height: 1.2;
            color: #333;
        }
        .hero-text h1 span {
            color: #27ae60;
        }
        .hero-text p {
            color: #777;
            font-size: 1.1em;
            margin: 20px 0 30px;
            line-height: 1.6;
        }
        .hero-text .signup-btn {
            background-color: #27ae60;
            color: #fff;
            padding: 12px 30px;
            font-size: 1em;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            transition: 0.3s;
        }
        .hero-text .signup-btn:hover {
            background-color: #1e874b;
        }
        .hero-image {
            max-width: 50%;
            text-align: center;
        }
        .hero-image img {
            max-width: 70%;
            height: auto;
        }
        .clients-section {
            text-align: center;
            padding: 50px 20px;
            background-color: #fff;
        }
        .clients-section h2 {
            font-size: 2em;
            margin: 0;
            color: #333;
        }
        .clients-section p {
            color: #777;
            font-size: 1em;
            margin: 10px 0 30px;
        }
        .clients-logos {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .clients-logos img {
            height: 40px;
            opacity: 0.7;
        }
        .suitable-section {
            text-align: center;
            padding: 50px 20px;
            background-color: #f8f8f8;
        }
        .suitable-section h2 {
            font-size: 2em;
            margin: 0;
            color: #333;
        }
        .suitable-section p {
            color: #777;
            font-size: 1em;
            margin: 10px 0 30px;
        }
        .user-types {
            display: flex;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }
        .user-type {
            background-color: #fff;
            border-radius: 10px;
            padding: 30px 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 250px;
            text-align: center;
        }
        .user-type img {
        width: 100px; /* Set width */
        height: 100px; /* Set height */
        border-radius: 50%;
        }
        .user-type h3 {
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
            margin-top: 20px;
        }
        .user-type p {
            font-size: 0.9em;
            color: #777;
            line-height: 1.5;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">GradeMate</div>
        <div class="nav-links">
            <a href="">Home</a>
            <a href="/about">About Us</a>
            <a href="/feedback">Feedbacks</a>
            <a href="/contact">Contact Us</a>
        </div>
        <div class="buttons">
            <a href="/elogin">Login as educator</a>
            <a href="/slogin">login as student</a>
        </div>
    </div>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-text">
            <h1>Effortless Assignment<br> Submissions & <span>Grading</span></h1>
            <p>An easy way for students to submit work and teachers to grade and give feedback, all in one platform.</p>
            <a href="/signup" class="signup-btn">SIGNUP</a>
        </div>
        <div class="hero-image">
            <img src="images/1-Photoroom.png" alt="Hero Image">
        </div>
    </div>

    <!-- Clients Section -->
    <div class="clients-section">
        <h2>Our Clients</h2>
        <p>We collaborate with top educational institutions to enhance learning and streamline workflows.</p>
        <div class="clients-logos">
            <img src="images/logo1.png" alt="Client Logo 1">
            <img src="images/logo2.png" alt="Client Logo 2">
            <img src="images/logo3.png" alt="Client Logo 3">
            <img src="images/logo4.png" alt="Client Logo 4">
            <img src="images/logo5.png" alt="Client Logo 5">
            
        </div>
    </div>

    <!-- Suitable For Section -->
    <div class="suitable-section">
        <h2>Manage all your assignments and grading in a single platform</h2>
        <p>Who is GradeMate suitable for?</p>
        <div class="user-types">
            <div class="user-type">
                <img src="images/student.jpg" alt="Students Icon">
                <h3>Students</h3>
                <p>Our platform allows students to submit assignments easily, track deadlines, and receive grades and feedback in real-time.</p>
            </div>
            <div class="user-type">
                <img src="images/teacher.jpg" alt="Teachers Icon">
                <h3>Teachers</h3>
                <p>Teachers can upload assignments, grade submissions, and provide feedback efficiently, all in one place.</p>
            </div>
            <div class="user-type">
                <img src="images/uni.jpg" alt="Institutions Icon">
                <h3>Institutions</h3>
                <p>Our system helps institutions streamline assignment management, ensuring transparency and efficiency in both teaching and learning.</p>
            </div>
        </div>
    </div>
</body>
</html>
