<%--
  Created by IntelliJ IDEA.
  User: maja
  Date: 11.04.2022
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>PlantsProject</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico">
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css">
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
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
    }</style></head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-light bg-light static-top">
    <div class="container">
        <a href="<c:url value="/plants"/>">PLANTS PROJECT</a>
        <a class="btn btn-primary" href="<c:url value="/login"/>">Log in</a>
    </div>
</nav>
<!-- Masthead-->
<%--<header class="masthead">--%>
<%--    <div class="container position-relative">--%>
<%--        <div class="row justify-content-center">--%>
<%--            <div class="col-xl-6">--%>
<%--                <div class="text-center text-white">--%>
<%--                    <!-- Page heading-->--%>
<%--                    <h1 class="mb-5">Tu wygenerowane automatycznie info pogodowe</h1>--%>
<%--                    <!-- Signup form-->--%>
<%--                    <!-- * * * * * * * * * * * * * * *-->--%>
<%--                    <!-- * * SB Forms Contact Form * *-->--%>
<%--                    <!-- * * * * * * * * * * * * * * *-->--%>
<%--                    <!-- This form is pre-integrated with SB Forms.-->--%>
<%--                    <!-- To make this form functional, sign up at-->--%>
<%--                    <!-- https://startbootstrap.com/solution/contact-forms-->--%>
<%--                    <!-- to get an API token!-->--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>
<!-- Icons Grid-->


<section class="showcase">
    <div class="container-fluid p-0">

        <h2 class="mb-5 text-center"><a href="<c:url value="/plants/crop"/>">Poprzednia kwadra</a>    &nbsp;&nbsp;&nbsp;Kwadra Li??cia &nbsp;&nbsp;&nbsp;  <a href="<c:url value="/plants/fruit"/>">Kolejna kwadra</a></h2>

        <div class="row g-0">

            <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('/img/pruning+shears.jpg')"></div>
            <div class="col-lg-6 order-lg-1 my-auto showcase-text">

                <h2> Co mo??esz robi?? w tym czasie </h2>

                <p class="lead mb-0">Najlepszy czas do siania i sadzenia ro??lin plonuj??cych nad ziemi?? o mi??sistych li??ciach (sa??ata, rukola, pietruszka itp).
                Jest to tak??e dogodny czas do uprawy ro??lin o ozdobnych li??ciach.
                W tym czasie mo??na r??wnie?? ci???? traw??, je??li pragniemy j?? wzmocni??.. Ci??ta w kwadrze korzenia i uprawy wolniej odrasta.</p>
            </div>
        </div>
        <div class="row g-0">
            <div class="col-lg-6 text-white showcase-img" style="background-image: url('/img/Liliowiec-Open-My-Eyes-4694.jpg')"></div>
            <div class="col-lg-6 my-auto showcase-text">
                <h2>Czego unika??</h2>
                <p class="lead mb-0">Unikaj ci??cia drzew i krzew??w</p>
            </div>
        </div>
    </div>
    <div class="row g-0">

        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('/img/pruning+shears.jpg')"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">

            <h2> Sprawd?? jakie prace mo??esz wykona?? w dogodnym dla Ciebie terminie</h2>

            <p class="lead mb-0">
            <form method="get" action="/plants/userCalendar">
                <input id="userDate" type="date" name="userDate">
                <input type="submit" value="wybieram dat??">
            </form>
            </p>
        </div>
    </div>
</section>
<section class="features-icons bg-light text-center">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex"><i class="bi-tree m-auto text-primary"></i></div>
                    <h3>Baza ro??lin</h3>
                    <div class="card-header py-3">
                        <a href="<c:url value="/plants/list"/>">Subiektywna baza ro??lin ogrodowych</a>
                        <%--            <a href="<c:url value="/plants/add"/>">dodaj nowy</a>--%>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex"><i class="bi-calendar m-auto text-primary"></i></div>
                    <h3>EkoKalendarz</h3>
                    <a href="<c:url value="/plants/calendar"/>">Zaplanuj prace ogrodowe w zgodzie z natur??</a>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="features-icons-item mx-auto mb-0 mb-lg-3">
                    <div class="features-icons-icon d-flex"><i class="bi-flower1 m-auto text-primary"></i></div>
                    <h3>Ro??liny na twoj?? rabat??</h3>
                    <a href="<c:url value="/plants/getSpecification"/>">Dobierz ro??liny na swoj?? rabat??</a>
                </div>
            </div>
        </div>
    </div>
</section>




<section class="call-to-action text-white text-center" id="signup">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-6">

                <!-- Signup form-->
                <!-- * * * * * * * * * * * * * * *-->
                <!-- * * SB Forms Contact Form * *-->
                <!-- * * * * * * * * * * * * * * *-->
                <!-- This form is pre-integrated with SB Forms.-->
                <!-- To make this form functional, sign up at-->
                <!-- https://startbootstrap.com/solution/contact-forms-->
                <!-- to get an API token!-->
                <form class="form-subscribe" id="contactFormFooter" data-sb-form-api-token="API_TOKEN">
                    <!-- Email address input-->

                    <!-- Submit success message-->
                    <!---->
                    <!-- This is what your users will see when the form-->
                    <!-- has successfully submitted-->

                    <!-- Submit error message-->
                    <!---->
                    <!-- This is what your users will see when there is-->
                    <!-- an error submitting the form-->
                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                </form>
            </div>
        </div>
    </div>
</section>
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


</body></html>

