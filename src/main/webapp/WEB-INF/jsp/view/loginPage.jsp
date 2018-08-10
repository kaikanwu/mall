<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/9
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">

    <script>
        $(function(){


            <c:if test="${!empty message}">
            alert("${message}");

            </c:if>

        })

    </script>
</head>
<body>






    <nav  class="navbar navbar-expand-lg navbar-light bg-light view-nav">
        <a class="navbar-brand" href="homepage">Mall</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item  active">
                    <a class="nav-link" href="loginPage">Sign In </a><span class="sr-only">(current)</span>
                </li>
            </ul>

        </div>
    </nav>




    <form method="post" action="loginCheck">

        <table align="center">
            <tr><td>Username</td></tr>
            <tr>

                <td><input id="username" name="username"  class="form-control" placeholder=""></td>
            </tr>
            <tr><td>Password</td></tr>
            <tr>
                <td><input type="password" id="password" name="password"   class="form-control" placeholder="" ></td>
            </tr>
            <tr>
                <td>
                    <a href="registerFinishPage.jsp"> <button type="submit" class="btn btn-primary">Submit</button></a>
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
