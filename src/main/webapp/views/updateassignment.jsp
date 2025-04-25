<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Assignment</title>

    <!-- Link to Google Fonts to include Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        /* General Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f4f6f9;
            font-size: 16px;
            color: #333;
        }

        .container {
            display: flex;
            width: 100%;
            height: 100vh;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            height: 100%;
            transition: all 0.3s ease;
        }

        .logo {
            font-size: 1.6em;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
            color: #ecf0f1;
            border-bottom: 2px solid #59e4a8;
            padding-bottom: 10px;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
        }

        nav ul li {
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s, padding-left 0.3s;
        }

        nav ul li:hover {
            background-color: #59e4a8;
            padding-left: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            display: block;
            width: 100%;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 30px;
            background-color: #ecf0f1;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #bdc3c7;
        }

        .search-bar {
            position: relative;
            width: 300px;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border: 1px solid #ccc;
            border-radius: 25px;
            font-size: 1em;
            outline: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .search-bar input:focus {
            border-color: #59e4a8;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
        }

        .profile {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .profile img {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            margin-right: 10px;
        }

        /* Form Styling */
        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 70%;
            margin: auto;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4baf4f;
        }

        .form-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .form-section > div {
            width: 48%;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"], input[type="date"], input[type="number"], textarea, input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            font-size: 0.9em;
        }

        button {
            background-color: #4baf4f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
            font-size: 14px;
            width: 100%;
        }

        button:hover {
            background-color: #3d9f42;
        }

    </style>
</head>
<body>

    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">GradeMate</div>
             <nav>
                <ul>
                    <li><a href="edashboard">Dashboard</a></li>
                    <li><a href="addassignment">Upload Assignments</a></li>
                    <li><a href="viewallassignments">View Assignments</a></li>
                    <li><a href="viewAssignments">View Submissions</a></li>
                </ul>
                <br>
                <ul>
                    <li><a href="elogin">Logout</a></li>
                    
                    <li><a href="/profile">Profile</a></li>
                    <li><a href="/feedback">FeedBack</a></li>
                </ul>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
            <header>
                <div class="search-bar">
                    <input type="text" placeholder="Search">
                </div>

                <div class="profile">
                    <img src="images/profile.png" alt="Profile Icon">
                    <span>Profile</span>
                </div>
            </header>

            <!-- Update Assignment Form -->
            <div class="form-container">
                <h2>Update Assignment</h2>
                <form action="updateassignment" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${assignment.id}" />
                    
                    <!-- First Section -->
                    <div class="form-section">
                        <div>
                            <label for="title">Title:</label>
                            <input type="text" name="title" value="${assignment.title}" required /><br>
                            
                            <label for="description">Description:</label>
                            <textarea name="description" required>${assignment.description}</textarea><br>
                            
                            <label for="courseCode">Course Code:</label>
                            <input type="text" name="courseCode" value="${assignment.courseCode}" required /><br>
                            
                            <label for="dueDate">Due Date:</label>
                            <input type="date" name="dueDate" value="${assignment.dueDate}" required /><br>
                        </div>

                        <div>
                            <label for="totalMarks">Total Marks:</label>
                            <input type="number" name="totalMarks" value="${assignment.totalMarks}" required /><br>
                            
                            <label for="uploadType">Upload Type:</label>
                            <input type="text" name="uploadType" value="${assignment.uploadType}" required /><br>
                            
                            <label for="tags">Tags:</label>
                            <input type="text" name="tags" value="${assignment.tags}" required /><br>
                            
                            <label for="questionPdf">Question PDF:</label>
                            <input type="file" name="questionPdf" /><br>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit">Update Assignment</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
