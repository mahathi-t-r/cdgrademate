<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>View Assignments</title>

<!-- Import Poppins font from Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
    /* General Reset and Base Styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif; /* Change to Poppins font */
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
        border-bottom: 2px solid #59e4a8; /* Green border added */
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
        background-color: #3d9f42; /* Updated green color */
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
        border-color: #59e4a8; /* Highlight border */
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

    /* Table Styling */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #2c3e50;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    a {
        text-decoration: none;
        color: #59e4a8;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
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
            <!-- Header Section -->
            <header>
                <div class="title">All Assignments</div>
                <div class="search-bar">
                    <input type="text" placeholder="Search Assignments...">
                </div>
            </header>

            <!-- Table Section -->
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Assignment Name</th>
                            <th>Assignment Number</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="assignment" items="${assignments}">
                            <tr>
                                <td>${assignment.title}</td>
                                <td>${assignment.id}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/viewSubmissions?assignmentId=${assignment.id}">View Submissions</a>
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
