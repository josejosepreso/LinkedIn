<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="programLibraries.User" %>
<%
	if(session.getAttribute("user") == null) response.sendRedirect("http://localhost:8080/LinkedIn/index.jsp");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
    	<link rel="stylesheet" href="assets/css/style.css">
		<title>Insert title here</title>
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
	    
	    <div class="container">
	    
	    	<div class="form-control mt-2 p-3 d-flex align-items-center">
	    		<img id="userPhoto" class="conversation-profile-photo" src="">
	    		<a href="" class="fw-bold h4 fw-bold mx-3" id="userName"></a>
	    	</div>
	    	
	    	<div id="messages" style="height:58vh;overflow-y:scroll" class="form-control my-2 p-4">
	    	
	    		
	    		
	    		
	    	</div>
	    	
	    	<div style="height:10vh;" class="form-control mt-2 d-flex align-items-center">
	    		<input id="message" class="form-control mx-3" placeholder="Mensaje">
	    		<a id="sendButton" class="btn bg-black text-white">Enviar</a>
	    	</div>
	    	
	    </div>
	    
	    <div id="myData" style="display:none;" data-user-picture="<%=((User) session.getAttribute("user")).getImgPath()%>" data-user-name="<%=((User) session.getAttribute("user")).getFullName()%>" data-user-id="<%=((User) session.getAttribute("user")).getId()%>"></div>
	    
	    
	    <script src="assets/js/bootstrap.bundle.min.js"></script>
	    <script src="assets/js/Conversation.js"></script>
	    <script>
	    	let sender = <%=((User) session.getAttribute("user")).getId()%>;
	    	let receiver = window.location.search.replace("?id=", "");
	    	let message = document.querySelector("input#message");
	    	document.querySelector("a#sendButton").addEventListener("click", Conversation.send.bind(null, sender,receiver,message));
	    </script>
	</body>
</html>