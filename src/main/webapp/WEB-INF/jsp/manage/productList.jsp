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
        <title>Category List</title>
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


        <br>

        <div id="listTable">
            <table class="table table-striped table-bordered table-hover ">
                <thead >
                <tr id="tableContent">
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Subtitle</th>
                    <th>Picture</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Picture Management</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${productList}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.subTitle}</td>
                        <td>
                           
                            <c:if test="${!empty p.firstProductImage}">

                                <img width="40px" src="img/firstImage/${p.firstProductImage.id}.jpg">
                            </c:if>

                        </td>

                        <td>${p.price}</td>
                        <td>${p.stock}</td>
                        <td><a href="productImageList?pid=${p.id}"><i class="fas fa-cog"></i></a> </td>
                        <td><a href="editProduct?id=${p.id}"><i class="fas fa-edit"></i></a></td>
                        <td><a deleteLink="true" href="deleteProduct?id=${p.id}"><i class="fas fa-trash-alt"></i></a></td>


                        <%--<td><img height="40px" src="img/category/${c.id}.jpg"></td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>


        <br>
        <br>
        <br>

        <div class="panel panel-warning addDiv"  align="center" >
            <div class="panel-heading">Add A New Product</div>
            <div class="panel-body">
                <form method="post" id="addForm" action="addProduct" enctype="multipart/form-data">
                    <table id="addProductTable">
                        <tr>
                            <td>Product Name</td>
                            <td><input  id="name" name="name" type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Subtitle</td>
                            <td><input  id="subTitle" name="subTitle" type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input  id="price" name="price" type="text" class="form-control"></td>
                        </tr>

                        <tr>
                            <td>Stock</td>
                            <td><input  id="stock" name="stock" type="text" class="form-control"></td>
                        </tr>

                        <tr id="addProductButton">
                            <td colspan="2" align="center">
                                <input type="hidden" name="cid" value="${category.id}">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>


    </div>




    </body>
</html>
