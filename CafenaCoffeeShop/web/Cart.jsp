<%-- 
    Document   : Cart
    Created on : Nov 11, 2022, 3:02:27 PM
    Author     : Asus
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>

        <!-- Font Awesome CDN Link -->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- Libraries Stylesheet -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Custom CSS File Link -->
        <link rel="stylesheet" href="css/Cart.css"> 
        <link rel="stylesheet" href="css/style.css">
        <style>
            body {
                background-color: whitesmoke!important;
            }
        </style>
        
    </head>
    <body>

        <%@include file="includes/Header.jsp" %>

        <div style="height: 85px;"></div>

        <!-- Cart Start -->
        <div>   

            <c:set var="cartsByEmail" value="${cartModel.getCartsByEmail(email)}"/>

            <form action="" method="POST">

                <div class="cardBox">

                    <div class="row">

                        <div class="col-md-8 cart">

                            <div class="title">
                                <div class="row">
                                    <div class="col"><h1 style="font-weight: bold;">SHOPPING CART</h1></div>
                                    <div style="font-size: 15px;" class="col align-self-center text-right text-muted">
                                        <a href="index.jsp#">
                                            &leftarrow;<span class="text-muted"> Back to shop</span>
                                        </a></div>
                                </div>
                            </div>

                            <c:if test="${cartsByEmail.size() == 0}">
                                <p style="margin-left: 30px">YOU CART IS EMPTY</p>
                            </c:if>

                            <c:forEach var="cart" items="${cartsByEmail}"> 

                                <c:set var="drinkID" value="${cart.getDrinkID()}"/>
                                <c:set var="drink" value="${drinkModel.getDrinkByID(drinkID)}"/>

                                <div class="row border-top border-bottom">

                                    <div style="font-size: 15px;" class="row main align-items-center">

                                        <div class="col-md-2"><img style="margin: auto; display: block;" class="img-fluid" src="${drink.getImage()}" alt=""></div>

                                        <div class="col-md-3">
                                            <div class="row text-muted">${drink.getDrinkName()}</div>
                                            <div class="row">${drink.getKind()}</div>
                                        </div>

                                        <div style="text-align: center;" class="col-md-3">
                                            <a style="font-weight: bold;" href="#">-</a>
                                            <a href="#" class="border">${cart.getAmount()}</a>
                                            <a style="font-weight: bold;" href="#">+</a>
                                        </div>

                                        <div style="text-align: center;" class="col-md-2">
                                            &dollar; ${drink.getPrice() * cart.getAmount()} 
                                        </div>  

                                        <div style="text-align: center; display: flex; justify-content: center;" class="col-md-2">
                                            <input id="${drinkID}" style="margin: 0;" onclick="check(this.id)" type="checkbox" name="${drinkID}" value="${drink.getPrice() * cart.getAmount()}" checked>
                                            <a href="#"><span style="float: right;">&#10005;</span></a>
                                        </div>
                                    </div>

                                </div>

                            </c:forEach>

                            <div class="back-to-shop">
                            </div>

                        </div>

                        <div class="col-md-4 summary">

                            <div class="title">
                                <div class="row">
                                    <div class="col"><h1 style="font-weight: bold;">Summary</h1></div>
                                </div>
                            </div>

                            <hr>

                            <div style="margin-bottom: 10px; font-size: 15px;" class="row">

                                <div class="col" style="padding-left:0;">ITEMS PRICE</div>

                                <c:set var="sum" value="${cartModel.getSumPriceByEmail(email)}"/>

                                <div class="col text-right">&dollar; ${sum}</div>

                            </div>

                            <p style="font-size: 14px;">PAYMENT</p>

                            <select style="font-size: 14px;" name="method">
                                <option class="text-muted" >PayPal</option>
                                <option class="text-muted" >Updating more method</option>
                            </select>

                            <p style="font-size: 14px;">YOUR ADDRESS</p>

                            <input id="code" name="address" placeholder="ENTER YOUR ADDRESS" style="font-size: 14px;" value="${account.getAddress()}" required>

                            <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0; font-size: 15px;">
                                <div class="col">TOTAL PRICE</div>
                                <div class="col text-right">&dollar; <span id="checkSum">${sum}</span></div>
                            </div>

                            <button style="font-size: 14px; margin-top: 15px; background-color: brown; border-radius: 0;" class="btn" type="submit" name="action" value="checkout">CHECKOUT NOW</button>

                        </div>

                    </div>

                </div>

            </form>

        </div>
        <!-- Cart End -->

        <%@include file="includes/Footer.jsp" %>

        <!-- custom js file link  -->
        <script src="js/script.js"></script>
        <script src="js/Cart.js"></script>
        
    </body>
</html>
