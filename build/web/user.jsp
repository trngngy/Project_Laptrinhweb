<%-- 
    Document   : user
    Created on : Jun 25, 2024, 10:16:12 AM
    Author     : nguye
--%>

<%@page import="sample.user.UserError"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ministore</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <style>
            .form {
                height: 670px;
                width: 450px;
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
                margin-top: 100px;
            }
            .form * {
                font-family: 'Poppins', sans-serif;
                color: #333333;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }
            .form h3 {
                font-size: 25px;
                font-weight: 400;
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
                margin-top: 10px;
                font-size: 16px;
                font-weight: 500;
                color: #333333;
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
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol xmlns="http://www.w3.org/2000/svg" id="user" viewBox="0 0 16 16">
        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="cart" viewBox="0 0 16 16">
        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
    </symbol>
    </svg>
    <header id="header" class="site-header header-scrolled position-fixed text-black bg-light">
        <nav id="header-nav" class="navbar navbar-expand-lg px-3 mb-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="home.jsp">
                    <img src="images/main-logo.png" class="logo">
                </a>
                <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <svg class="navbar-icon">
                    <use xlink:href="#navbar-icon"></use>
                    </svg>
                </button>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel">
                    <div class="offcanvas-header px-4 pb-0">
                        <a class="navbar-brand" href="home.jsp">
                            <img src="images/main-logo.png" class="logo">
                        </a>
                        <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas" aria-label="Close" data-bs-target="#bdNavbar"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul id="navbar" class="navbar-nav text-uppercase justify-content-end align-items-center flex-grow-1 pe-3">
                            <li class="nav-item">
                                <a class="nav-link me-4 active" href="home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link me-4" href="shop.jsp">Shop</a>
                            </li>
                            </li>
                            <li class="nav-item">
                                <div class="user-items ps-5">
                                    <ul class="d-flex justify-content-end list-unstyled">
                                        <!--< <li class="search-item pe-3">
                                           <a href="#" class="search-button">
                                             <svg class="search">
                                               <use xlink:href="#search"></use>
                                             </svg>
                                           </a>
                                         </li>-->
                                        <li class="pe-3">
                                            <a href="user.jsp">
                                                <svg class="user">
                                                <use xlink:href="#user"></use>
                                                </svg>
                                            </a>
                                            <%
                                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                                if (loginUser == null) {
                                                    response.sendRedirect("login.jsp");
                                                    return;
                                                }
                                            %>
                                            <h1><%= loginUser.getFullName()%></h1>
                                        </li>
                                        <li>
                                            <a href="cart.html">
                                                <svg class="cart">
                                                <use xlink:href="#cart"></use>
                                                </svg>
                                            </a>
                                        </li>
                                        <li >
                                            <form action="MainController" method="POST" id="logout-form">
                                                <button  
                                                    type="submit" name="action" value="Logout" id="logout-button">
                                                    <img src="images/logout.jpg" alt="Logout" class="logout-icon">
                                                </button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </header> 
    <div class="form">
        <h3>Account Information</h3>
        <form action="MainController" method="POST">
            <%
                loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>      
            <div>
                <div>
                    <div >
                        <label for="UserID">UserID</label>
                        <input type="text"   name="UserID" value="<%= loginUser.getUserID()%>" readonly>
                    </div>
                    <div >
                        <label for="FullName" >FullName</label>
                        <input type="text"  name="FullName" value="<%= loginUser.getFullName()%>">
                    </div>
                </div>
                <div >
                    <div >
                        <label for="Password" >Password</label>
                        <input type="password"  name="Password" value="<%= loginUser.getPassword()%>">
                    </div>
                </div>
                <div>
                    <div>
                        <label for="PhoneNumber" >PhoneNumber</label>
                        <input type="text"   name="PhoneNumber" value="<%= loginUser.getPhoneNumber()%>">
                    </div>
                </div>
                <div>
                    <div>
                        <label for="Email" >Email</label>
                        <input type="text"  name="Email" value="<%= loginUser.getEmail()%>">
                    </div>
                </div>
                <div class="error-message"><h1><%= error%></h1></div>
                <div>
                    <div>
                        <% if ("AD".equals(loginUser.getRoleID())) { %>
                        <button type="submit" name="action" value="Update User2"class="btn btn-primary btn-sm">Update</button>
                        <% } else { %>
                        <input type="submit" class="btn btn-primary btn-lg btn-block" name="action" value="Update User">
                        <% }%>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
