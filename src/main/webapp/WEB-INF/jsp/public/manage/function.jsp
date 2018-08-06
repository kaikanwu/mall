<%--
  Created by IntelliJ IDEA.
  User: k
  Date: 2018/8/6
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <script>

            //check the input is empty or not
            function checkEmpty(id, name){
                var value = $("#"+id).val();
                if(value.length==0){
                    alert(name+ "Can Not Be Empty");
                    $("#"+id)[0].focus();
                    return false;
                }
                return true;
            }


            //listen to the delete link
            $(function(){
                $("a").click(function(){
                    var deleteLink = $(this).attr("deleteLink");
                    console.log(deleteLink);
                    if("true" == deleteLink){
                        var confirmDelete = confirm("Are you sure to delete this category ?");
                        if(confirmDelete)
                            return true;
                        return false;

                    }
                });
            })


            //listen to the add form
            $(function(){

                $("#addForm").submit(function(){
                    if(!checkEmpty("name","CategoryName "))
                        return false;
                    if(!checkEmpty("categoryPic","CategoryPic "))
                        return false;
                    return true;
                });
            });

            //listen to the edit form
            $(function(){

                $("#editForm").submit(function(){
                    if(!checkEmpty("name","Category Name"))
                        return false;

                    return true;
                });
            });



        </script>


    </head>



    <body>

    </body>
</html>
