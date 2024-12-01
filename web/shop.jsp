<%-- 
    Document   : shop
    Created on : Jun 25, 2024, 10:13:46 AM
    Author     : nguye
--%>

<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.product.ProductDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ministore</title>
        <style>
            /* Style for the search bar container */
            .search-bar-container {
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 15px;
                background-color: #f9f9f9;
            }

            /* Style for the categories list */
            .search-bar-container ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .search-bar-container ul li {
                margin-bottom: 10px;
            }

            .search-bar-container ul li a {
                text-decoration: none;
                color: #333;
                font-weight: bold;
            }

            .search-bar-container ul li a:hover {
                color: #007bff;
            }

            /* Style for the filter by price form */
            .search-bar-container .filter-by-price {
                margin-top: 20px;
            }

            .search-bar-container .filter-by-price h3 {
                margin-bottom: 15px;
                font-size: 16px;
                font-weight: bold;
            }

            .search-bar-container .filter-by-price label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .search-bar-container .filter-by-price input[type="number"] {
                width: 100%;
                padding: 5px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            .search-bar-container .filter-by-price input[type="submit"] {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 3px;
                cursor: pointer;
            }

            .search-bar-container .filter-by-price input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .order-1 {
                padding-top: 120px;
            }
            .row {
                padding-top: 20px;
            }
        </style>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <!-- script
        ================================================== -->
        <script src="js/modernizr.js"></script>
    </head>

    <body>
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
                                    <a class="nav-link me-4" href="home.jsp#company-services">Services</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link me-4" href="home.jsp#smart-watches">Watches</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link me-4" href="home.jsp#yearly-sale">Sale</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link me-4" href="shop.jsp">Shop</a>
                                </li>
                                </li>
                                <li class="nav-item">
                                    <div class="user-items ps-5">
                                        <ul class="d-flex justify-content-end list-unstyled">
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
                                                <a href="cart.jsp">
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
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol xmlns="http://www.w3.org/2000/svg" id="user" viewBox="0 0 16 16">
        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="cart" viewBox="0 0 16 16">
        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
    </symbol>
    </svg>
    <div class="row mb-5">
        <%--show case--%>
        <%
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> productList = null;
            if (request.getAttribute("Product_List") != null) {
                productList = (List<ProductDTO>) request.getAttribute("Product_List");
            } else {
                productList = dao.getAllProduct();
            }
        %>
        <div class="col-md-9 order-2">
            <div class="row">
                <div class="col-md-12 mb-5">
                    <div class="float-md-left mb-4"></div>
                    <%
                        String message = (String) request.getAttribute("message");
                        if (message == null) {
                            message = "";
                        }
                    %>
                    <div class="d-flex justify-content-center">
                        <h3 style="color: red;"><%= message%></h3>
                    </div> 
                </div>

            </div>
            <div class="row mb-5">
                <% for (ProductDTO product : productList) {%>
                <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                    <div class="block-4 text-center border">
                        <figure class="block-4-image">
                            <img src="images/<%= product.getImageURL()%>" alt="Image placeholder" class="img-fluid">
                        </figure>
                        <div class="block-4-text p-4">
                            <h3><a href="#"><%= product.getModel()%></a></h3>
                            <p class="mb-0"><%= product.getColor()%></p>
                            <p class="text-primary font-weight-bold">$<%= product.getPrice()%></p>
                            <form action="AddToCartController" method="POST">
                                <input type="hidden" name="ProductID" value="<%= product.getProductID()%>">
                                <input type="hidden" name="Price" value="<%= product.getPrice()%>">
                                <input type="hidden" name="ImageURL" value="<%= product.getImageURL()%>">
                                <% if (loginUser == null) { %>
                                <input type="hidden" name="UserID" value="">
                                <% } else {%>
                                <input type="hidden" name="UserID" value="<%= loginUser.getUserID()%>">
                                <% } %>
                                <input type="hidden" name="InvID" value="null">
                                <input type="hidden" name="Quantity" value="1">
                                <button type="submit" name="action" value="Add" class="btn btn-primary">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>

        </div>
        <%--Searching bar--%>
        <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="search-bar-container">
                <h3 class="mb-3 h6 text-uppercase text-black d-block ">Searching Bar</h3>
                <div class="filter-by-price">
                    <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Model</h3>
                    <form action="MainController" method="POST" id="modelForm">
                        <label for="model">Model:</label>
                        <input type="text" id="model" name="model" class="form-control mb-3">
                        <input type="hidden" name="action" value="SearchModel">
                        <div class="mb-1">
                            <input type="submit" value="Filter" class="btn btn-primary">
                        </div>
                    </form>
                </div>

                <div class="filter-by-price">
                    <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3>
                    <form action="MainController" method="POST" id="priceForm">
                        <label for="minPrice">Min Price:</label>
                        <input type="number" id="minPrice" name="minPrice" min="0" step="0.01" class="form-control mb-3">
                        <label for="maxPrice">Max Price:</label>
                        <input type="number" id="maxPrice" name="maxPrice" min="0" step="0.01" class="form-control mb-3">
                        <input type="hidden" name="action" value="SearchPrice">
                        <div class="mb-1">
                            <input type="submit" value="Filter" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <footer id="footer" class="overflow-hidden">
        <div class="container">
            <div class="row">
                <div class="footer-top-area">
                    <div class="row d-flex flex-wrap justify-content-between">
                        <div class="col-lg-3 col-sm-6 pb-3">
                            <div class="footer-menu">
                                <img src="images/main-logo.png" alt="logo">
                                <p>Nisi, purus vitae, ultrices nunc. Sit ac sit suscipit hendrerit. Gravida massa volutpat aenean odio erat nullam fringilla.</p>
                                <div class="social-links">
                                    <ul class="d-flex list-unstyled">
                                        <li>
                                            <a href="#">
                                                <svg class="facebook">
                                                <use xlink:href="#facebook" />
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <svg class="instagram">
                                                <use xlink:href="#instagram" />
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <svg class="twitter">
                                                <use xlink:href="#twitter" />
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <svg class="linkedin">
                                                <use xlink:href="#linkedin" />
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <svg class="youtube">
                                                <use xlink:href="#youtube" />
                                                </svg>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-6 pb-3">
                            <div class="footer-menu text-uppercase">
                                <h5 class="widget-title pb-2">Quick Links</h5>
                                <ul class="menu-list list-unstyled text-uppercase">
                                    <li class="menu-item pb-2">
                                        <a href="home.jsp">Home</a>
                                    </li>
                                    <li class="menu-item pb-2">
                                        <a href="shop.jsp">Shop</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 pb-3">
                            <div class="footer-menu contact-item">
                                <h5 class="widget-title text-uppercase pb-2">Contact Us</h5>
                                <p>Do you have any queries or suggestions? <a href="mailto:">truongnnse183428@fpt.edu.vn</a>
                                </p>
                                <p>If you need support? Just give us a call. <a href="">+84 78 6315267</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </footer>
    <div id="footer-bottom">
        <div class="container">
            <div class="row d-flex flex-wrap justify-content-between">
                <div class="col-md-4 col-sm-6">
                    <div class="Shipping d-flex">
                        <p>We ship with:</p>
                        <div class="card-wrap ps-2">
                            <img src="images/dhl.png" alt="visa">
                            <img src="images/shippingcard.png" alt="mastercard">
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="payment-method d-flex">
                        <p>Payment options:</p>
                        <div class="card-wrap ps-2">
                            <img src="images/visa.jpg" alt="visa">
                            <img src="images/mastercard.jpg" alt="mastercard">
                            <img src="images/paypal.jpg" alt="paypal">
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="copyright">
                        <p>© Copyright 2023 MiniStore. Design by <a href="https://templatesjungle.com/">TemplatesJungle</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/plugins.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>
