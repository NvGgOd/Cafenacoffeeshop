<%-- 
    Document   : Menu
    Created on : Nov 5, 2022, 6:20:26 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- menu section starts -->
<section class="menu" id="menu">

    <h1 class="heading">Best<span> Seller</span></h1>

    <div class="box-container">

        <c:set var="drinks" value="${drinkModel.getBestSeller()}"/>
        <c:forEach var="drink" items="${drinks}">
            <div class="box">
                <img src="${drink.getImage()}" alt="">
                <h3>${drink.getDrinkName()}</h3>
                <div class="price">$${drink.getPrice()} <span>2.5</span></div>
                <a href="DrinkDetails.jsp?drinkID=${drink.getDrinkID()}" class="btn">View Details</a>
            </div>
        </c:forEach>

    </div>

    <div style="margin-top: 40px;">
        <a href="MenuServlet" class="btnMenu">Show All Menu <i class="fas fa-arrow-right"></i></a>
    </div>

    <script src="https://use.fontawesome.com/be5b511ea9.js"></script> 

</section>
<!-- menu section ends -->