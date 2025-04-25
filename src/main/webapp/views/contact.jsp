<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* General page styles */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
        }

        /* Navbar styling */
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

        /* Main container styling */
        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px;
        }

        /* Contact form and image container */
        .contact-container {
            background-color: #fff;
            display: flex;
            width: 800px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        /* Form section */
        .form-section {
            padding: 40px;
            width: 50%;
        }

        .form-section h1 {
            font-size: 24px;
            color: #2e8b57;
            margin-bottom: 8px;
        }

        .form-section p {
            font-size: 14px;
            color: #555;
            margin-bottom: 24px;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #333;
            margin-bottom: 4px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #2e8b57;
            outline: none;
        }

        .submit-btn {
            background-color: #2e8b57;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #267346;
        }

        /* Right image section */
        .image-section {
            width: 50%;
            background-image: url("images/login.jpg");
            background-size: cover;
            background-position: center;
        }

        /* Updated Rating Section */
        .rating-container {
            display: flex;
            flex-direction: row-reverse;
            justify-content: flex-start;
            gap: 5px; /* Add spacing between stars */
        }

        .rating-container input {
            display: none; /* Hide the radio buttons */
        }

        .rating-container label {
            font-size: 24px; /* Size of stars */
            color: #ccc; /* Default star color */
            cursor: pointer; /* Cursor changes to pointer on hover */
            transition: color 0.3s;
        }

        .rating-container input:checked ~ label,
        .rating-container label:hover,
        .rating-container label:hover ~ label {
            color: #f90; /* Highlight stars on hover or selection */
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

    <!-- Main container for form and image -->
    <div class="main-container">
        <div class="contact-container">
            <!-- Form section -->
            <div class="form-section">
                <h1>Contact us</h1>
                <p>Need to get in touch with us? Either fill out the form with your inquiry or find the department email you’d like to contact below.</p>

                <form action="contactSubmit" method="post">
                    <div class="form-group">
                        <label for="firstName">First name*</label>
                        <input type="text" id="firstName" name="fname" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last name</label>
                        <input type="text" id="lastName" name="lname">
                    </div>
                    <div class="form-group">
                        <label for="email">Email*</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="inquiry">What can we help you with?</label>
                        <textarea id="inquiry" name="comment" rows="4"></textarea>
                    </div>

                    <!-- Star Rating -->
                    <div class="form-group">
                        <label for="rating">Rate your experience:</label>
                        <div class="rating-container">
                            <input type="radio" id="star5" name="rating" value="5">
                            <label for="star5" title="5 stars">★</label>
                            
                            <input type="radio" id="star4" name="rating" value="4">
                            <label for="star4" title="4 stars">★</label>
                            
                            <input type="radio" id="star3" name="rating" value="3">
                            <label for="star3" title="3 stars">★</label>
                            
                            <input type="radio" id="star2" name="rating" value="2">
                            <label for="star2" title="2 stars">★</label>
                            
                            <input type="radio" id="star1" name="rating" value="1">
                            <label for="star1" title="1 star">★</label>
                        </div>
                    </div>

                    <button type="submit" class="submit-btn">Submit</button>
                </form>
            </div>

            <!-- Image section -->
            <div class="image-section"></div>
        </div>
    </div>

</body>
</html>
