<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/8
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Orders</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

    <%@ include file="../public/manage/function.jsp"%>
    <%@ include file="../public/manage/nav.jsp"%>
</head>
<body>
    <div id="listTable">
        <table class="table table-striped table-bordered table-hover ">
            <thead >
            <tr id="tableContent">
                <th>ID</th>
                <th>Total Price</th>
                <th>Items Number</th>
                <th>Buyers</th>
                <th>Created Time</th>
                <th>Paid Time</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ordersList}" var="o">
                <tr>
                    <td>${o.id}</td>
                    <td>${o.totalPrices}</td>
                    <td>${o.itemNumber}</td>
                    <td>
                        ${o.user.name}
                    </td>

                    <td>${o.createDate}</td>
                    <td>${o.payDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


</body>
</html>
