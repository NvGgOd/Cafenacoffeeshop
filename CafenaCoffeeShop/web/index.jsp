<%-- 
    Document   : index
    Created on : Nov 1, 2022, 11:13:35 PM
    Author     : Asus
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cafena Coffee Shop</title>

        <!-- Font Awesome CDN Link -->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- Libraries Stylesheet -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- Custom CSS File Link -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <%@include file="includes/Header.jsp" %>
        
        <%@include file="includes/Home.jsp" %>
        
        <%@include file="includes/WebChat.jsp" %>

        <%@include file="includes/About.jsp" %>

        <%@include file="includes/BestSeller.jsp" %>

        <%@include file="includes/Review.jsp" %>

        <%@include file="includes/Contact.jsp" %>

        <%@include file="includes/Blogs.jsp" %>

        <%@include file="includes/Footer.jsp" %>

        <!-- custom js file link  -->
        <script src="js/script.js"></script>

    </body>
</html>
