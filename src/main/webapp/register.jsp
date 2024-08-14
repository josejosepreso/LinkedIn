<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="programLibraries.Configuration" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" media="all" />
    <link rel="stylesheet" href="assets/css/style.css">
    <title>Join LinkedIn</title>
  </head>
  <body>

    <nav class="navbar">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">
          <img src="assets/img/logo.png" alt="Logo" width="120" height="40" class="d-inline-block align-text-top">
        </a>
      </div>
    </nav>

    <h2 style="text-align:center">Sácale el máximo a tu vida profesional</h2>
    <div class="d-flex justify-content-center container mt-2">
      <div class="col-lg-4">
        <div class="p-4 shadow form-input mt-2">
        
          <label class="fw-bold small">Nombre</label>
          <input id="name" class="px-3 form-control border-2 mb-3" type="text">
          
          <label class="fw-bold small">Apellido</label>
          <input id="lastName" class="px-3 form-control border-2 mb-3" type="text">
          
          <label class="fw-bold small">Correo electronico</label>
          <input id="email" class="px-3 form-control border-2 mb-3" type="text">
          
          <label class="fw-bold small">Contrasena</label>
          <input id="password" class="px-3 form-control border-2 mb-3" type="password">
          
          <%
        	String query = "SELECT * FROM (SELECT  A.NOMBRE_LUGAR, B.NOMBRE_LUGAR AS LUGAR_SUPERIOR, C.NOMBRE_LUGAR AS LUGAR_SUPER_SUPERIOR FROM TBL_LUGARES A LEFT JOIN TBL_LUGARES B ON (A.CODIGO_LUGAR_SUPERIOR = B.CODIGO_LUGAR) LEFT JOIN TBL_LUGARES C ON (B.CODIGO_LUGAR_SUPERIOR = C.CODIGO_LUGAR)) WHERE LUGAR_SUPERIOR IS NOT NULL AND LUGAR_SUPER_SUPERIOR IS NOT NULL";
          
          	StringBuilder result = new StringBuilder("{");
          	
          	try {
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
          		
          		// PreparedStatement ps = connection.prepareStatement(query);
          		
          		Statement stmt = connection.createStatement(
       			    ResultSet.TYPE_SCROLL_INSENSITIVE,
       			    ResultSet.CONCUR_READ_ONLY
       			);
          		
          		ResultSet rs = stmt.executeQuery(query);
          		
          		int i = 0;
          		
          		while(rs.next()) {
          			
          			result.append(String.format("\"%s\"", ++i));
          			result.append(":");
          			result.append("{");
          			
          			result.append("\"NOMBRE_LUGAR\"");
          			result.append(":");
          			result.append(String.format("\"%s\"", rs.getString("NOMBRE_LUGAR")));
          			result.append(",");
          			
          			result.append("\"LUGAR_SUPERIOR\"");
          			result.append(":");
          			result.append(String.format("\"%s\"", rs.getString("LUGAR_SUPERIOR")));
          			result.append(",");
          			
          			result.append("\"LUGAR_SUPER_SUPERIOR\"");
          			result.append(":");
          			result.append(String.format("\"%s\"", rs.getString("LUGAR_SUPER_SUPERIOR")));
          			
          			result.append("}");
          			if(!rs.isLast()) result.append(",");
          		}
          		result.append("}");
          	} catch(Exception e) {
          		
          		System.out.println(e);
          	}
          %>
          
          <label class="fw-bold small">Lugar de nacimiento</label>
          <div class="mb-3 ">
			  <select id="pBirth" class="form-control border-2" aria-label="Default select example">
				  <option value="1" selected>Seleccione un lugar</option>
			  </select>
		  </div>
		  
		  <label class="fw-bold small">Lugar de residencia</label>
          <div class="mb-3 ">
			  <select id="residence" class="form-control border-2" aria-label="Default select example">
				  <option value="1" selected>Seleccione un lugar</option>
			  </select>
		  </div>
		  
		  <label class="fw-bold small">Numero de telefono</label>
          <input id="phone" class="px-3 form-control border-2 mb-3" type="text">
          
          <label class="fw-bold small">Fecha de nacimiento</label>
          <input id="dateB" class="px-3 form-control border-2 mb-3" type="date">
          
	  	  <p class="my-3 text-secondary" style="text-align:center;font-size:11px;">Al hacer clic en Aceptar, aceptas el Acuerdo de usuario, la Política de privacidad y la Política de cookies de LinkedIn.</p>
          <div class="mt-4">
            <a id="sendButton" type="button" class="form-control btn btn-primary rounded-pill px-2 fw-bold">Aceptar</a>
          </div>
          <div id="answer" class="mt-4 fw-bold"></div>
        </div>
      </div>
    </div>
    
	<script src="assets/js/Register.js"></script>
	<script>
		let places = '<%=result%>';
		
		// console.log(places);
		
		Register.loadPlaces(places);
	
		const name = document.querySelector("input#name");
		const lastName = document.querySelector("input#lastName");
		const email = document.querySelector("input#email");
		const password = document.querySelector("input#password");
		const pBirth = document.querySelector("select#pBirth");
		const residence = document.querySelector("select#residence");
		const phone = document.querySelector("input#phone");
		const dateB = document.querySelector("input#dateB");
		
		const sendButton = document.querySelector("a#sendButton");
		sendButton.addEventListener("click", Register.send.bind(null, name, lastName, email, password, pBirth, residence, phone, dateB));
	</script>
  </body>
</html>
