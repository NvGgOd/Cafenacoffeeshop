<%-- 
    Document   : Login
    Created on : Nov 3, 2022, 3:07:49 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/Login.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="js/Login.js"></script>
    </head>
    <body>
        <div class="container">
            <div>
                <span style="color: red; text-align: center; display: block;">${requestScope.error}</span>
            </div>
            <div class="frame">

                <div class="nav">
                    <ul class="links">
                        <li class="signin-active"><a class="btn">Login</a></li>
                        <li class="signup-inactive"><a class="btn">Register</a></li>
                    </ul>
                </div>

                <div>

                    <form class="form-signin" action="LoginServlet" method="POST" name="form">
                        <label for="username">Email</label>
                        <input class="form-styling" type="text" name="email" placeholder=""/>
                        <label for="password">Password</label>
                        <input class="form-styling" type="password" name="password" placeholder=""/>
                        <input type="checkbox" id="checkbox" name="rememberMe"/>
                        <label for="checkbox"><span class="ui"></span>Remember me</label>
                        <div class="btn-animate">
                            <button type="submit" class="btn-signin" name="action" value="user">Login with User</button>
                        </div>
                        <div class="btn-animate">
                            <button type="submit" class="btn-signin" name="action" value="staff">Login with Staff</button>
                        </div>
                        <div class="btn-animate">
                            <button type="submit" class="btn-signin" name="action" value="admin">Login with Admin</button>
                        </div>
                    </form>

                    <form class="form-signup" action="LoginServlet" method="POST" name="form">
                        <div class="form-group">
                            <div class="form-wrapper">
                                <label style="padding-bottom: 7px;" for="">First Name</label>
                                <input style="margin-bottom: 15px;" type="text" class="form-control" name="firstName">
                            </div>
                            <div class="form-wrapper">
                                <label style="padding-bottom: 7px;" for="">Last Name</label>
                                <input style="margin-bottom: 15px;" type="text" class="form-control" name="lastName">
                            </div>
                        </div>
                        <label style="padding-bottom: 7px;" for="email">Address</label>
                        <input style="margin-bottom: 15px;" class="form-styling" type="text" name="address" placeholder=""/>
                        <label style="padding-bottom: 7px;" for="email">Phone</label>
                        <input style="margin-bottom: 15px;" class="form-styling" type="text" name="phone" placeholder=""/>
                        <label style="padding-bottom: 7px;" for="email">Email</label>
                        <input style="margin-bottom: 15px;" class="form-styling" type="text" name="email" placeholder=""/>
                        <div class="form-group">
                            <div class="form-wrapper">
                                <label for="">Password</label>
                                <input type="password" class="form-control" name="password">
                            </div>
                            <div class="form-wrapper">
                                <label for="">Confirm</label>
                                <input type="password" class="form-control" name="confirmPassword">
                            </div>
                        </div>                    
                        <button style="margin-top: 5px; padding-top: 4px;" type="submit" ng-click="checked = !checked" class="btn-signup" name="action" value="register">Register Now</button>
                    </form>

                    <!--                    <div  class="success">
                                            <svg width="270" height="270" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 60 60" id="check" ng-class="checked ? 'checked' : ''">
                                            <path fill="#ffffff" d="M40.61,23.03L26.67,36.97L13.495,23.788c-1.146-1.147-1.359-2.936-0.504-4.314
                                                  c3.894-6.28,11.169-10.243,19.283-9.348c9.258,1.021,16.694,8.542,17.622,17.81c1.232,12.295-8.683,22.607-20.849,22.042
                                                  c-9.9-0.46-18.128-8.344-18.972-18.218c-0.292-3.416,0.276-6.673,1.51-9.578" />
                                            <div class="successtext">
                                                <p> Thanks for signing up! Check your email for confirmation.</p>
                                            </div>
                                        </div>-->

                </div>

                <div class="forgot">
                    <a href="#">Forgot your password?</a>
                </div>

                <!--                <div>
                                    <div class="cover-photo"></div>
                                    <div class="profile-photo"></div>
                                    <h1 class="welcome">Welcome, Chris</h1>
                                    <a class="btn-goback" value="Refresh" onClick="history.go()">Go back</a>
                                </div>-->
            </div>

            <a id="refresh" value="Refresh" onClick="history.go()">
                <svg class="refreshicon"   version="1.1" id="Capa_1"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     width="25px" height="25px" viewBox="0 0 322.447 322.447" style="enable-background:new 0 0 322.447 322.447;"
                     xml:space="preserve">
                <path  d="M321.832,230.327c-2.133-6.565-9.184-10.154-15.75-8.025l-16.254,5.281C299.785,206.991,305,184.347,305,161.224
                       c0-84.089-68.41-152.5-152.5-152.5C68.411,8.724,0,77.135,0,161.224s68.411,152.5,152.5,152.5c6.903,0,12.5-5.597,12.5-12.5
                       c0-6.902-5.597-12.5-12.5-12.5c-70.304,0-127.5-57.195-127.5-127.5c0-70.304,57.196-127.5,127.5-127.5
                       c70.305,0,127.5,57.196,127.5,127.5c0,19.372-4.371,38.337-12.723,55.568l-5.553-17.096c-2.133-6.564-9.186-10.156-15.75-8.025
                       c-6.566,2.134-10.16,9.186-8.027,15.751l14.74,45.368c1.715,5.283,6.615,8.642,11.885,8.642c1.279,0,2.582-0.198,3.865-0.614
                       l45.369-14.738C320.371,243.946,323.965,236.895,321.832,230.327z"/>
                </svg>
            </a>

        </div>
    </body>
</html>

