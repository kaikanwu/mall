<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/7
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
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

    <div >

    <div class="panel panel-warning editDiv" align="center">
        <div class="panel-heading">Edit Product</div>
        <div class="panel-body">
            <form method="post" id="updateProductForm" action="updateProduct">
                <table class="editTable">
                    <tr>
                        <td>Product Name</td>
                        <td><input  id="name" name="name"  value="${product.name}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Subtitle</td>
                        <td><input  id="subTitle" name="subTitle"  value="${product.subTitle}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input  id="price" name="price"  value="${product.price}" type="text" class="form-control"></td>
                    </tr>

                    <tr>
                        <td>Stock</td>
                        <td><input  id="stock" name="stock" value="${product.stock}" type="text" class="form-control"></td>
                    </tr>

                    <tr id="updateProductButton">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${product.id}">
                            <input type="hidden" name="cid" value="${product.category.id}">
                            <button type="submit" class="btn btn-success">Update</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>

</body>
</html>
