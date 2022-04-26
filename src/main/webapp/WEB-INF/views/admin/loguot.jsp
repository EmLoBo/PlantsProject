<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: maja
  Date: 07.04.2022
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Wyloguj</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<form action="<c:url value="/logout"/>" method="post">
  <input class="fa fa-id-badge" type="submit" value="Wyloguj">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</sec:authorize>
</body>
</html>