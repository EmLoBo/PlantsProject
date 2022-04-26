<%--
  Created by IntelliJ IDEA.
  User: maja
  Date: 20.04.2022
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Brak dostępu</title>
</head>
<a class="btn btn-primary" href="<c:url value="/login"/>">Log in</a></br>

<body>
<h3>Nie masz tu dostępu</h3>
<a href="<c:url value="/plants"/>">wróć na stronę główną</a></br>


</body>
</html>
