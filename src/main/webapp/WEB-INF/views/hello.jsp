<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: maja
  Date: 07.04.2022
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1><spring:message code="app.title"/></h1>
<form method="get" >
<h1 id="temp">jjj</h1>
<h2 id="wind">ddd</h2>
<p id="description">jjj</p>
<img id="icon" style="vertical-align: middle" width="70" height="150">

</form>
<ul id="weather"></ul>
<script src="weather/weather.js"></script>
</body>
</html>
