<%--
  Created by IntelliJ IDEA.
  User: 16327
  Date: 2021/7/29
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>

    <![endif]-->
<%--    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery-1.8.2.min.js"></script>--%>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="application/javascript">
        $(function (){
            $(".delete").click(function (){
                $("form").attr("action",this.href).submit();
                return false;
            })
        });
    </script>
</head>
<body>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">员工详情</div>

    <table class="table table-hover">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>GENDER</th>
            <th>DEPARTMENTNAME</th>
            <th>OPTIONS <a href="emp">(ADD)</a></th>
        </tr>

        <c:forEach items="${emps}" var="emp">
            <tr>
                <td>${emp.eid}</td>
                <td>${ emp.ename }</td>
                <td>${ emp.email }</td>
                <td>${ emp.gender ==1?'男':'女' }</td>
                <td>${ emp.department.dname }</td>
                <td>
                    <a href="emp/${emp.eid}">UPDATE</a>
                    <a class="delete" href="emp/${emp.eid}">DELETE</a>
                </td>
            </tr>

        </c:forEach>

    </table>

    <form method="post">
        <input type="hidden" name="_method" value="DELETE">
    </form>
</div>
</body>
</html>
