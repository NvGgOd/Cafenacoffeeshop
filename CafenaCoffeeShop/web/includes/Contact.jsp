<%-- 
    Document   : Contact
    Created on : Nov 5, 2022, 6:24:42 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- contact section starts  -->
<section class="contact" id="contact">

    <h1 class="heading"><span>Contact </span>Us</h1>

    <div class="row">

        <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8638222963314!2d108.25836811442208!3d15.968486346372424!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCAoRlBUIHVuaXZlcnNpdHkp!5e0!3m2!1sen!2s!4v1667646755235!5m2!1sen!2s" allowfullscreen="" loading="lazy"></iframe>

        <form action="ContactServlet" method="POST">

            <h3>Get in touch</h3>

            <c:choose>
                <c:when test="${not empty account}">

                    <div class="inputBox">
                        <span class="fas fa-calendar"></span>
                        <input type="date" name="date">
                    </div>

                    <div class="inputBox">
                        <span class="fas fa-clock"></span>
                        <select name="time">
                            <option value="1">7:00 - 11:00</option>
                            <option value="2">13:00 - 17:00</option>
                            <option value="3">17:30 - 21:30</option>
                        </select>
                    </div>

                    <div style="color: white;" class="inputBox">
                        <span class="fas fa-users"></span>
                        <input type="number" placeholder="Number of people" min="1" name="people">
                    </div>

                    <button style="margin: 0 10px;" class="btn" name="action" value="book">Book Table</button>

                </c:when>
                <c:otherwise>

                    <div class="inputBox">
                        <span class="fas fa-user"></span>
                        <input type="text" placeholder="Name">
                    </div>

                    <div class="inputBox">
                        <span class="fas fa-envelope"></span>
                        <input type="text" placeholder="Email">
                    </div>

                    <div class="inputBox">
                        <span class="fas fa-phone"></span>
                        <input type="text" placeholder="Number">
                    </div>

                    <button style="margin: 0 10px;" class="btn" name="action" value="contact">Contact Now</button>

                </c:otherwise>
            </c:choose>

        </form>

    </div>

</section>
<!-- contact section ends -->