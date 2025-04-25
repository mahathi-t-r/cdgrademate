<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f3f3f3;
            margin: 0;
        }

        .navbar {
            background-color: #2e8b57;
            padding: 15px;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
            font-size: 16px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .main-container {
            padding: 50px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
        }

        .card h2 {
            font-size: 20px;
            color: #2e8b57;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 14px;
            color: #555;
        }

        .card .rating {
            font-size: 16px;
            color: #f90;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">GradeMate</div>
        <div>
            <a href="/">Home</a>
            <a href="/about">About Us</a>
            <a href="/contact">Contact</a>
        </div>
    </div>

    <!-- Main Container -->
    <div class="main-container">
        <c:forEach var="feedback" items="${feedbackList}">
            <div class="card">
                <h2>${feedback.fname} ${feedback.lname}</h2>
                <p>Email: ${feedback.email}</p>
                <p>Comment: ${feedback.comment}</p>
                <p class="rating">Rating: ${feedback.rating} ★</p>
            </div>
        </c:forEach>
    </div>

</body>
</html>
