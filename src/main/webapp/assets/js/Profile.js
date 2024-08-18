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
				
				if(dto.status) {
					
					document.querySelector("h2#userName").innerText = dto.content.userInfo.NOMBRE_COMPLETO;
					document.querySelector("h1#userNameModal").innerText = dto.content.userInfo.NOMBRE_COMPLETO;
					
					let userPicture = dto.content.userInfo.NOMBRE_FOTO_PERFIL;
					if(userPicture === "null") userPicture = "profile1.png";
					document.querySelector("img#profile-page-photo").src = `assets/img/${userPicture}`;
					
					let currentJob = dto.content.userInfo.PUESTO_ACTUAL;
					if(currentJob === "null") currentJob = "";
					document.querySelector("p#currentJob").innerText = currentJob;
					
					document.querySelector("p#currentLocation").innerText = dto.content.userInfo.LUGAR_RESIDENCIA;
					
					document.querySelector("p#userEmail").innerHTML += `<em>${dto.content.userInfo.CORREO}</em>`;

					if(`${window.location.search.replace("?id=", "")}` == document.querySelector("div#myData").getAttribute("data-user")) {
						
						document.querySelector("div#userButtons").remove();
					}	
				} else {
					
					console.log(dto);
				}
				
			}
		}
	}
}

Profile.read();

let contactInfo = document.querySelector("a#contactInfo");
contactInfo.addEventListener("click", e => {
    let modal = new bootstrap.Modal(document.querySelector(`div#${e.target.id}Modal`));
    modal.show();
});

function section(title, info) {

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

let about = document.createElement("p");
about.classList.add("small");
about.innerText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

let contact = {};

let experience = {

	1:{
		title:"Data Analyst",
		company:"Google",
		date:"2015 - Present"
		
	},
	2:{
		title:"Waiter",
		company:"McDonalds",
		date:"2009 - 2015"
	}
};

let education = {

	1:{
		title:"Systems Engineer",
		school:"UNAH",
		date:"2000 - 2024"
	}
};

let l_c = {

	1:{
		title:"Programming Mobile Applications",
		issuer:"University of Colombia",
		date:"Issued Jan 2014"
	}
};

let skills = {

	1:{
		title:"Java",
		endorsements:1
	},
	2:{
		title:"Haskell",
		endorsements:10
	}
};

let languages = {

	1:{
		title:"English",
		level:"Basic"
	},
	2:{
		title:"Japanese",
		level:"Professional working proficiency"
	}
};

let usrInfo = document.querySelector("div#userInformation");

// ABOUT
usrInfo.appendChild(section("About", about));

// EXPERIENCE
let userExperience = document.createElement("div");
for(let i in experience){

	userExperience.innerHTML += `
		<p class="small">
			<strong>${experience[i].title}</strong>
			</br>
			${experience[i].company}
			</br>
			${experience[i].date}
		</p>
	`;
}
usrInfo.appendChild(section("Experience", userExperience));

// EDUCATION
let userEducation = document.createElement("div");
for(let i in education){

	userEducation.innerHTML += `
		<p class="small">
			<strong>${education[i].school}</strong>
			</br>
			${education[i].title}
			</br>
			${education[i].date}
		</p>
	`;
}
usrInfo.appendChild(section("Education", userEducation));

// LICENCES & CERTIFICATIONS
let userL_C = document.createElement("div");
for(let i in l_c){

	userL_C.innerHTML += `
		<p class="small">
			<strong>${l_c[i].title}</strong>
			</br>
			${l_c[i].issuer}
			</br>
			${l_c[i].date}
		</p>
	`;
}
usrInfo.appendChild(section("Licences & Certifications", userL_C));

// SKILLS
let userSkills = document.createElement("div");
for(let i in skills){

	userSkills.innerHTML += `
		<p class="small">
			<strong>${skills[i].title}</strong>
			</br>
			${skills[i].endorsements} endorsements
		</p>
	`;
}
usrInfo.appendChild(section("Skills", userSkills));

// LANGUAGES
let userLangs = document.createElement("div");
for(let i in languages){

	userLangs.innerHTML += `
		<p class="small">
			<strong>${languages[i].title}</strong>
			</br>
			${languages[i].level}
		</p>
	`;
}
usrInfo.appendChild(section("Languages", userLangs));
