<%--
  Created by IntelliJ IDEA.
  User: 16327
  Date: 2021/7/30
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/index_like.css">
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
        $(function (){
            $("#btn").click(function (){
                $.ajax({
                    url:"testJson",
                    type:"POST",
                    dataType:"json",
                    success:function (result){
                        $("body").append("<table></table>");
                        $("table").append("<tr><th>ID</th><th>NAME</th><th>EMAIL</th><th>GENDER</th><th>DEPARTMENTNAME</th></tr>");
                        for (var i in result) {
                            var emp = result[i];
                            $("table").append("<tr><td>"+emp.eid+"</td><td>"+emp.ename+"</td><td>"+emp.email+"</td><td>"+emp.gender+"</td><td>"+emp.department.dname+"</td></tr>");
                        }
                    }
                })
            });
        });
    </script>
</head>
<body>

<a href="testJson">测试JSON</a>
<input type="button" id="btn" value="测试Ajax">

<a href="down">下载图片</a>

<form action="upload" method="post" enctype="multipart/form-data">
    头像：<input type="file" name="uploadFile"/>
    描述：<input type="text" name="desc"/>
    <input type="submit" value="上传">
</form>
</body>
</html>
