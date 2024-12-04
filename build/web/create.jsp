<%-- 
    Document   : create
    Created on : Jun 15, 2024, 10:25:37 PM
    Author     : nguye
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User Page</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: #f2f2f2;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 105vh;
                margin: 0;
            }

            form {
                background-color: #ffffff;
                padding: 20px 40px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                width: 100%;
                max-width: 400px;
            }

            form label {
                font-weight: 500;
                margin-bottom: 5px;
                display: block;
                color: #333333;
            }

            form input[type="text"],
            form input[type="password"],
            form input[type="submit"],
            form input[type="reset"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
                box-sizing: border-box;
                transition: background 0.3s, border 0.3s;
            }

            form input[type="submit"],
            form input[type="reset"] {
                background: #1845ad;
                color: white;
                cursor: pointer;
                border: none;
                transition: background 0.3s;
            }
            form input[type="reset"] {
                background: #6c757d;
            }
            form input[type="submit"]:hover {
                background: #1552b0;
            }
            form input[type="reset"]:hover {
                background: #5a6268;
            }

            form input[type="reset"]:hover {
                background: #5a6268;
            }
            .error-message {
                color: red;
                font-size: 12px;
                margin-bottom: 10px;
            }

            div {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            h3 {
                font-size: 32px;
                font-weight: 500;
                line-height: 42px;
                text-align: center;
                color: #333333;
            }
            body {
                background: #f2f2f2;
            }
            .text-primary{
                text-align : center;
            }
        </style>
    </head>
    <body>
        <%
            UserError error = (UserError) request.getAttribute("USER_ERROR");
            if (error == null) {
                error = new UserError();
            }
        %>
        <div>
            <form action="MainController" method="POST">
                <h3>Register Account</h3>
                <label>UserID</label>
                <input  type="text" placeholder="Enter your UserID " name="UserID" required=""/>
                <%= error.getUserID()%></br>
                <label>FullName</label>
                <input  type="text" placeholder="Enter your full name "  name="FullName" required=""/>
                <%= error.getFullName()%></br>
                <label>RoleID</label>
                <input  type="text" name="RoleID" value="US" readonly=""" required=""/></br>
                <label>Password</label>
                <input  type="password" placeholder="Enter your password" name="Password" required=""/></br>
                <label>PhoneNumber</label>
                <input  type="text" placeholder="Enter your phone number" name="PhoneNumber" required=""/></br>
                <label>Email</label>
                <input type="text" placeholder="Enter your email" name="Email" required=""/></br>
                <label>Confirm Password</label>
                <input type="password" placeholder="Enter your password again" name="Confirm" required=""/>
                <%= error.getConfirm()%></br>
                <input type="submit" name="action" value="Sign Up"/>
                <input  type="reset"  value="Reset"/>
                <div class="text-primary">Have a account?
                    <a href="login.jsp"> Login </a>
                </div>
            </form>
        </div>
    </body>
</html>
