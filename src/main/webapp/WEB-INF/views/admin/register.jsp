<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Rejestracja</title>
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

    </div>
</nav>
<!-- Masthead-->
<header class="masthead">
    <div class="container position-relative">

        <div class="row justify-content-center">

            <form:form modelAttribute="user" action= "/register" method="post">


                <label>Podaj imię</label></br>
                <form:input path="firstName" placeholder="First Name"/></br>
                <form:errors path="firstName"/></br>

                <label>Podaj nazwisko</label></br>
                <form:input  path="lastName" placeholder="Last Name"/></br>
                <form:errors path="lastName"/></br>


                <label>Podaj nazwę użytkownika</label></br>
                <form:input path="username" placeholder="userName"/></br>
                <form:errors path="username"/></br>


                <label>Podaj długość geograficzną miejsca gdzie masz ogród</label></br>
                <form:input  path="longitude" placeholder="Longitude"/></br>
                <form:errors path="longitude"/></br>


                <label>Podaj szerokość geograficzną miejsca gdzie masz ogród</label></br>
                <form:input  path="latitude" placeholder="Latitude"/></br>
                <form:errors path="latitude"/></br>


                <label>Podaj hasło</label></br>
                <form:input type="password" path="password" placeholder="Password"/></br>
                <form:errors path="password"/></br>



                <%--            <label>Powtórz hasło</label>--%>
                <%--            <form:input type="password" path="repeatPassword" placeholder="Repeat Password">--%>

                <button class="btn btn-primary btn-lg " type="submit" value="Załóż konto">Załóż konto
                </button></br>
                <hr>


            </form:form>

        </div>
    </div>
</header>
<!-- Icons Grid-->



<!-- Footer-->
<footer class="footer bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                <ul class="list-inline mb-0">

                </ul>

            </div>
            <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                <ul class="list-inline mb-0">
                    <li class="list-inline-item">
                        <a href="<c:url value="https://www.youtube.com/channel/UCcDsU5ePpzDBdaxJADjL2jQ/"/>"><i
                                class="bi-youtube fs-3"></i></a>
                    </li>
                    <li class="list-inline-item me-4">
                        <a href="<c:url value="https://www.facebook.com/groups/zmotykanaslonce"/>"><i
                                class="bi-facebook fs-3"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a href="<c:url value="https://www.instagram.com/mortonhallgardens/"/>"><i
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

<%--<script src="js/app.js"></script>--%>


</body>
</html>



