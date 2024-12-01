<%-- 
    Document   : login
    Created on : Jun 14, 2024, 10:47:47 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap">
        <style>
            .form {
                height: 520px;
                width: 400px;
                background-color: #ffffff;
                position: absolute;
                transform: translate(-50%, -50%);
                top: 50%;
                left: 50%;
                border-radius: 10px;
                backdrop-filter: blur(10px);
                border: 2px solid #dddddd;
                box-shadow: 0 0 40px rgba(8, 7, 16, 0.1);
                padding: 50px 35px;
            }
            .form * {
                font-family: 'Poppins', sans-serif;
                color: #333333;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }
            .form h3 {
                font-size: 32px;
                font-weight: 500;
                line-height: 42px;
                text-align: center;
                color: #333333;
            }
            input {
                display: block;
                height: 50px;
                width: 380px;
                background-color: #f7f7f7;
                border-radius: 3px;
                padding: 0 10px;
                margin-top: 8px;
                font-size: 14px;
                font-weight: 300;
                border: 1px solid #dddddd;
            }
            ::placeholder {
                color: #aaaaaa;
            }
            .button {
                width: 100%;
                background-color: #3399ff;
                color: #ffffff;
                font-size: 18px;
                font-weight: 600;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 20px;
                padding: 15px 0;
            }
            .button:hover {
                background-color: #1552b0;
            }
            label {
                display: block;
                margin-top: 30px;
                font-size: 16px;
                font-weight: 500;
                color: #333333;
            }
            body {
                background-color: #f7f7f7;
            }
            .background {
                width: 430px;
                height: 520px;
                position: absolute;
                transform: translate(-50%, -50%);
                left: 50%;
                top: 50%;
            }
            .error-message h1 {
                margin-top: 10px;
                font-size: 14px;
                text-align: center;
                color: #ff512f;
            }
        </style>
    </head>
    <body>
        <div class="form">
            <h3>Login</h3>
            <form action="MainController" method="POST">
                <label for="userid">UserID</label>
                <input type="text" placeholder="Enter your UserID" name="UserID"/></br>
                <label for="password">Password</label>
                <input type="password" placeholder="Enter your Password" name="Password"/></br>
                <input class="button" type="submit" name="action" value="Login"/>
                <input class="button" type="submit" name="action" value="Sign Up" /> <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error == null) {
                        error = "";
                    }
                %>
                <div class="error-message">  
                    <h1><%= error%></h1>
                </div>
            </form>
        </div>
    </body>
</html>
