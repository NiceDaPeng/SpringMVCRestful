<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16327
  Date: 2021/7/29
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>修改员工信息</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<form action="${pageContext.servletContext.contextPath}/emp" method="post">
    <input type="hidden" name="eid" value="${emp.eid}">
    <input type="hidden" name="_method" value="put"/>
    <table class="table table-striped">
        <tr>
            <th colspan="3">修改员工信息</th>
        </tr>

        <tr>
            <td>ENAME</td>
            <td><input type="text" name="ename" placeholder="ENAME" value="${emp.ename}"></td>
        </tr>

        <tr>
            <td>EMAIL</td>
            <td><input type="text" name="email" placeholder="EMAIL" value="${emp.email}"></td>
        </tr>

        <tr>
            <td>GENDER</td>
            <td>
                <input type="radio" name="gender" value="1" ${emp.gender == 1?'checked':''}>男
                <input type="radio" name="gender" value="0" ${emp.gender == 0?'checked':''}>女
            </td>
        </tr>

        <tr>
            <td>DEPARTMENT</td>
            <td>
                <select name="department.did">
                    <c:forEach items="${depts}" var="dept">
                        <option value="${dept.did}" ${emp.department.did == dept.did?'selected':''}>${dept.dname}</option>
                    </c:forEach>

                </select>
            </td>
        </tr>

        <tr>
            <td colspan="3">
                <input type="submit" value="UPDATE" class="btn btn-success">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
