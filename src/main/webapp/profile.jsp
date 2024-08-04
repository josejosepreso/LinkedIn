<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
  </head>
  <body>

    <nav class="container navbar navbar-expand-lg navbar-white bg-white">
          <svg class="me-2" stroke="currentColor" fill="#0A66C2" stroke-width="0" viewBox="0 0 448 512" height="2.5em" width="2.5em" xmlns="http://www.w3.org/2000/svg"><path d="M416 32H31.9C14.3 32 0 46.5 0 64.3v383.4C0 465.5 14.3 480 31.9 480H416c17.6 0 32-14.5 32-32.3V64.3c0-17.8-14.4-32.3-32-32.3zM135.4 416H69V202.2h66.5V416zm-33.2-243c-21.3 0-38.5-17.3-38.5-38.5S80.9 96 102.2 96c21.2 0 38.5 17.3 38.5 38.5 0 21.3-17.2 38.5-38.5 38.5zm282.1 243h-66.4V312c0-24.8-.5-56.7-34.5-56.7-34.6 0-39.9 27-39.9 54.9V416h-66.4V202.2h63.7v29.2h.9c8.9-16.8 30.6-34.5 62.9-34.5 67.2 0 79.7 44.3 79.7 101.9V416z"></path></svg>

        <div class="d-flex justify-content-end align-items-center collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="d-flex justify-content-end align-items-center m-0 list-unstyled">

            <li class="nav-li">
              <a class="d-flex align-items-center flex-column home-link" href="home.jsp">
                <svg class="nav-svg" id="home-icon" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path d="M946.5 505L534.6 93.4a31.93 31.93 0 0 0-45.2 0L77.5 505c-12 12-18.8 28.3-18.8 45.3 0 35.3 28.7 64 64 64h43.4V908c0 17.7 14.3 32 32 32H448V716h112v224h265.9c17.7 0 32-14.3 32-32V614.3h43.4c17 0 33.3-6.7 45.3-18.8 24.9-25 24.9-65.5-.1-90.5z"></path></svg>
                <p class="small m-0">Home</p>
              </a>
            </li>


                <li class="nav-li ">
                  <a class="d-flex align-items-center flex-column" href="jobs.jsp">
                    <svg class="nav-svg" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g><path fill="none" d="M0 0h24v24H0z"></path><path d="M12 1a5 5 0 0 1 5 5v2h3a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1h3V6a5 5 0 0 1 5-5zm5 10h-2v1a1 1 0 0 0 1.993.117L17 12v-1zm-8 0H7v1a1 1 0 0 0 1.993.117L9 12v-1zm3-8a3 3 0 0 0-2.995 2.824L9 6v2h6V6a3 3 0 0 0-2.824-2.995L12 3z"></path></g></svg>
                    <p class="small m-0">Jobs</p>
                  </a>
                </li>
                <li class="nav-li ">
                  <a class="d-flex align-items-center flex-column" href="#">
                    <svg class="nav-svg" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M256 32C114.6 32 0 125.1 0 240c0 49.6 21.4 95 57 130.7C44.5 421.1 2.7 466 2.2 466.5c-2.2 2.3-2.8 5.7-1.5 8.7S4.8 480 8 480c66.3 0 116-31.8 140.6-51.4 32.7 12.3 69 19.4 107.4 19.4 141.4 0 256-93.1 256-208S397.4 32 256 32zM128 272c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32zm128 0c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32zm128 0c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32z"></path></svg>
                    <p class="small m-0">Messaging</p>
                  </a>
                </li>



                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle d-flex align-items-center flex-column" href="#" role="button" data-bs-toggle="dropdown"  aria-haspopup="true" aria-expanded="false" id="navbarDropdown">
                    <img id="nav-profile-photo" src="assets/img/profile.png">
                    <div class="d-flex">
                      <p class="small m-0">Me</p>
                    </div>
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="profile.jsp">View profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="index.jsp">Sign out</a>
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
                  <p>Web Developer</p>
                  <p class="small">Tegucigalpa, Honduras - <a id="contactInfo" style="cursor:pointer;" class="text-primary">Contact info</a></p>
                  <p class="small">0 connections</p>
                  <div id="userButtons">
                  	<a type="button" class="fw-bold px-3 btn btn-primary rounded-pill">+ Connect</a>
                  	<a style="border:1px solid #0d6efd;color:#0d6efd;" type="button" class="fw-bold px-3 btn bg-white rounded-pill">Message</a>
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
	  				<h1 class="modal-title fs-5 fw-bold">Cradily</h1>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	  			</div>
	  			<div class="modal-body">
	  				<section class="mb-4">
              <h5>Contact info</h5>
						</section>
				</div>
				</div>
			</div>
		</div>



    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/Profile.js"></script>
  </body>
</html>
