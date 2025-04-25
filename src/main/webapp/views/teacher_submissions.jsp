<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Submissions for Assignment</title>

    <!-- Import Poppins font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        /* General Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif; /* Changed to Poppins font */
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
            border-bottom: 2px solid #3d9f42; /* Green border changed to #3d9f42 */
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
            background-color: #3d9f42; /* Green hover effect changed to #3d9f42 */
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

        /* Table Styling */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Form Styling */
        textarea {
            width: 100%;
            height: 50px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
        }

        input[type="number"] {
            width: 100px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #3d9f42; /* Changed to #3d9f42 */
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #2c8a2b; /* Slightly darker green for hover effect */
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
                <div class="title">Student Submissions</div>
            </header>

            <!-- Table Section -->
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Submission Date</th>
                        <th>Download Solution</th>
                        <th>Grade Submission</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="submission" items="${submissions}">
    <tr>
        <td>${submission.studentId}</td>
        <td>${submission.submissionDate}</td>
        <td>
            <form action="downloadSolution" method="post">
                <input type="hidden" name="fileName" value="${submission.solutionPdfPath}" />
                <button type="submit">Download Solution</button>
            </form>
        </td>
        <td>
            <c:if test="${submission.graded == false}">
                <form action="gradeSubmission" method="post">
                    <input type="hidden" name="submissionId" value="${submission.id}" />
                    <input type="hidden" name="studentId" value="${submission.studentId}" />
                    <label>Marks:</label>
                    <input type="number" name="marks" min="0" max="100" value="${submission.marks}" required />
                    <br>
                    <label>Remarks:</label>
                    <textarea name="remarks" placeholder="Add feedback" required>${submission.remarks}</textarea>
                    <br>
                    <button type="submit">Submit Grade</button>
                </form>
            </c:if>
            <c:if test="${submission.graded == true}">
                <span>Graded</span> <!-- You can customize this as needed -->
            </c:if>
        </td>
    </tr>
</c:forEach>
                    
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
