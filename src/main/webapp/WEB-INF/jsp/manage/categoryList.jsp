<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/6
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <title>Title</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

    </head>
    <body>
    <div >

        <div id="nav">
            <nav class="navbar navbar-light"  >
                <a class="navbar-brand" href="#">Backend</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="#">Category</a>
                        <a class="nav-item nav-link" href="#">User</a>
                        <a class="nav-item nav-link disabled" href="#">Order</a>
                    </div>
                </div>
            </nav>
        </div>
        <br>





        <div id="listTable">
            <table class="table table-striped table-bordered table-hover ">
                <thead >
                <tr id="tableContent">
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Picture</th>
                    <th>Product Management</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${categoryList}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.name}</td>
                        <td><img height="40px" src="img/category/${c.id}.jpg"></td>
                        <td><a href="admin_product_list?cid=${c.id}"><i class="fas fa-cog"></i></a></td>
                        <td><a href="admin_category_edit?id=${c.id}"><i class="fas fa-edit"></i></a></td>
                        <td><a deleteLink="true" href="admin_category_delete?id=${c.id}"><i class="fas fa-trash-alt"></i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>


        <br>
        <br>
        <br>
        <div class="panel panel-warning addDiv"  align="center" >
            <div class="panel-heading">Add A New Category</div>
            <div class="panel-body">
                <form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
                    <table id="addCategoryTable">
                        <tr>
                            <td>Category Name</td>
                            <td><input  id="name" name="name" type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Category Picture</td>
                            <td><input id="categoryPic" accept="image/*" type="file" name="image" /></td>
                        </tr>
                        <tr id="addCategoryButton">
                            <td colspan="2" align="center">
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
