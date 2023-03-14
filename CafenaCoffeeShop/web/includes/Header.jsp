    <%-- 
    Document   : Header
    Created on : Nov 5, 2022, 6:17:07 PM
    Author     : Asus
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header section starts -->
<header class="header">

    <a href="index.jsp#" class="logo">
        <img src="images/logo.png" alt="Cafena Logo">
    </a>

    <nav class="navbar">
        <a style="font-size: 18px;" href="index.jsp#home">Home</a>
        <a style="font-size: 18px;" href="index.jsp#about">About</a>
        <a style="font-size: 18px;" href="index.jsp#menu">Menu</a>
        <!-- <a style="font-size: 18px;" href="index.jsp#products">Products</a> -->
        <a style="font-size: 18px;" href="index.jsp#review">Review</a>
        <a style="font-size: 18px;" href="index.jsp#contact">Contact</a>
        <a style="font-size: 18px;" href="index.jsp#blogs">Blogs</a>
    </nav>

    <c:set var="account" value="${sessionScope.account}"/>
    <c:set var="email" value="${account.getEmail()}"/>
    <jsp:useBean id="drinkModel" class="Model.DrinkModel"/>
    <jsp:useBean id="cartModel" class="Model.CartModel"/>

    <div class="icons">

        <div class="fas fa-search" id="search-btn"></div>

        <c:if test="${not empty account}">
            <div class="fas fa-shopping-cart" id="cart-btn"></div>
        </c:if>

        <div class="fas fa-bars" id="menu-btn"></div>

        <c:choose>
            <c:when test="${not empty account}">
                <div class="fas fa-user-circle dropdown"> 
                    <span>${account.getFirstName()}</span>
                    <div class="dropdown-content">
                        <a style="font-size: 20px;" href="Information.jsp">Information</a>
                        <a style="font-size: 20px;" href="#">Booking Table History</a>
                        <a style="font-size: 20px;" href="LoginServlet?action=logout">Logout</a>
                    </div>
                </div>
            </c:when>    
            <c:otherwise>
                <a href="Login.jsp"><div class="fas fa-arrow-right"> Login</div></a>
            </c:otherwise>
        </c:choose>

    </div>

    <div class="search-form">
        <input style="border-right: solid 1px;" type="text" id="search-box" placeholder="Search drink in here">
        <button style="background: white;" onclick="search()"><a href="#" id="searchLink"><i class="fas fa-search"></i></a></button>
    </div>

    <c:if test="${not empty account}">

        <div class="cart-items-container">

            <c:set var="cartsByEmail" value="${cartModel.getCartsByEmail(email)}"/>
            <c:forEach var="cart" items="${cartsByEmail}">
                <c:set var="drinkID" value="${cart.getDrinkID()}"/>
                <c:set var="drink" value="${drinkModel.getDrinkByID(drinkID)}"/>
                <div class="cart-item">
                    <span class="fas fa-times"></span>
                    <img src="${drink.getImage()}" alt="">
                    <div class="content">
                        <h3>${drink.getDrinkName()}</h3> 
                        <h4>x ${cart.getAmount()}</h4>
                        <div class="price">$${drink.getPrice() * cart.getAmount()}</div>
                    </div>
                </div>
            </c:forEach>
            <a href="Cart.jsp" class="btn">Show Cart Details</a>
        </div>

    </c:if>

    <script>
        function search() {
            var key = document.getElementById("search-box").value;
            document.getElementById("searchLink").href = "MenuServlet?key=" + key;
        }
    </script>

</header>
<!-- header section ends -->
