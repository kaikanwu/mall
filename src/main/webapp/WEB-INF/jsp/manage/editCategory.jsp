<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/6
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
    <head>
        <title>Edit Category</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/jquery/2.0.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">


        <%@include file="../public/manage/function.jsp"%>
        <%@include file="../public/manage/nav.jsp"%>
    </head>
    <body>
        <div class="workingArea">



            <div class="panel panel-warning addDiv"  align="center" >
                <div class="panel-heading">Edit Category</div>
                <div class="panel-body">
                    <form method="post" id="editForm" action="updateCategory" enctype="multipart/form-data">
                        <table id="editCategoryTable">
                            <tr>
                                <td>Category Name</td>
                                <td><input  id="name" name="name" value="${category.name}" type="text" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>Category Picture</td>
                                <td><input id="categoryPic" accept="image/*" type="file" name="image" /></td>
                            </tr>
                            <tr id="addCategoryButton">
                                <td colspan="2" align="center">
                                    <input type="hidden" name="id" value="${category.id}">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>



        </div>

    </body>
</html>
