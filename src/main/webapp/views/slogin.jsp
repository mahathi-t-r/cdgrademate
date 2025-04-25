<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Login</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap">
  <style>
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

    /* Navigation Bar Styles */
    nav {
      width: 100%;
      padding: 10px 20px;
      background: rgba(44, 62, 80, 0.2);
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
      color: #2c3e50;
      text-decoration: none;
      margin: 0 15px;
      font-weight: 600;
      transition: color 0.3s ease;
    }

    nav a:hover {
      color: #546e7a;
    }

    .logo {
      font-size: 1.5rem;
      font-weight: bold;
      color: #2c3e50;
    }

    .wrapper {
      width: 400px;
      border-radius: 8px;
      padding: 30px;
      text-align: center;
      border: 1px solid rgba(44, 62, 80, 0.5);
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
      color: #2c3e50;
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
      color: #2c3e50;
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
      color: #2c3e50;
    }

    .input-field input:focus~label,
    .input-field input:valid~label {
      font-size: 0.8rem;
      top: 10px;
      transform: translateY(-120%);
    }

    .forget {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin: 25px 0 35px 0;
      color: #2c3e50;
    }

    #remember {
      accent-color: #2c3e50;
    }

    .forget label {
      display: flex;
      align-items: center;
    }

    .forget label p {
      margin-left: 8px;
    }

    .wrapper a {
      color: #546e7a;
      text-decoration: none;
    }

    .wrapper a:hover {
      text-decoration: underline;
    }

    button {
      background: #2c3e50;
      color: #fff;
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
      color: #2c3e50;
      border-color: #2c3e50;
      background: rgba(44, 62, 80, 0.15);
    }

    .register {
      text-align: center;
      margin-top: 30px;
      color: #2c3e50;
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
      <a href="/signup">Sign Up</a>
    </div>
  </nav>

  <div class="wrapper">
    <c:if test="${not empty error}">
      <div class="error">
        ${error}
      </div>
    </c:if>
    <form action="/slogin" method="post">
      <h2>Student Login</h2>
      <div class="input-field">
        <input type="text" name="email" required>
        <label>Enter your email</label>
      </div>
      <div class="input-field">
        <input type="password" name="password" required>
        <label>Enter your password</label>
      </div>
      <div class="forget">
        <label for="remember">
          <input type="checkbox" id="remember">
          <p>Remember me</p>
        </label>
        <a href="#">Forgot password?</a>
      </div>
      <button type="submit">Log In</button>
      <div class="register">
        <p>Don't have an account? <a href="/signup">Register</a></p>
      </div>
    </form>
  </div>
</body>
</html>