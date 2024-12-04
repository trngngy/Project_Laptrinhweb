<%-- 
    Document   : cart
    Created on : Jun 28, 2024, 9:28:21 AM
    Author     : nguye
--%>

<%@page import="sample.invoice.InvoiceDAO"%>
<%@page import="sample.invoice.InvoiceDAO"%>
<%@page import="sample.invoice.InvoiceDTO"%>
<%@page import="java.util.Random"%>
<%@page import="sample.cart.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.cart.CartDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ministore</title>
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
        <style>
            .table {
                width: 100%;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
                margin-top: 100px;
            }

            .table thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
            }

            .table tbody + tbody {
                border-top: 2px solid #dee2e6;
            }

            .table-bordered {
                border: 1px solid #dee2e6;
            }

            .table-bordered th,
            .table-bordered td {
                border: 1px solid #dee2e6;
            }

            .table .product-thumbnail img {
                width: 100px; /* Adjust the width as needed */
                height: auto;
            }

            .table .product-name h2 {
                font-size: 1rem;
                margin: 0;
            }

            .table .btn-sm {
                padding: 0.25rem 0.5rem;
                font-size: 0.875rem;
                line-height: 1.5;
                border-radius: 0.2rem;
            }

            .table .input-group {
                display: flex;
                align-items: center;
            }

            .table .input-group input[type="text"] {
                width: 50px; /* Adjust the width as needed */
                margin-right: 0.5rem;
                text-align: center;
            }

            .table .btn-primary {
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }

            .table .btn-primary:hover {
                color: #fff;
                background-color: #0056b3;
                border-color: #004085;
            }
                a.btn.btn-primary.btn-lg.py-3.btn-block {
                    text-align: center;
                    text-decoration: none;
                    color: white;
                    background-color: #007bff;
                    border: 1px solid #007bff;
                    border-radius: 5px;
                    display: inline-block;
                    width: 100%;
                    padding: 10px 20px;
                    font-size: 18px;
                }

                a.btn.btn-primary.btn-lg.py-3.btn-block:hover {
                    background-color: #0056b3;
                    border-color: #0056b3;
                }
            
        </style>
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

    <div class="site-section">
        <%
            CartDAO cartDAO = new CartDAO();
            List<CartDTO> cartList = null;

            if (loginUser != null) {

                String UserID = loginUser.getUserID();
                cartList = cartDAO.getCart(UserID);
                session.setAttribute("cartList", cartList);

            }

        %>      
        <div class="container ">
            <div class="row mb-5">
                <div class="col-md-12" >
                    <div class="site-blocks-table">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Image</th>
                                    <th class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-total">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% float totalCost = 0;

                                    String InvID = (String) session.getAttribute("InvID");
                                    if (InvID == null) {
                                        InvID = "INV-" + new Random().nextInt(10000);
                                        session.setAttribute("InvID", InvID);
                                    }
                                    if (cartList != null) { %>
                                <% for (CartDTO cart : cartList) {
                                        cart.setInvID(InvID);
                                        cartDAO.updateInvID(cart);
                                        totalCost += cart.getTotalPrice();%>
                            <form class="col-md-12"  action="MainController" method="POST">    
                                <tr>
                                    <td class="product-thumbnail">
                                        <img src="images/<%=cart.getImageURL()%>" alt="Image" class="img-fluid">
                                    </td>
                                    <td class="product-name">
                                        <h2 class="h5 text-black"><%=cart.getProductID()%></h2>
                                    </td>
                                    <td><%=cart.getPrice()%></td>
                                    <td>
                                        <div class="input-group mb-3" style="max-width: 120px;">
                                            <input type="hidden" name="CartID" value="<%=cart.getCartID()%>">
                                            <input type="text" name="Quantity"  value="<%=cart.getQuantity()%>">

                                            <button name="action" value="Change" type="submit" class="btn btn-primary btn-sm">Update</button>

                                        </div>
                                    </td>
                                    <td><%=cart.getTotalPrice()%></td>
                                    <td> 
                                        <input type="hidden" name="CartID" value="<%=cart.getCartID()%>">
                                        <button name="action"value="Remove" class="btn btn-primary btn-sm">X</button>
                                    </td>
                                </tr>
                            </form>    
                            <% } %>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>





            <div class="row">
                <div class="col-md-6">
                    <div class="row mb-5">

                        <div class="col-md-6">
                            <a href="shop.jsp" class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</a>
                        </div>
                        <div class="col-md-6 mb-3 mb-md-0">
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

                </div>
                <div class="col-md-6 pl-5">
                    <div class="row justify-content-end">
                        <div class="col-md-7">
                            <div class="row">

                                <div class="col-md-12 text-right border-bottom mb-5">
                                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                </div>
                            </div>

                            <div class="row mb-5">
                                <div class="col-md-6">
                                    <span class="text-black">Total</span>
                                </div>
                                <div class="col-md-6 text-right">
                                    <strong class="text-black">$<%=totalCost%></strong>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <%
                                        InvoiceDAO dao = new InvoiceDAO();
                                        boolean invoiceExists = dao.invoiceExists(InvID);
                                        if (!invoiceExists && totalCost > 0) {
                                            InvoiceDTO invoice = new InvoiceDTO();
                                            invoice.setInvID(InvID);
                                            invoice.setUserID(loginUser.getUserID());
                                            invoice.setTotal(totalCost);
                                            invoice.setDateBuy("null"); // You might want to set this to the current date instead
                                            invoice.setPhoneNumber("null"); // You might want to set this to the user's actual phone
                                            invoice.setEmail("null"); // You might want to set this to the user's actual email

                                            // Store the invoice in the session
                                            session.setAttribute("invoice", invoice);
                                    %>
                                    <div>
                                        <a href="checkout.jsp" class="btn btn-primary btn-lg py-3 btn-block">Go to Checkout</a>
                                    </div>     
                                    <%
                                        } else {
                                            request.setAttribute("message", "Cannot checkout");

                                        }%>


                                </div>
                            </div>
                        </div>
                    </div>
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
                                        <a href="#">Home</a>
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
