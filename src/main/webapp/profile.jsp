<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="programLibraries.User" %>
<%
	if(session.getAttribute("user") == null) response.sendRedirect("http://localhost:8080/LinkedIn/index.jsp");
%>
<%@ page import="programLibraries.Configuration" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
  </head>
  <body id="profile">

    <nav class="px-5 navbar navbar-expand-lg navbar-white bg-white">
          <svg class="me-2" stroke="currentColor" fill="#0A66C2" stroke-width="0" viewBox="0 0 448 512" height="2.5em" width="2.5em" xmlns="http://www.w3.org/2000/svg"><path d="M416 32H31.9C14.3 32 0 46.5 0 64.3v383.4C0 465.5 14.3 480 31.9 480H416c17.6 0 32-14.5 32-32.3V64.3c0-17.8-14.4-32.3-32-32.3zM135.4 416H69V202.2h66.5V416zm-33.2-243c-21.3 0-38.5-17.3-38.5-38.5S80.9 96 102.2 96c21.2 0 38.5 17.3 38.5 38.5 0 21.3-17.2 38.5-38.5 38.5zm282.1 243h-66.4V312c0-24.8-.5-56.7-34.5-56.7-34.6 0-39.9 27-39.9 54.9V416h-66.4V202.2h63.7v29.2h.9c8.9-16.8 30.6-34.5 62.9-34.5 67.2 0 79.7 44.3 79.7 101.9V416z"></path></svg>

        <div class="d-flex justify-content-end align-items-center collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="d-flex justify-content-end align-items-center m-0 list-unstyled">

            <li class="nav-li">
              <a class="d-flex align-items-center flex-column home-link" href="home.jsp">
                <svg class="nav-svg" id="home-icon" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path d="M946.5 505L534.6 93.4a31.93 31.93 0 0 0-45.2 0L77.5 505c-12 12-18.8 28.3-18.8 45.3 0 35.3 28.7 64 64 64h43.4V908c0 17.7 14.3 32 32 32H448V716h112v224h265.9c17.7 0 32-14.3 32-32V614.3h43.4c17 0 33.3-6.7 45.3-18.8 24.9-25 24.9-65.5-.1-90.5z"></path></svg>
                <p class="small m-0">Inicio</p>
              </a>
            </li>


                <li class="nav-li ">
                  <a class="d-flex align-items-center flex-column" href="jobs.jsp">
                    <svg class="nav-svg" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g><path fill="none" d="M0 0h24v24H0z"></path><path d="M12 1a5 5 0 0 1 5 5v2h3a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1h3V6a5 5 0 0 1 5-5zm5 10h-2v1a1 1 0 0 0 1.993.117L17 12v-1zm-8 0H7v1a1 1 0 0 0 1.993.117L9 12v-1zm3-8a3 3 0 0 0-2.995 2.824L9 6v2h6V6a3 3 0 0 0-2.824-2.995L12 3z"></path></g></svg>
                    <p class="small m-0">Ofertas Laborales</p>
                  </a>
                </li>
                <li class="nav-li ">
                  <a class="d-flex align-items-center flex-column" href="messages.jsp">
                    <svg class="nav-svg" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M256 32C114.6 32 0 125.1 0 240c0 49.6 21.4 95 57 130.7C44.5 421.1 2.7 466 2.2 466.5c-2.2 2.3-2.8 5.7-1.5 8.7S4.8 480 8 480c66.3 0 116-31.8 140.6-51.4 32.7 12.3 69 19.4 107.4 19.4 141.4 0 256-93.1 256-208S397.4 32 256 32zM128 272c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32zm128 0c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32zm128 0c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32z"></path></svg>
                    <p class="small m-0">Mensajes</p>
                  </a>
                </li>



                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle d-flex align-items-center flex-column" href="#" role="button" data-bs-toggle="dropdown"  aria-haspopup="true" aria-expanded="false" id="navbarDropdown">
                    <img id="nav-profile-photo" src="assets/img/<%=((User) session.getAttribute("user")).getImgPath()%>">
                    <div class="d-flex">
                      <p class="small m-0">Me</p>
                    </div>
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="profile.jsp?id=<%=((User) session.getAttribute("user")).getId()%>">View profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="signout.jsp">Sign out</a>
                  </div>
                </li>
          </ul>
        </div>
    </nav>

    <main class="main pt-3 pt-lg-4">
      <div class="container mt-5">
        <div class="row d-flex justify-content-start">




          <div id="userInformation" class="col-12 col-lg-6 col-xl-9 row d-flex justify-content-center p-1 pt-0 m-0 pe-lg-4">
            <div class="max-width p-0">

              <div style="height:33em;" id="profile-card" class="bg-white mt-1 mt-lg-0 px-3 py-2">
                <div class="mb-2">
                  <img src="assets/img/background.svg">
                  <img class="me-3" id="profile-page-photo" src="">
                </div>
                <div class="px-3" id="userInformation">
                  <h2 id="userName" class="fw-bold"></h2>
                  <p id="currentJob"></p>
                  
                  <div class="d-flex small">
                  	<p class="me-1" id="currentLocation"></p>
                  	-
                  	<a id="contactInfo" style="cursor:pointer;" class="text-primary fw-bold mx-1">Informacion de contacto</a>
                  </div>
                  
                  <div id="userButtons">
                  	<a type="Button" id="connectButton" class="fw-bold px-3 btn btn-primary rounded-pill">+ Conectar</a>
                  	<a type="Button" id="followButton" class="fw-bold px-3 btn btn-primary rounded-pill">+ Seguir</a>
                  </div>
                </div>
              </div>
            </div>

    




          </div>


      </div>
    </main>



	  <div class="fs-6 modal modal fade" id="contactInfoModal" tabindex="-1" aria-hidden="true">
	  	<div class="modal-dialog">
	  		<div class="modal-content">
	  			<div class="modal-header">
	  				<h1 id="userNameModal" class="modal-title fs-5 fw-bold"></h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	  			</div>
	  			<div class="modal-body">
	  				<section class="mb-4">
              			<h6>Informacion de contacto</h6>
              			<p id="userEmail" class="small my-0">Correo electronico: </p>
              			<p id="userPhone" class="small my-0">Telefono: </p>
					</section>
				</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		<%
			String query = "SELECT CODIGO_EMPRESA,NOMBRE FROM TBL_EMPRESAS";
		
			StringBuilder companies = new StringBuilder("{");
			
			try {
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
          		
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
          		ResultSet rs = ps.executeQuery();
          		
          		int i = 0;
          		
          		while(rs.next()) {
          			
          			companies.append(String.format("\"%s\"", ++i));
          			companies.append(":");
          			companies.append("{");
          			
          			companies.append("\"CODIGO_EMPRESA\"");
          			companies.append(":");
          			companies.append(String.format("\"%s\"", rs.getInt(1)));
          			companies.append(",");
          			
          			companies.append("\"NOMBRE\"");
          			companies.append(":");
          			companies.append(String.format("\"%s\"", rs.getString(2)));
          			
          			companies.append("}");
          			if(!rs.isLast()) companies.append(",");
          		}
          		companies.append("}");
          	} catch(Exception e) {
          		
          		System.out.println(e);
          	}
		%>
		<div class="fs-6 modal modal fade" id="addUserExperienceModal" tabindex="-1" aria-hidden="true">
	  	<div class="modal-dialog">
	  		<div class="modal-content">
	  			<div class="modal-header">
	  				<h1 id="userNameModal" class="modal-title fs-5 fw-bold">Agregar experiencia laboral</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	  			</div>
	  			<div class="modal-body">
	  				<section class="mb-2">
							<label for="">Puesto</label>
					</section>
					<section class="mb-4">
						<input id="jobPosition" class="form-control" name="" type="text" value="" placeholder="Puesto de trabajo"/>
					</section>
	  			
	  				<section class="mb-2">
						<label for="">Empresa</label>
					</section>
					<section class="mb-4">
						<select id="companies" class="form-select" aria-label="Default select example">
							<option value="0" selected>Seleccionar empresa</option>
						</select>
					</section>
					
					<section class="mb-2">
						<label for="">Fecha inicio</label>
					</section>
	  				<section class="mb-4">
						<input class="form-control" id="experienceStartDate" type="date">
					</section>
					
					<section class="mb-2">
						<label for="">Fecha fin</label>
					</section>
	  				<section class="mb-4">
						<input class="form-control" id="experienceEndDate" type="date">
					</section>
				</div>
				<div class="modal-footer">
        				<button id="sendExperienceButton" type="button" class="btn btn-primary">Agregar</button>
				</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		<%
			query = "SELECT CODIGO_INSTITUCION,NOMBRE FROM TBL_INSTITUCIONES";
		
			StringBuilder schools = new StringBuilder("{");
			
			try {
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
          		
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
          		ResultSet rs = ps.executeQuery();
          		
          		int i = 0;
          		
          		while(rs.next()) {
          			
          			schools.append(String.format("\"%s\"", ++i));
          			schools.append(":");
          			schools.append("{");
          			
          			schools.append("\"CODIGO_INSTITUCION\"");
          			schools.append(":");
          			schools.append(String.format("\"%s\"", rs.getInt(1)));
          			schools.append(",");
          			
          			schools.append("\"NOMBRE\"");
          			schools.append(":");
          			schools.append(String.format("\"%s\"", rs.getString(2)));
          			
          			schools.append("}");
          			if(!rs.isLast()) schools.append(",");
          		}
          		schools.append("}");
          	} catch(Exception e) {
          		
          		System.out.println(e);
          	}
		%>
		
		<div class="fs-6 modal modal fade" id="addUserEducationModal" tabindex="-1" aria-hidden="true">
	  	<div class="modal-dialog">
	  		<div class="modal-content">
	  			<div class="modal-header">
	  				<h1 id="userNameModal" class="modal-title fs-5 fw-bold">Agregar educacion</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	  			</div>
	  			<div class="modal-body">
	  				
	  				<section class="mb-2">
							<label for="">Titulo</label>
					</section>
					<section class="mb-4">
						<input id="educationTitle" class="form-control" name="" type="text" value="" placeholder="Titulo"/>
					</section>
	  			
	  				<section class="mb-2">
						<label for="">Institucion</label>
					</section>
					<section class="mb-4">
						<select id="educationSchools" class="form-select" aria-label="Default select example">
							<option value="0" selected>Seleccionar institucion</option>
						</select>
					</section>
					
					<section class="mb-2">
						<label for="">Fecha inicio</label>
					</section>
	  				<section class="mb-4">
						<input class="form-control" id="educationStartDate" type="date">
					</section>
					
					<section class="mb-2">
						<label for="">Fecha fin</label>
					</section>
	  				<section class="mb-4">
						<input class="form-control" id="educationEndDate" type="date">
					</section>
				</div>
				<div class="modal-footer">
        				<button id="sendEducationButton" type="button" class="btn btn-primary">Agregar</button>
				</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		<%
			query = "SELECT * FROM TBL_TIPOS_LOGROS";
		
			StringBuilder achievementTypes = new StringBuilder("{");
			
			try {
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
          		
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
          		ResultSet rs = ps.executeQuery();
          		
          		int i = 0;
          		
          		while(rs.next()) {
          			
          			achievementTypes.append(String.format("\"%s\"", ++i));
          			achievementTypes.append(":");
          			achievementTypes.append("{");
          			
          			achievementTypes.append("\"CODIGO_TIPO_LOGRO\"");
          			achievementTypes.append(":");
          			achievementTypes.append(String.format("\"%s\"", rs.getInt(1)));
          			achievementTypes.append(",");
          			
          			achievementTypes.append("\"NOMBRE\"");
          			achievementTypes.append(":");
          			achievementTypes.append(String.format("\"%s\"", rs.getString(2)));
          			
          			achievementTypes.append("}");
          			if(!rs.isLast()) achievementTypes.append(",");
          		}
          		achievementTypes.append("}");
          	} catch(Exception e) {
          		
          		System.out.println(e);
          	}
		%>
		
		<div class="fs-6 modal modal fade" id="addUserAchievementsModal" tabindex="-1" aria-hidden="true">
	  	<div class="modal-dialog">
	  		<div class="modal-content">
	  			<div class="modal-header">
	  				<h1 id="userNameModal" class="modal-title fs-5 fw-bold">Agregar logro</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	  			</div>
	  			<div class="modal-body">
	  			
	  				<section class="mb-2">
							<label for="">Titulo</label>
					</section>
					<section class="mb-4">
						<input id="achievementTitle" class="form-control" name="" type="text" value="" placeholder="Titulo"/>
					</section>
	  			
	  				<section class="mb-2">
						<label for="">Institucion</label>
					</section>
	  				<section class="mb-4">
						<select id="achievementSchools" class="form-select" aria-label="Default select example">
							<option value="0" selected>Seleccionar institucion</option>
						</select>
					</section>
					
					<section class="mb-2">
						<label for="">Tipo de logro</label>
					</section>
	  				<section class="mb-4">
						<select id="achievementTypes" class="form-select" aria-label="Default select example">
							<option value="0" selected>Seleccionar tipo de logro</option>
						</select>
					</section>
					
					<section class="mb-2">
						<label for="">Fecha de obtencion</label>
					</section>
	  				<section class="mb-4">
						<input class="form-control" id="achievementDate" type="date">
					</section>
				</div>
				<div class="modal-footer">
        				<button id="sendAchievementButton" type="button" class="btn btn-primary">Agregar</button>
				</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		<%
			query =
				"SELECT B.CODIGO_HABILIDAD,B.NOMBRE\r\n"
				+ "FROM(\r\n"
				+ "    SELECT CODIGO_HABILIDAD\r\n"
				+ "    FROM TBL_HABILIDADES_POR_USUARIOS\r\n"
				+ "    WHERE CODIGO_USUARIO = ?\r\n"
				+ ") A\r\n"
				+ "RIGHT JOIN TBL_HABILIDADES B\r\n"
				+ "ON A.CODIGO_HABILIDAD = B.CODIGO_HABILIDAD\r\n"
				+ "WHERE A.CODIGO_HABILIDAD IS NULL";
		
			StringBuilder result = new StringBuilder("{");
			
			try {
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
          		
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
				ps.setInt(1, ((User) request.getSession().getAttribute("user")).getId());
				          		
          		ResultSet rs = ps.executeQuery();
          		
          		int i = 0;
          		
          		while(rs.next()) {
          			
          			result.append(String.format("\"%s\"", ++i));
          			result.append(":");
          			result.append("{");
          			
          			result.append("\"CODIGO_HABILIDAD\"");
          			result.append(":");
          			result.append(String.format("\"%s\"", rs.getInt(1)));
          			result.append(",");
          			
          			result.append("\"NOMBRE\"");
          			result.append(":");
          			result.append(String.format("\"%s\"", rs.getString(2)));
          			
          			result.append("}");
          			if(!rs.isLast()) result.append(",");
          		}
          		result.append("}");
          	} catch(Exception e) {
          		
          		System.out.println(e);
          	}
		%>
		
		<div class="fs-6 modal modal fade" id="addUserSkillsModal" tabindex="-1" aria-hidden="true">
	  	<div class="modal-dialog">
	  		<div class="modal-content">
	  			<div class="modal-header">
	  				<h1 id="userNameModal" class="modal-title fs-5 fw-bold">Agregar habilidad</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	  			</div>
	  			<div class="modal-body">
	  				<section class="mb-4">
						<select id="skills" class="form-select" aria-label="Default select example">
							<option value="0" selected>Seleccionar habilidad</option>
						</select>
					</section>
				</div>
				<div class="modal-footer">
        				<button id="sendSkillButton" type="button" class="btn btn-primary">Agregar</button>
				</div>
				</div>
			</div>
		</div>
		
		

	<div id="myData" style="display:none;" data-user="<%=((User) session.getAttribute("user")).getId()%>"></div>


    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/Profile.js"></script>
    <script>
    	document.querySelector("a#followButton").addEventListener("click", Profile.follow.bind(null));
    	document.querySelector("a#connectButton").addEventListener("click", Profile.connect.bind(null));
    	
    	// Habilidades
    	let skills = '<%=result%>';
    	//
    	let schools = '<%=schools%>';
    	//
    	let achievementTypes = '<%=achievementTypes%>';
		//
		let companies = '<%=companies%>';
    	
    	Profile.loadSkills(skills);
    	Profile.loadSchools(schools);
    	Profile.loadAchievementTypes(achievementTypes);
    	Profile.loadCompanies(companies);
    	
    	//
    	document.querySelector("button#sendSkillButton").addEventListener("click", Profile.addSkill.bind(null, document.querySelector("select#skills")));
    	//
    	document.querySelector("button#sendAchievementButton").
    		addEventListener("click", Profile.addAchievement.bind(null,
    				document.querySelector("input#achievementTitle"),
    				document.querySelector("select#achievementSchools"),
    				document.querySelector("select#achievementTypes"),
    				document.querySelector("input#achievementDate")
    			)
    		);
    	//
    	document.querySelector("button#sendEducationButton").
    		addEventListener("click", Profile.addEducation.bind(null,
    				document.querySelector("input#educationTitle"),
    				document.querySelector("select#educationSchools"),
    				document.querySelector("input#educationStartDate"),
    				document.querySelector("input#educationEndDate")
    			)
    		);
    	//
    	document.querySelector("button#sendExperienceButton").
    		addEventListener("click", Profile.addExperience.bind(null,
    				document.querySelector("input#jobPosition"),
    				document.querySelector("select#companies"),
    				document.querySelector("input#experienceStartDate"),
    				document.querySelector("input#experienceEndDate")
    			)
    		);
    </script>
  </body>
</html>
