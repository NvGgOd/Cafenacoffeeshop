<%-- 
    Document   : Menu
    Created on : Nov 13, 2022, 12:50:49 AM
    Author     : Asus
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>

        <!-- Font Awesome CDN Link -->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- Libraries Stylesheet -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css"/>
        <link rel="stylesheet" href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"/>

        <!-- Custom CSS File Link -->
        <link rel="stylesheet" href="css/style.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>

        <style>
            .testimonial-carousel .owl-dots{
                margin-top:30px;
                text-align:center
            }

            .testimonial-carousel .owl-dot{
                position:relative;
                display:inline-block;
                margin:0 5px;
                width:20px;
                height:20px;
                border-radius:20px;
                background:#DA9F5B;
                transition:.5s
            }

            .testimonial-carousel .owl-dot.active{
                width:40px;
                background:whitesmoke;
            }

            .testimonial-carousel .owl-item img{
                width:80px;
                height:80px
            }

            .checked {
                color: orange!important;
            }
        </style>
    </head>
    <body>

        <%@include file="includes/Header.jsp" %>

        <div style="height: 85px;"></div>

        <section class="menu" id="menu">

            <h1  style="padding: 20px 0;"class="heading">Our<span> Menu</span></h1>

            <c:set var="key" value="${requestScope.key}"/>

            <c:if test="${not empty key}">
                <h1 style="color: green; text-align: center">Result for:&ensp;${key}</h1>
            </c:if>

            <div style="display: block;" class="box-container">

                <c:set var="drinks" value="${requestScope.drinks}"/>

                <div style="display: block; margin: auto;" class="container-fluid py-5">

                    <div class="container">

                        <div class="owl-carousel testimonial-carousel">

                            <c:forEach var="drink" items="${drinks}">

                                <div class="d-flex align-items-center mb-3">
                                    <div class="box">
                                        <img style="display: block; margin: auto; height: auto;" src="${drink.getImage()}" alt="">
                                        <h3>${drink.getDrinkName()}</h3>
                                        <div class="price">$${drink.getPrice()} <span>2.5</span></div>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <a href="DrinkDetails.jsp?drinkID=${drink.getDrinkID()}" class="btn">View Details</a>
                                    </div>
                                </div>

                            </c:forEach>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <%@include file="includes/Footer.jsp" %>

        <!-- custom js file link  -->
        <script src="js/script.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="js/Menu.js"></script>

    </body>
</html>
