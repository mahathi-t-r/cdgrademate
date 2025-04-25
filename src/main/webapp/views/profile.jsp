<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background: linear-gradient(135deg, #f8f8f8 0%, #c3cfe2 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    perspective: 1000px;
}

.profile-card {
    background-color: #ffffff;
    border-radius: 20px;
    box-shadow: 0 15px 35px rgba(70, 90, 103, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
    overflow: hidden;
    width: 400px;
    transform: translateY(0);
    transition: all 0.3s ease-in-out;
}

.profile-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 20px 40px rgba(70, 90, 103, 0.15), 0 8px 20px rgba(0, 0, 0, 0.1);
}

.profile-header {
    background: linear-gradient(to right, #465a67, #4aaf4f);
    color: #ffffff;
    padding: 40px 20px 20px;
    text-align: center;
    position: relative;
}

.profile-header::before {
    content: '';
    position: absolute;
    bottom: -20px;
    left: 0;
    right: 0;
    height: 40px;
    background: linear-gradient(to right, #465a67, #4aaf4f);
    transform: skewY(-4deg);
}

.profile-header img {
    width: 140px;
    height: 140px;
    border-radius: 50%;
    border: 5px solid #ffffff;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    object-fit: cover;
    margin-top: -90px;
    position: relative;
    z-index: 1;
    transition: transform 0.3s ease;
}

.profile-header img:hover {
    transform: scale(1.1) rotate(5deg);
}

.profile-header h2 {
    font-size: 26px;
    margin-top: 15px;
    font-weight: 500;
    letter-spacing: 0.5px;
}

.profile-header p {
    font-size: 14px;
    color: rgba(255, 255, 255, 0.8);
    margin-top: 5px;
}

.profile-details {
    padding: 30px 20px;
    background-color: #f8f8f8;
}

.detail {
    display: flex;
    justify-content: space-between;
    margin: 15px 0;
    padding: 10px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
}

.detail:hover {
    transform: translateX(10px);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.08);
}

.detail .label {
    color: #465a67;
    font-weight: 500;
    opacity: 0.8;
}

.detail .value {
    color: #4aaf4f;
    font-weight: 600;
}

.profile-actions {
    padding: 20px;
    text-align: center;
    background-color: #f4f6f9;
    border-top: 1px solid #e9ecef;
}

.profile-actions a {
    text-decoration: none;
    color: #ffffff;
    padding: 12px 25px;
    border-radius: 50px;
    font-size: 14px;
    margin: 0 10px;
    display: inline-block;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.btn-edit {
    background-color: #465a67;
    box-shadow: 0 4px 6px rgba(70, 90, 103, 0.2);
}

.btn-edit:hover {
    background-color: #4aaf4f;
    transform: translateY(-3px);
    box-shadow: 0 6px 8px rgba(70, 90, 103, 0.3);
}

.btn-logout {
    background-color: #e74c3c;
    box-shadow: 0 4px 6px rgba(231, 76, 60, 0.2);
}

.btn-logout:hover {
    background-color: #c0392b;
    transform: translateY(-3px);
    box-shadow: 0 6px 8px rgba(231, 76, 60, 0.3);
}

/* Responsive Adjustments */
@media screen and (max-width: 480px) {
    .profile-card {
        width: 95%;
        margin: 20px;
    }
}

    </style>
</head>
<body>
    <div class="profile-card">
        <!-- Profile Header -->
        <div class="profile-header">
            <img src="images/profile.png" alt="Profile Picture">
            <h2><c:out value="${user.username}" /></h2>
            <p><c:out value="${user.role}" /></p>
        </div>

        <!-- Profile Details -->
        <div class="profile-details">
            <div class="detail">
                <span class="label">Username:</span>
                <span class="value"><c:out value="${user.username}" /></span>
            </div>
            <div class="detail">
                <span class="label">Email:</span>
                <span class="value"><c:out value="${user.email}" /></span>
            </div>
            <div class="detail">
                <span class="label">Role:</span>
                <span class="value"><c:out value="${user.role}" /></span>
            </div>
        </div>

        <div class="profile-actions">
        <c:choose>
            <c:when test="${user.role == 'student'}">
                <a href="sdashboard" class="btn-edit">Back</a>
            </c:when>
            <c:when test="${user.role == 'educator'}">
                <a href="edashboard" class="btn-edit">Back</a>
            </c:when>
            <c:otherwise>
                <a href="#" class="btn-edit">Back</a>
            </c:otherwise>
        </c:choose>
        <a href="/" class="btn-logout">Logout</a>
    </div>
    </div>
</body>
</html>