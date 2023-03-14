<%-- 
    Document   : ErrorPage
    Created on : Nov 4, 2022, 9:48:10 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>${requestScope.error}</h1>
    </body>
</html>
