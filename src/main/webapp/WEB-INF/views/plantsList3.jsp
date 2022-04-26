<%--
  Created by IntelliJ IDEA.
  User: maja
  Date: 11.04.2022
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Baza roślin</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico">
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"
          type="text/css">
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
          type="text/css">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<c:url value="/css/styles.css"/>" rel="stylesheet">

    <style>.d-none {
        display: none;
    }

    .invalid-feedback {
        display: none;
    }

    .btn.disabled {
        pointer-events: none;
        opacity: 0.65;
    }</style>
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-light bg-light static-top">
    <div class="container">
        <a href="<c:url value="/plants"/>">PLANTS PROJECT</a>
        <a class="btn btn-primary" href="<c:url value="/login"/>">Log in</a>
    </div>
</nav>
<!-- Masthead-->
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Baza roślin</h1>
    <p class="mb-4">Tabela zawierająca wszystkie rośliny z mojej bazy




    </p>



    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <a href="<c:url value="/plants/add"/>">Dodaj nową roślinę</a>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
<%--                            <div class="dataTables_length" id="dataTable_length">--%>
<%--                                <label>Show <select name="dataTable_length" aria-controls="dataTable"--%>
<%--                                                    class="custom-select custom-select-sm form-control form-control-sm">--%>
<%--                                    <option value="10">10</option>--%>
<%--                                    <option value="25">25</option>--%>
<%--                                    <option value="50">50</option>--%>
<%--                                    <option value="100">100</option>--%>
<%--                                </select> entries</label>--%>
<%--                            </div>--%>
                        </div>
<form:form modelAttribute="plants" action= "/plants/searchValue" method="post">
                        <div class="col-sm-12 col-md-6">
                            <label>Wyszukaj roślinę<input id="name" type="name" name="name" class="form-control form-control-sm" ></label>
                            <input type="submit" class="btn btn-primary btn-lg" value="szukaj">
                        </div>
</form:form>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">

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
                                    <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                                        aria-label="Salary: activate to sort column ascending"
                                        style="width: 66.1094px;">Usuń/Edytuj
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${plants}" var="pla">
                                    <tr role="row" class="odd">
                                        <td class="sorting_1">${pla.name}</td>
                                        <td>${pla.category.name}</td>
                                        <td>${pla.size.name}</td>
                                        <td>${pla.place.name}</td>
                                        <td>${pla.soil.name}</td>
                                        <td><a href="<c:url value="/plants/delete/${pla.id}"/>">Usuń</a>/
                                            <a href="<c:url value="/plants/edit/${pla.id}"/>">Edytuj</a></td>


                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer-->
    <footer class="footer bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                    <ul class="list-inline mb-0">
                        <form action="<c:url value="/logout"/>" method="get">
                            <li class="list-inline-item">
                                <button class="btn btn-primary btn-lg " type="submit" value="Wyloguj">Wyloguj
                                </button>
                                <%--                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
                        </form>
                    </ul>

                </div>
                <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item">
                            <a href="<c:url value="https://www.youtube.com/channel/UCcDsU5ePpzDBdaxJADjL2jQ/"/>" target="_blank"><i
                                    class="bi-youtube fs-3"></i></a>
                        </li>
                        <li class="list-inline-item me-4">
                            <a href="<c:url value="https://www.facebook.com/groups/zmotykanaslonce"/>" target="_blank"><i
                                    class="bi-facebook fs-3"></i></a>
                        </li>
                        <li class="list-inline-item">
                            <a href="<c:url value="https://www.instagram.com/mortonhallgardens/"/>" target="_blank"><i
                                    class="bi-instagram fs-3"></i></a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</div>

</body>
</html>


