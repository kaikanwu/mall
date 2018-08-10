<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/9
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<html>
    <head>
        <title>Product Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/jquery/2.0.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">

        <script>
            <%--$(function(){--%>
                <%--var stock = ${product.stock};--%>
                <%--$(".custom-select").keyup(function(){--%>
                    <%--var number= $(".custom-select").val();--%>
                    <%--number = parseInt(number);--%>
                    <%--if(isNaN(number))--%>
                        <%--number= 1;--%>
                    <%--if(number<=0)--%>
                        <%--number = 1;--%>
                    <%--if(number>stock)--%>
                        <%--number = stock;--%>
                    <%--$(".custom-select").val(number);--%>
                <%--});--%>









                <%--$(".buyLink").click(function(){--%>
                    <%--$.get(--%>

                        <%--function(){--%>

                                <%--var num = $(".custom-select").val();--%>
                                <%--location.href= $(".buyLink").attr("href")+"&num="+num;--%>

                        <%--}--%>
                    <%--);--%>
                    <%--return false;--%>
                <%--});--%>


            <%--});--%>
        </script>
    </head>
    <body>

    <%@ include file="../public/view/nav.jsp"%>

    <br>
    <div class="imgAndInfo" >

        <div  align="center">
            <img src="img/firstImage/${product.firstProductImage.id}.jpg" class="bigImg">
            <div class="smallImageDiv">
                <c:forEach items="${product.detailProductImageList}" var="productImage">
                    <img src="img/detailImage/${productImage.id}.jpg" bigImageURL="img/productSingle/${productImage.id}.jpg" class="smallImage">
                </c:forEach>
            </div>
            <div class="img4load hidden" ></div>
        </div>

        <div class="infoInimgAndInfo" align="center">

            <div class="productTitle">
                ${product.name}
            </div>
            <div class="productSubTitle">
                ${product.subTitle}
            </div>
            <div class="productPrice">
                <div class="productPriceDiv">
                    <div class="promotionDiv">
                        <span class="promotionPriceYuan">$</span>
                        <span class="promotionPrice">
						<fmt:formatNumber type="number" value="${product.price}" minFractionDigits="2"/>
					    </span>
                    </div>
                </div>
            </div>

            <div id="selectForm" class="productNumber" style="width: 79px;">
                <span>Quantity</span>
                <select class="custom-select"   >
                    <option selected value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>

                <div>

                    <span>${product.stock} In Stock</span>

                </div>


                <c:if test="${!empty user}">

                    <div class="buyDiv">
                        <a class="buyLink" href="buyProduct?pid=${product.id}"><button class="btn btn-primary" type="button">Buy</button></a>

                        <a href="homepage" class="addCartLink"><button  class="btn btn-primary" type="button" data-toggle="modal" data-target="#exampleModalCenter"  ><i class="fas fa-shopping-cart"></i>Add to cart</button></a>

                    </div>
                </c:if>

                <c:if test="${empty user}">
                    <div class="buyDiv">
                        <a ><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#exampleModalCenter" >Buy</button></a>
                        <a  class="addCartLink"><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#exampleModalCenter"  ><i class="fas fa-shopping-cart"></i>Add to cart</button></a>
                    </div>
                </c:if>

            </div>

        <div style="clear:both"></div>

     </div>
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

                    <div class="modal-body" >

                        Please login first!
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <a href="loginPage"><button type="button" class="btn btn-primary">Go Login Page</button></a>
                    </div>
                </div>
            </div>
        </div>
`


    </body>
</html>
