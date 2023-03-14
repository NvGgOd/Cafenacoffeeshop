<%-- 
    Document   : WebChat
    Created on : Nov 26, 2022, 11:02:44 PM
    Author     : Asus
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- webchat section starts -->

<c:if test="${not empty account}">
    <div class="boxchat">
        <h2 style="margin: 0; height: 40px; color: whitesmoke; text-align: center; padding-top: 5px;" id="open">Contact with Staff</h2>
        <div style="font-size: 15px;" id="output" class="content">
            Start chatting...
        </div>
        <div style="margin: 0; height: 40px; font-size: 17px; text-align: right;">

            <c:set var="access" value="${account.getAccess()}"/>
            <c:choose>
                <c:when test="${access == 'staff'}"> 
                    <input id="email" type="hidden" name="email" value="Staff">
                </c:when>
                <c:otherwise>
                    <input id="email" type="hidden" name="email" value="${account.getEmail()}">
                </c:otherwise>
            </c:choose>

            <input id="message" stype="text" name="message" placeholder="..."/>
            <button style="margin: 5px 10px; background: gray; font-size: 14px;" onclick="send()"><i class="fas fa-arrow-right"></i></button>
        </div>
    </div>
</c:if>

<script>
    let boxchat = document.querySelector('.boxchat');

    document.querySelector('#open').onclick = () => {
        boxchat.classList.toggle('active');
    };
</script>

<script src="js/WebSocket.js"></script>

<!-- webchat section ends -->
