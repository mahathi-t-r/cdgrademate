<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Assignments</title>

    <!-- Link to Google Fonts for Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        /* General Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif; /* Poppins font applied */
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
            border-bottom: 2px solid #3d9f42; /* Green border added */
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
            background-color: #3d9f42; /* Green hover effect */
            padding-left: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            display: block;
            width: 100%;
        }

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
            padding: 10px 15px 10px 40px; /* Add left padding for the icon */
            border: 1px solid #ccc;
            border-radius: 25px; /* Rounded corners */
            font-size: 1em;
            outline: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .search-bar input:focus {
            border-color: #3d9f42; /* Highlight border */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15); /* Slightly stronger shadow on focus */
        }

        .search-bar::before {
            content: '\1F50D'; /* Unicode for magnifying glass icon */
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2em;
            color: #7f8c8d; /* Icon color */
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

        .sections {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.3s;
            border-left: 5px solid #3d9f42; /* Green border on the left side of each card */
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            color: #2c3e50;
            font-size: 1.3em;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 1em;
            color: #7f8c8d;
        }

        /* Table Styles */
        .table-container {
            margin-top: 20px;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #2c3e50;
            color: white;
        }

        table td a {
            color: #3d9f42; /* Green text for download links */
            text-decoration: none;
        }

        table td a:hover {
            text-decoration: underline;
        }

        /* Styling for "All Assignments" heading */
        .title {
            font-size: 2em;
            font-weight: 600;
            color: #3d9f42; /* Changed to match the turquoise color */
            padding-bottom: 10px;
            border-bottom: 2px solid #3d9f42;
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
                    <li><a href="sdashboard">Dashboard</a></li>
                    <li><a href="studentviewassignments">view Assignments</a></li>
                    <li><a href="viewGradedSubmissions">My Grades</a></li>
                    <li><a href="viewassignments">Submit Assignments</a></li>
                </ul>
                <ul class="other">
                    <li><a href="slogin">Logout</a></li>
                    <li><a href="/profile">Profile</a></li>
                    <li><a href="feedback">FeedBack</a></li>
                </ul>
            </nav>
            
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header Section -->
            <div class="header">
                <div class="title">All Assignments</div> <!-- Title styled here -->
                
            </div>

            <!-- Table Section -->
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Assignment ID</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Due Date</th>
                            <th>Question PDF</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="assignment" items="${assignments}">
                            <tr>
                                <td>${assignment.id}</td>
                                <td>${assignment.title}</td>
                                <td>${assignment.description}</td>
                                <td>${assignment.dueDate}</td>
                                <td>
                                    <a href="download?fileName=${fn:escapeXml(assignment.questionPdfPath)}">Download PDF</a>
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>
