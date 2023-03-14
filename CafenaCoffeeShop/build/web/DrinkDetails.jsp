<%-- 
    Document   : DrinkDetails
    Created on : Nov 12, 2022, 1:25:54 PM
    Author     : Asus
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Drink Details</title>

        <!-- Font Awesome CDN Link -->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- Libraries Stylesheet -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- Custom CSS File Link -->
        <link rel="stylesheet" href="css/DrinkDetails.css"> 
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <%@include file="includes/Header.jsp" %>

        <div style="height: 85px;"></div>

        <form action="ModifyCart" method="POST">
            
            <div class="container">

                <c:set var="drinkID" value="${param.drinkID}"/>
                <input type="hidden" name="drinkID" value="${drinkID}"/>
                <c:set var="drink" value="${drinkModel.getDrinkByID(drinkID)}"/>

                <div class="row">

                    <div class="col-md-4 left">

                        <div>

                            <img src="${drink.getImage()}" alt="${drink.getDrinkName()} Image"/>

                            <div style="text-align: center; margin: 20px 0;">
                                <button type="submit" name="action" value="add">Add To Cart</button>
                            </div>

                        </div>

                    </div>

                    <div class="col-md-8 right">

                        <h1>${drink.getDrinkName()}</h1>
                        <h2>${drink.getKind()}</h2>

                        <span style="float: left;">
                            <button type="button" onclick="modifyAmount('-')">-</button>
                            <input id="amount" style="width: 45px; text-align: center;" type="number" min="1" name="amount" value="${1}">
                            <button type="button" onclick="modifyAmount('+')">+</button>
                            &emsp;<span style="font-size: 15px;">x</span>&ensp;$${drink.getPrice()}
                        </span>

                        <span style="float: right;">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            &ensp;${drink.getOrderTime()} Orders
                        </span>

                        <div style="clear: both; padding-top: 40px; font-size: 1.7rem;">
                            ${drink.getDescription()}
                        </div>

                    </div>

                </div>

            </div>

        </form>

        <%@include file="includes/Footer.jsp" %>

        <!-- custom js file link  -->
        <script src="js/script.js"></script>

        <script>
            function modifyAmount(modify) {
                var amount = document.getElementById("amount");
                if (modify === '+') {
                    amount.value = parseInt(amount.value) + 1;
                }
                if (modify === '-' && amount.value > 1) {
                    amount.value = parseInt(amount.value) - 1;
                    }
            }               
        </script>

    </body>
</html>
