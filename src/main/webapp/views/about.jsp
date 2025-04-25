<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Discover GradeMate - your partner in streamlining assignment submissions and grading. Meet our dedicated team and learn our core values.">
    <title>About Us - GradeMate</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'Poppins', sans-serif;
            color: #333;
            background-color: #f8f8f8;
            line-height: 1.6;
            overflow-x: hidden;
        }
        h1, h2, h3 {
            font-family: 'Poppins', sans-serif;
            color: #465a65;
            margin-top: 0;
        }

        /* Navbar */
        nav {
            background-color: #4baf4f;
            color: #fff;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
        }
        nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 1rem;
            font-size: 1rem;
            font-weight: bold;
            transition: color 0.3s;
        }
        nav a:hover {
            color: #b3e3d3;
        }

        /* Header */
        header {
            text-align: center;
            padding: 3rem 1rem;
            background: linear-gradient(to bottom, #4baf4f, #f8f8f8);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        header h1 {
            font-size: 2.8rem;
        }
        header p {
            font-size: 1.1rem;
            color: #666;
            max-width: 650px;
            margin: 0.5rem auto;
        }

        /* Sections */
        section {
            padding: 2.5rem 1.5rem;
            margin: 0 auto;
            max-width: 900px;
            text-align: center;
        }
        section h2 {
            font-size: 2.2rem;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
            padding-bottom: 5px;
            border-bottom: 2px solid #465a65;
        }

        /* Our Story Section */
        .our-story {
            margin-bottom: 3rem;
        }
        .our-story img {
            width: 100%;
            max-width: 500px;
            display: block;
            margin: 1.5rem auto;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .our-story img:hover {
            transform: scale(1.02);
        }

        /* Values Section */
        .values-container {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
            padding-top: 1rem;
        }
        .value-card {
            flex: 1;
            min-width: 220px;
            max-width: 250px;
            background: #fff;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, background-color 0.3s;
        }
        .value-card:hover {
            transform: translateY(-5px);
            background-color: #eafaf1;
        }
        .value-card h3 {
            font-size: 1.3rem;
            margin-top: 0.5rem;
            color: #333;
        }
        .value-card p {
            font-size: 0.95rem;
            color: #666;
            padding-top: 0.5rem;
        }

        /* Team Section */
        .team-container {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
            padding-top: 1rem;
        }
        .team-member {
            text-align: center;
            max-width: 150px;
            padding: 1rem;
            transition: transform 0.3s ease;
        }
        .team-member:hover {
            transform: scale(1.1);
        }
        .team-member img {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            border: 3px solid #ddd;
            transition: border-color 0.3s ease;
        }
        .team-member:hover img {
            border-color: #4baf4f;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            header h1 {
                font-size: 2.2rem;
            }
            .values-container, .team-container {
                flex-direction: column;
                gap: 1.5rem;
            }
            .team-member img {
                width: 80px;
                height: 80px;
            }
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <div><a href="/">GradeMate</a></div>
        <div>
            <a href="/about">About Us</a>
            <a href="/contact">Contact</a>
            <a href="/slogin">Student Login</a>
            <a href="/elogin">Educator Login</a>
        </div>
    </nav>

    <!-- About Us Page Header Section -->
    <header>
        <h1>Our Mission and Vision</h1>
        <p>Empowering Education Through Technology</p>
        <p>At GradeMate, we aim to make assignment submission and grading effortless for students and educators alike.</p>
    </header>

    <!-- Our Story Section -->
    <section class="our-story">
        <h2>Who We Are</h2>
        <p>Founded on the vision to streamline the educational experience, GradeMate seeks to create a seamless platform for assignment management, benefiting everyone involved in the learning process.</p>
        <img src="images/teamwork.jpg" alt="Team collaboration illustration">
    </section>

    <!-- Our Values Section -->
    <section class="our-values">
        <h2>Our Values</h2>
        <div class="values-container">
            <div class="value-card">
                <h3>Efficiency</h3>
                <p>We strive to save time by offering organized workflows that enhance productivity for students and educators.</p>
            </div>
            <div class="value-card">
                <h3>Collaboration</h3>
                <p>We believe in fostering connections that encourage an enriching educational journey.</p>
            </div>
            <div class="value-card">
                <h3>Transparency</h3>
                <p>Building trust through consistent and fair grading, coupled with clear feedback.</p>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="our-team">
        <h2>Meet Our Team</h2>
        <div class="team-container">
            <div class="team-member">
                <h3>T R Mahathi</h3>
            </div>
            <div class="team-member">
                <h3>Sushma</h3>
            </div>
            <div class="team-member">
                <h3>Prasunna</h3>
            </div>
        </div>
    </section>

</body>
</html>
