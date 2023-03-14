<%-- 
    Document   : BookTable
    Created on : Nov 23, 2022, 3:15:41 PM
    Author     : Asus
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Table Page</title>

        <!-- Font Awesome CDN Link -->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- Libraries Stylesheet -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- Custom CSS File Link -->
        <link rel="stylesheet" href="css/BookTable.css"/>
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

        <div>
            <div class="container-fluid my-5 ">

                <div class="container">

                    <div style="text-align: center;" class="section-title">
                        <h1 style="font-size: 50px;" class="text-primary text-uppercase" style="letter-spacing: 7px;">BOOK TABLE</h1>
                        <h1 style="font-size: 20px; color: black;" class="display-4">Please choose your table</h1>
                    </div>

                    <ul class="showcase">
                        <li class="col-md-4">
                            <div class="table"></div>
                            <small>Free</small>
                        </li>
                        <li class="col-md-4">
                            <div class="table selected"></div>
                            <small>Selected</small>
                        </li>
                        <li class="col-md-4">
                            <div class="table occupied"></div>
                            <small>Occupied 1</small>
                        </li>
                    </ul>

                    <form action="ContactServlet" method="POST" onsubmit="return check()" >

                        <input id="date" type="hidden" name="date" value='${requestScope.date}'/>
                        <input id="time" type="hidden" name="time" value='${requestScope.time}'/>
                        <input id="people" type="hidden" name="people" value='${requestScope.people}'/>
                        <input id="information" type="hidden" name="information" value=''/>

                        <div class="tableChosse">

                            <c:set var="tables" value="${requestScope.tables}"/>

                            <c:forEach var="i" items="${tables}">

                                <c:choose>
                                    <c:when test="${i.getStatus() == 1}">
                                        <button style="background: white;" disabled="true">${i.getTableName()}</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button id="${i.getTableID()}" type="button" onclick="chooseTable(this.id)" name="${i.getStatus()}" value="${i.getPeople()}">${i.getTableName()}</button>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>

                            <button id="action" style="background-color: brown; color: black; width: 20%; height: 55px;; font-size: 20px;" name="action" value="reserve">Reserve Table</button>

                        </div>

                    </form>

                </div>  

            </div>
        </div>

        <%@include file="includes/Footer.jsp" %>

        <!-- custom js file link  -->
        <script src="js/script.js"></script>
        <script src="js/BookTable.js"></script>

    </body>
</html>
