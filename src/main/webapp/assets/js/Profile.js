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
						usrInfo.appendChild(Profile.section("Experiencia Laboral", userExperience, "userExperience"));
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
						usrInfo.appendChild(Profile.section("Educacion", userEducation, "userEducation"));
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
						usrInfo.appendChild(Profile.section("Logros", userAchievements, "userAchievements"));
					}
					
					// Cargar informacion de habilidades
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
						usrInfo.appendChild(Profile.section("Habilidades", userSkills, "userSkills"));
					}
					
					// 
					if(parseInt(dto.content.SIGUIENDO)) {
						
						const followButton = document.querySelector("a#followButton");
						followButton.innerText = "✓ Siguiendo";
						followButton.classList.remove("btn-primary");
						followButton.classList.add("bg-black", "text-white");
					}
					
					//
					if(`${window.location.search.replace("?id=", "")}` == document.querySelector("div#myData").getAttribute("data-user")) {
											
						document.querySelector("div#userButtons").remove();
						
						
						const btn = document.createElement("a");
						btn.innerText = "Agregar";
						btn.classList.add("btn","btn-primary","text-white");
						
						btn.id = "addUserExperience";
						document.querySelector("div#userExperience").appendChild(btn.cloneNode(true));
						
						btn.id = "addUserEducation";
						document.querySelector("div#userEducation").appendChild(btn.cloneNode(true));
						
						btn.id = "addUserAchievements";
						document.querySelector("div#userAchievements").appendChild(btn.cloneNode(true));
						
						btn.id = "addUserSkills";
						document.querySelector("div#userSkills").appendChild(btn.cloneNode(true));
						
						// Eventos
						document.querySelector("a#addUserExperience").addEventListener("click", e => {
							let modal = new bootstrap.Modal(document.querySelector(`div#${e.target.id}Modal`));
							modal.show();
						});
						document.querySelector("a#addUserEducation").addEventListener("click", e => {
							let modal = new bootstrap.Modal(document.querySelector(`div#${e.target.id}Modal`));
							modal.show();
						});
						document.querySelector("a#addUserAchievements").addEventListener("click", e => {
							let modal = new bootstrap.Modal(document.querySelector(`div#${e.target.id}Modal`));
							modal.show();
						});
						document.querySelector("a#addUserSkills").addEventListener("click", e => {
							let modal = new bootstrap.Modal(document.querySelector(`div#${e.target.id}Modal`));
							modal.show();
						});
					}
					
				} else {
					
					
				}
				
			}
		}
	}
	
	static section(title, info, id) {

		let html = document.createElement("div");
		html.id = id;
		html.classList.add("mt-3", "max-width", "p-4", "bg-white");
		html.style.borderRadius = "10px";

		let h4 = document.createElement("h4");
		h4.classList.add("fw-bold");
		h4.innerText= `${title}`;

		html.appendChild(h4);
		html.appendChild(info);

		return html;
	}
	
	
	
	
	
	
	
	
	
	static connect() {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/connect", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Profile.processConnectResponse.bind(xhr));
		xhr.send(`${window.location.search.replace("?", "")}`);
	}
	
	static processConnectResponse() {
		if(this.readyState == 4) {
					
			if(this.status == 200) {
				
			}
		}
	}
	
	
	
	
	
	
	
	static follow() {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/follow", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Profile.processFollowResponse.bind(xhr));
		xhr.send(`${window.location.search.replace("?", "")}`);
	}
	
	static processFollowResponse() {
		
		if(this.readyState == 4) {
					
			if(this.status == 200) {
				
				if(JSON.parse(this.responseText)){
					
					const followButton = document.querySelector("a#followButton");
					followButton.innerText = "✓ Siguiendo";
					followButton.classList.remove("btn-primary");
					followButton.classList.add("bg-black", "text-white");
				}
			}
		}
	}
	
	
	static addExperience(jobPosition, company, startDate, endDate) {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/addexperience", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Profile.processUpdateUserResponse.bind(xhr));
		xhr.send(`jobPosition=${jobPosition.value}&company=${company.value}&startDate=${startDate.value}&endDate=${endDate.value}`);
	}
	
	static addAchievement(title, school, type, date) {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/addachievement", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Profile.processUpdateUserResponse.bind(xhr));
		xhr.send(`title=${title.value}&school=${school.value}&type=${type.value}&date=${date.value}`);
	}
	
	
	static addSkill(skill) {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/addskill", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Profile.processUpdateUserResponse.bind(xhr));
		xhr.send(`id=${skill.value}`);
	}
	
	static addEducation(title, school, startDate, endDate) {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/addeducation", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Profile.processUpdateUserResponse.bind(xhr));
		xhr.send(`title=${title.value}&school=${school.value}&startDate=${startDate.value}&endDate=${endDate.value}`);
	}
	
	static processUpdateUserResponse() {
		if(this.readyState == 4) {
							
			if(this.status == 200) {
				
				if(JSON.parse(this.responseText).status){
					
					document.querySelector("select#skills").value = "0";
					
					location.reload();
				}
			}
		}
	}
	
	
	
	static loadCompanies(companies) {
		
		let obj = JSON.parse(companies);
		
		const selectCompanies = document.querySelector("select#companies");
				
		Object.keys(obj).forEach((i) => {
					
			selectCompanies.innerHTML += `<option value="${obj[i].CODIGO_EMPRESA}">${obj[i].NOMBRE}</option>`;
		});
	}
	
	static loadSkills(skills) {
		
		let obj = JSON.parse(skills);
		
		const selectSkill = document.querySelector("select#skills");
		
		Object.keys(obj).forEach((i) => {
					
			selectSkill.innerHTML += `<option value="${obj[i].CODIGO_HABILIDAD}">${obj[i].NOMBRE}</option>`;
		});
	}
	
	static loadSchools(schools) {
			
		let obj = JSON.parse(schools);
		
		const selectAchievementSchool = document.querySelector("select#achievementSchools");
		const selectEducationSchool = document.querySelector("select#educationSchools");
		
		Object.keys(obj).forEach((i) => {
					
			selectAchievementSchool.innerHTML += `<option value="${obj[i].CODIGO_INSTITUCION}">${obj[i].NOMBRE}</option>`;
			selectEducationSchool.innerHTML += `<option value="${obj[i].CODIGO_INSTITUCION}">${obj[i].NOMBRE}</option>`;
		});
	}
	
	static loadAchievementTypes(achievementTypes) {
				
		let obj = JSON.parse(achievementTypes);
		
		const selectAchievementTypes = document.querySelector("select#achievementTypes");
		
		Object.keys(obj).forEach((i) => {
					
			selectAchievementTypes.innerHTML += `<option value="${obj[i].CODIGO_TIPO_LOGRO}">${obj[i].NOMBRE}</option>`;
		});
	}
	
}

Profile.read();

let contactInfo = document.querySelector("a#contactInfo");
contactInfo.addEventListener("click", e => {
    let modal = new bootstrap.Modal(document.querySelector(`div#${e.target.id}Modal`));
    modal.show();
});