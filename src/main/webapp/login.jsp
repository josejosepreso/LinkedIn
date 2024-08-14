<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" media="all" />
    <link rel="stylesheet" href="assets/css/style.css">
  </head>
  <body>

    <nav class="navbar sticky-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">
          <img src="assets/img/logo.png" alt="Logo" width="120" height="40" class="d-inline-block align-text-top">
        </a>
      </div>
    </nav>


     <div class="d-flex justify-content-center container mt-5">
       <div class="col-lg-4">
         <div class="p-4 shadow form-input mt-4">
           <h2><b>Iniciar sesion</b></h2>
           <p class="small">Mantente actualizado en tu entorno profesional</p>
           <input id="email" class="p-3 form-control border-2 mt-4" type="text" placeholder="Correo electronico">
           <input id="password" class="p-3 form-control border-2 mt-3" type="password" placeholder="Contrasena">
           <div class="mt-4">
             <a id="sendButton" type="button" class="form-control btn btn-primary rounded-pill px-2 fw-bold">Iniciar sesion</a>
           </div>
           <div id="answer" class="mt-4 fw-bold"></div>
         </div>
       </div>
     </div>

  	<script src="assets/js/bootstrap.bundle.min.js"></script>
  	<script src="assets/js/Login.js"></script>
	<script>
		const email = document.querySelector("input#email");
		const password = document.querySelector("input#password");
		const sendButton = document.querySelector("a#sendButton");
		sendButton.addEventListener("click", Login.send.bind(null, email, password));
	</script>
  </body>
</html>
