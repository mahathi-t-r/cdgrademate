<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submission Success</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .container {
            text-align: center;
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        .container:hover {
            transform: translateY(-10px);
            opacity: 0.95;
        }

        h1 {
            font-size: 30px;
            color: #3d9f42;
            font-weight: 600;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #7f8c8d;
            margin-bottom: 30px;
        }

        a {
            font-size: 18px;
            color: white;
            background-color: #3d9f42;
            text-decoration: none;
            padding: 14px 30px;
            border-radius: 8px;
            display: inline-block;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        a:hover {
            background-color: #2a7c2a;
            transform: translateY(-2px);
        }

        a:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${message}</h1>
        <p>Your submission was successful.</p>
        <a href="studentviewassignments">Back to Assignments</a>
    </div>
</body>
</html>