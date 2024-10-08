<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user") != null) response.sendRedirect("http://localhost:8080/LinkedIn/home.jsp");
%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" media="all" />
    <link rel="stylesheet" href="assets/css/style.css">
    <title>LinkedIn</title>
  </head>
  <body>
    <nav class="navbar ">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="assets/img/logo.png" width="120" height="40" class="d-inline-block">
            </a>
            <ul class="mt-0 navbar justify-content-end navbar-custom">
            <a href="register.jsp" style="color:black;text-decoration:none;" class="px-3 fw-bold">Unirse ahora</a>
            <a type="button" class="mx-3 px-3 fw-bold btn btn-outline-primary rounded-pill " style="text-decoration:none;" href="login.jsp">Iniciar sesion</a>
            </ul>

        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <div class=" col-lg-6 col-md-12 content-div">
                <h1 class="display-4" style="color:#c32100;">Bienvenido a tu comunidad profesional.</h1>
                <div style="width:25em;">
                  <a href="login.jsp" type="button" class="fw-bold form-control mt-3 btn btn-outline-dark rounded-pill button-custom">Iniciar sesion con email</a>
                </div>
            </div>
            <div class="col-lg-6 col-md-12">
                <img src="assets/img/home-banner.svg" width="700" height="560" class="homeImg" alt="home-banner">
            </div>
        </div>
    </div>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
