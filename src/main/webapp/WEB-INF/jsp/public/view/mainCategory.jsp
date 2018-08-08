<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/8
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<html>
<head>

</head>
<body>





<div class="homepageCategoryProducts">
    <c:forEach items="${categoryList}" var="c" varStatus="stc" begin="0" end="5">

        <div class="eachHomepageCategoryProducts">
            <div class="left-mark"></div>
            <span class="categoryTitle">${c.name}</span>
            <br>




            <c:forEach items="${c.products}" var="p" varStatus="st">
                <c:if test="${st.count<=3}">
                    <div class="productItem" >
                        <a href="foreproduct?pid=${p.id}"><img width="100px" src="img/firstImage/${p.firstProductImage.id}.jpg"></a>
                        <a class="productItemDescLink" href="foreproduct?pid=${p.id}">
                                    <span class="productItemDesc">
                                            ${p.name}
                                    </span>
                        </a>
                        <span class="productPrice">
                                    <fmt:formatNumber type="number" value="${p.price}" minFractionDigits="2"/>
                            </span>
                    </div>
                </c:if>
            </c:forEach>





            <div style="clear:both"></div>
        </div>

    </c:forEach>

</div>

<br>
<br>




</body>
</html>
