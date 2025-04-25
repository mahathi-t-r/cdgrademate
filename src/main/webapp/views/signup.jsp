<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign up</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap">
  <style>
    /* Your existing CSS */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Open Sans", sans-serif;
    }

    body {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      width: 100%;
      padding: 0 10px;
      position: relative;
      background: url("images/bg2.jpg") no-repeat center center;
      background-size: cover;
    }

    nav {
      width: 100%;
      padding: 10px 20px;
      background: rgba(44, 62, 80, 0.2); /* Updated background color */
      border-radius: 8px;
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: absolute; /* Position at the top */
      top: 0;
      left: 0;
      z-index: 10;
    }

    nav a {
      color: #2c3e50; /* Updated color */
      text-decoration: none;
      margin: 0 15px;
      font-weight: 600;
      transition: color 0.3s ease;
    }

    nav a:hover {
      color: #efefef;
    }

    .logo {
      font-size: 1.5rem;
      font-weight: bold;
      color: #2c3e50; /* Updated color */
    }

    .wrapper {
      width: 400px;
      border-radius: 8px;
      padding: 30px;
      text-align: center;
      border: 1px solid rgba(44, 62, 80, 0.5); /* Updated border color */
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
    }

    form {
      display: flex;
      flex-direction: column;
    }

    h2 {
      font-size: 2rem;
      margin-bottom: 20px;
      color: #2c3e50; /* Updated color */
    }

    .input-field {
      position: relative;
      border-bottom: 2px solid #ccc;
      margin: 15px 0;
    }

    .input-field label {
      position: absolute;
      top: 50%;
      left: 0;
      transform: translateY(-50%);
      color: #2c3e50; /* Updated color */
      font-size: 16px;
      pointer-events: none;
      transition: 0.15s ease;
    }

    .input-field input {
      width: 100%;
      height: 40px;
      background: transparent;
      border: none;
      outline: none;
      font-size: 16px;
      color: #2c3e50; /* Updated color */
    }

    .input-field input:focus~label,
    .input-field input:valid~label {
      font-size: 0.8rem;
      top: 10px;
      transform: translateY(-120%);
    }

    .radio-group {
      display: flex;
      justify-content: space-around;
      margin: 15px 0;
    }

    .radio-group label {
      color: #2c3e50; /* Updated color */
      font-size: 16px;
    }

    button {
      background: #fff;
      color: #2c3e50; /* Updated color */
      font-weight: 600;
      border: none;
      padding: 12px 20px;
      cursor: pointer;
      border-radius: 3px;
      font-size: 16px;
      border: 2px solid transparent;
      transition: 0.3s ease;
    }

    button:hover {
      color: #fff;
      border-color: #fff;
      background: rgba(255, 255, 255, 0.15);
    }

    .register {
      text-align: center;
      margin-top: 30px;
      color: #2c3e50; /* Updated color */
    }

    .error {
      color: red;
      font-size: 0.9rem;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
  <nav>
    <div class="logo">GradeMate</div>
    <div>
      <a href="/">Home</a>
      <a href="/about">About Us</a>
      <a href="/slogin">Student Login</a>
      <a href="/elogin">Educator Login</a>
    </div>
  </nav>

  <div class="wrapper">
    <form id="signupForm" action="/signup" method="POST">
      <h2>Sign Up</h2>
      <div id="errorContainer" class="error"></div>
      <div class="input-field">
        <input type="text" id="username" name="username" required>
        <label>Username</label>
      </div>
      <div class="input-field">
        <input type="email" id="email" name="email" required>
        <label>Email</label>
      </div>
      <div class="input-field">
        <input type="password" id="password" name="password" required>
        <label>Password</label>
      </div>
      <div class="radio-group">
        <label>
          <input type="radio" name="role" value="educator" required>
          Educator
        </label>
        <label>
          <input type="radio" name="role" value="student">
          Student
        </label>
      </div>
      <button type="submit">Sign Up</button>
      
    </form>
  </div>

  <script>
    document.getElementById('signupForm').addEventListener('submit', function (e) {
      const username = document.getElementById('username').value.trim();
      const email = document.getElementById('email').value.trim();
      const password = document.getElementById('password').value;
      const errorContainer = document.getElementById('errorContainer');

      let errors = [];

      // Username validation
      if (username.length < 3) {
        errors.push("Username must be at least 3 characters long.");
      }

      // Email validation
      const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
      if (!emailPattern.test(email)) {
        errors.push("Please enter a valid email address.");
      }

      // Password validation
      if (password.length < 6) {
        errors.push("Password must be at least 6 characters long.");
      }

      // Display errors or allow submission
      if (errors.length > 0) {
        e.preventDefault();
        errorContainer.innerHTML = errors.join("<br>");
      }
    });
  </script>
</body>
</html>