<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16327
  Date: 2021/7/29
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="addEmployee" method="post">
    NAME:
    <input type="text" name="ename"> <br>

    EMAIL:
    <input type="text" name="email"> <br>

    GENDER:
    <input type="radio" name="gender" value="1">男
    <input type="radio" name="gender" value="0"> 女 <br>

    DEPARTMENTNAME:
    <select name="department.did" id="deptName">
        <option>--SELECTED--</option>
        <c:forEach items="${allDept}" var="dept">
            <option value="${dept.did}">${dept.dname}</option>
        </c:forEach>
    </select>
    <br>
    <input type="submit" value="ADDEMPLOYEE">
</form>
</body>
</html>
