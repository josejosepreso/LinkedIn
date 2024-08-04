<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" media="all" />
    <link rel="stylesheet" href="assets/css/style.css">
    <title>Join LinkedIn</title>
  </head>
  <body>

    <nav class="navbar sticky-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">
          <img src="assets/img/logo.png" alt="Logo" width="120" height="40" class="d-inline-block align-text-top">
        </a>
      </div>
    </nav>

    <h2 style="text-align:center">Make the most of your professional life</h2>
    <div class="d-flex justify-content-center container mt-5">
      <div class="col-lg-4">
        <div class="p-4 shadow form-input mt-4">
          <label class="fw-bold small">Email</label>
          <input class="px-3 form-control border-2" type="text">
          <label class="fw-bold small mt-3">Password</label>
          <input class="px-3 form-control border-2" type="password">
	  <p class="my-3 text-secondary" style="text-align:center;font-size:11px;">By clicking Agree & Join or Continue, you agree to the LinkedIn User Agreement, Privacy Policy, and Cookie Policy.</p>
          <div class="mt-4">
            <a href="home.jsp" type="button" class="form-control btn btn-primary rounded-pill px-2 fw-bold">Agree & Join</a>
          </div>
        </div>
      </div>
    </div>



  </body>
</html>
