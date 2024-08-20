class Profile {
	
	static read() {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/get/user", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Profile.processResponse.bind(xhr));
		xhr.send(`${window.location.search.replace("?", "")}`);
	}
	
	static processResponse() {
		
		if(this.readyState == 4) {
			
			if(this.status == 200) {
				
				let dto = JSON.parse(this.responseText);
				
				console.log(dto);
				
				if(dto.status) {
					
					document.querySelector("h2#userName").innerText = dto.content.INFORMACION_PERSONAL.NOMBRE_COMPLETO;
					document.querySelector("h1#userNameModal").innerText = dto.content.INFORMACION_PERSONAL.NOMBRE_COMPLETO;
					
					let userPicture = dto.content.INFORMACION_PERSONAL.NOMBRE_FOTO_PERFIL;
					if(userPicture === "null") userPicture = "profile1.png";
					document.querySelector("img#profile-page-photo").src = `assets/img/${userPicture}`;
					
					let currentJob = dto.content.INFORMACION_PERSONAL.PUESTO_ACTUAL;
					if(currentJob === "null") currentJob = "";
					document.querySelector("p#currentJob").innerText = currentJob;
					
					document.querySelector("p#currentLocation").innerText = dto.content.INFORMACION_PERSONAL.LUGAR_RESIDENCIA;
					
					// Modal informacion de contacto
					document.querySelector("p#userEmail").innerHTML += `<em>${dto.content.INFORMACION_PERSONAL.CORREO}</em>`;
					document.querySelector("p#userPhone").innerHTML += `<em>${dto.content.INFORMACION_PERSONAL.TELEFONO}</em>`;

					if(`${window.location.search.replace("?id=", "")}` == document.querySelector("div#myData").getAttribute("data-user")) {
						
						document.querySelector("div#userButtons").remove();
					}
					
					
					//
					const usrInfo = document.querySelector("div#userInformation");
					
					// Cargar descripcion usuario
					const description = dto.content.INFORMACION_PERSONAL.DESCRIPCION;
					if(description != "null"){
						const about = document.createElement("p");
						about.classList.add("small");
						about.innerText = dto.content.INFORMACION_PERSONAL.DESCRIPCION;
						usrInfo.appendChild(Profile.section("Acerca de", about));
					}
					
					// Cargar experiencia laboral del usuario
					const experience = dto.content.EXPERIENCIA;
					if(experience) {
						
						const userExperience = document.createElement("div");
						for(let i in experience){

							userExperience.innerHTML += `
								<p class="small">
									<strong>${experience[i].PUESTO}</strong>
									</br>
									${experience[i].EMPRESA}
									</br>
									${experience[i].TIEMPO}
								</p>
							`;
						}
						usrInfo.appendChild(Profile.section("Experiencia Laboral", userExperience));
					}
					
					// Cargar informacion de educacion del usuario
					const education = dto.content.EDUCACION;
					if(education) {
						
						const userEducation = document.createElement("div");
						for(let i in education){

							userEducation.innerHTML += `
								<p class="small">
									<strong>${education[i].TITULO}</strong>
									</br>
									${education[i].INSTITUCION}
									</br>
									${education[i].TIEMPO}
								</p>
							`;
						}
						usrInfo.appendChild(Profile.section("Educacion", userEducation));
					}
					
					// Cargar informacion de logros
					const achievements = dto.content.LOGROS;
					if(achievements) {
						
						const userAchievements = document.createElement("div");
						for(let i in achievements){
					
							userAchievements.innerHTML += `
								<p class="small">
									<strong>${achievements[i].TITULO}</strong>
									</br>
									${achievements[i].INSTITUCION}
									</br>
									${achievements[i].FECHA_OBTENCION}
								</p>
							`;
						}
						usrInfo.appendChild(Profile.section("Logros", userAchievements));
					}
					
					// Cargar informacion de logros
					const skills = dto.content.HABILIDADES;
					if(skills) {
						
						const userSkills = document.createElement("div");
						for(let i in skills){
					
							userSkills.innerHTML += `
								<p class="small">
									<strong>${i}</strong>
									</br>
									${skills[i]} Aprobaciones
								</p>
							`;
						}
						usrInfo.appendChild(Profile.section("Habilidades", userSkills));
					}
					
					
					
					
					
					
				} else {
					
					
				}
				
			}
		}
	}
	
	static section(title, info) {

		let html = document.createElement("div");
		html.classList.add("mt-3", "max-width", "p-4", "bg-white");
		html.style.borderRadius = "10px";

		let h4 = document.createElement("h4");
		h4.classList.add("fw-bold");
		h4.innerText= `${title}`;

		html.appendChild(h4);
		html.appendChild(info);

		return html;
	}
	
	
}

Profile.read();

let contactInfo = document.querySelector("a#contactInfo");
contactInfo.addEventListener("click", e => {
    let modal = new bootstrap.Modal(document.querySelector(`div#${e.target.id}Modal`));
    modal.show();
});