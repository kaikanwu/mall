<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/8
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<nav   class="navbar navbar-expand-lg navbar-light bg-light view-nav">
    <a class="navbar-brand" href="#">Mall</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="homepage">HOME<span class="sr-only">(current)</span></a>
            </li>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link" href="list">Backend </a>--%>
            <%--</li>--%>
        </ul>

        <div  class="justify-content-end">



            <c:if test="${!empty user}">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">${user.name}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Log Out</a>
                    </li>
                </ul>
            </c:if>

            <c:if test="${empty user}">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="loginPage">SIGN IN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registerPage">SIGN UP</a>
                    </li>
                </ul>
            </c:if>


        </div>
    </div>
</nav>


</body>
</html>
