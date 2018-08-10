<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/10
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<html>
<head>
    <title>Settlement</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
          <script >
              $("#payButton").click(function(){

                  alert("Are you sure to pay for this product?");

              });

          </script>

</head>
<body>
<%@ include file="../public/view/nav.jsp"%>
<div>
    <table class="table table-striped" align="center" style="width:800px;">

        <thead>
        <tr>
            <th>Order Item</th>
            <th>Price</th>
            <th>Number</th>
            <th>Total Price</th>
            <th>Pay</th>
        </tr>
        </thead>


        <tbody>
        <c:forEach items="${orderItemList}" var="oi" varStatus="st" >
            <tr class="orderItemTR">
                    <%--<td class="orderItemFirstTD"><img class="orderItemImg" src="img/middleImage/${oi.product.firstProductImage.id}.jpg"></td>--%>
                <td>${oi.product.name}</td>
                <td>${oi.product.price}</td>
                <td>
                    <span class="orderItemProductNumber">${oi.number}</span>
                </td>
                <td>

                    <span class="orderItemProductPrice">$<fmt:formatNumber type="number" value="${oi.product.price}" minFractionDigits="2"/></span>
                </td>
                <td><button id="payButton" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Pay</button></td>


            </tr>
        </c:forEach>

        </tbody>


    </table>
</div>


<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body" style="font-size: 25px" >

                You have pay it successfully!
            </div>


            <div class="modal-footer">
                <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                <a href="homepage"><button type="button" class="btn btn-primary">Go Home Page</button></a>
            </div>
        </div>
    </div>
</div>
`








</body>
</html>
