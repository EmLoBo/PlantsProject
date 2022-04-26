<%--
  Created by IntelliJ IDEA.
  User: maja
  Date: 13.04.2022
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="css/styles.css" rel="stylesheet" type="text/css" media="screen" />
<html>
<head>
    <title>Edycja</title>
</head>
<body>
<form:form modelAttribute="plants" method="post" action="/plants/edit">

    <form:hidden path="id"/>
    Nazwa<form:input path="name"/></br>
    <form:errors path="name"/></br>
<%--    <form:hidden path="id"/>--%>


    Kategoria <form:select path="category" items="${categories}" itemLabel="name" itemValue="id"/></br>
    <%--    <form:errors path="category"/></br>--%>

    Rozmiar <form:select path="size" items="${sizes}" itemLabel="name" itemValue="id"/></br>
    <%--    <form:errors path="size"/></br>--%>

    Stanowisko<form:select path="place" items="${places}" itemLabel="name" itemValue="id"/></br>
    <%--    <form:errors path="place"/></br>--%>

    Gleba<form:select path="soil" items="${soiles}" itemLabel="name" itemValue="id"/></br>
    <%--    <form:errors path="soil"/></br>--%>

    <input type="submit" value="Zapisz zmiany">

</form:form>

</body>
</html>
