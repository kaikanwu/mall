<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/7
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Product Image List</title>
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

    <div>

        <table id="addPictureTable" align="center">
            <tr>
                <td>
                    <div>


                        <div class="panel panel-warning addDiv">
                            <div class="panel-heading">Add A New First Picture</div>
                            <div class="panel-body">
                                <form method="post" id="addFirstPicForm" action="addProductImage" enctype="multipart/form-data">
                                    <table id="addPicTable">
                                        <tr>
                                            <td>Upload your picture</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input id="addPicInput" accept="image/*" type="file" name="image" />
                                            </td>
                                        </tr>
                                        <tr id="addPictureButton">
                                            <td  align="center">
                                                <input type="hidden" name="type" value="firstImage">
                                                <input type="hidden" name="pid" value="${product.id}">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered table-hover ">
                            <thead >
                            <tr id="tableContent">
                                <th>ID</th>
                                <th>First Picture</th>
                                <th>Delete</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${firstImageList}" var="f">
                                <tr>
                                    <td>${f.id}</td>
                                    <td>
                                        <a title="check the original pic" href="img/firstImage/${f.id}.jpg"><img height="50px" src="img/firstImage/${f.id}.jpg"></a>
                                    </td>
                                    <td>
                                        <a deleteLink="true" href="deleteProductImage?id=${f.id}"><i class="fas fa-trash-alt"></i></a>
                                    </td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </td>


                <td>
                    <div>
                        <div class="panel panel-warning addDiv">
                            <div class="panel-heading">Add A New Detail Picture</div>
                            <div class="panel-body">
                                <form method="post" id="addFirstPicForm2" action="addProductImage" enctype="multipart/form-data">
                                    <table id="addPicTable2">
                                        <tr>
                                            <td>Upload your picture</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input id="addPicInput2" accept="image/*" type="file" name="image" />
                                            </td>
                                        </tr>
                                        <tr id="addPictureButton2">
                                            <td  align="center">
                                                <input type="hidden" name="type" value="detailImage">
                                                <input type="hidden" name="pid" value="${product.id}">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered table-hover ">
                            <thead >
                            <tr id="tableContent2">
                                <th>ID</th>
                                <th>Detail Picture</th>
                                <th>Delete</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${detailImageList}" var="d">
                                <tr>
                                    <td>${d.id}</td>
                                    <td>
                                        <a title="check the original pic" href="img/detailImage/${d.id}.jpg"><img height="50px" src="img/detailImage/${d.id}.jpg"></a>
                                    </td>
                                    <td>
                                        <a deleteLink="true" href="deleteProductImage?id=${d.id}"><i class="fas fa-trash-alt"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>

        </table>

    </div>




</body>
</html>
