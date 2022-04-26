<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: maja
  Date: 26.04.2022
  Time: 08:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<br>
<head>
    <title>Title</title>
</head>
<a href="<c:url value="/plants"/>">Wróć na stronę główną</a></br>
<a href="<c:url value="/plants/list"/>">Wróć do bazy roślin</a>
<body>

<table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0"
       role="grid" aria-describedby="dataTable_info" style="width: 100%;">
    <thead>
    <tr role="row">
        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1"
            colspan="1" aria-sort="ascending"
            aria-label="Name: activate to sort column descending" style="width: 64.75px;">
            Nazwa
        </th>
        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
            aria-label="Position: activate to sort column ascending"
            style="width: 80.6094px;">Kategoria
        </th>
        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
            aria-label="Office: activate to sort column ascending"
            style="width: 55.7969px;">Rozmiar
        </th>
        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
            aria-label="Age: activate to sort column ascending" style="width: 30.1719px;">
            Stanowisko
        </th>
        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
            aria-label="Start date: activate to sort column ascending"
            style="width: 67.8594px;">Gleba
        </th>
    </tr>
    </thead>
    <tbody>

        <tr>
            <th>${uPlants.name}</th>
            <th>${uPlants.category.name}</th>
            <th>${uPlants.size.name}</th>
            <th>${uPlants.place.name}</th>
            <th>${uPlants.soil.name}</th>

        </tr>


    </tbody>
</table>

</body>
</html>
