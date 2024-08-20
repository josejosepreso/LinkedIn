class Job {
	constructor(title, description, img, info, company, type) {
		this.title = title;
		this.description = description
		this.img = img;
		this.info = info;
		this.company = company;
		this.type = type;
	}

	getHTML() {
		let html = document.createElement("div");
		html.style.borderRadius = "10px";
		html.style.width = "55vw";
		html.classList.add("bg-white", "my-3", "p-3");
		html.innerHTML = `
			<p class="small">
				<a style="cursor:pointer;" class="h4 fw-bold">${this.title}</a>
				</br>
				${this.description.substring(0, 250)}
			</p>
		`;

		let jobTitle = html.children[0].children[0];
		jobTitle.addEventListener("click", Job.showJobModal.bind(null, this.title, this.description, this.img, this.info, this.company, this.type));
		return html;
	}

	static showJobModal(title, description, img, info, company, type) {

		document.querySelector("h1#jobTitle").innerText = title;
		document.querySelector("p#jobDescription").innerText = description;
		if(img != "null") document.querySelector("img#jobImage").src = img;
		document.querySelector("p#information").innerText = info + ' personas aplicaron';
		document.querySelector("p#type").innerText = type;
		document.querySelector("p#company").innerText = company;

    	let modal = new bootstrap.Modal(document.querySelector(`div#showJobModal`));
		modal.show();
	}
	
	static read() {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/get/jobs", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Job.processResponse.bind(xhr));
		xhr.send();
	}
	
	static processResponse() {
		
		if(this.readyState == 4) {
			
			if(this.status == 200) {
				
				let jobList = JSON.parse(this.responseText).content;
				
				console.log(jobList);
				
				let jobs = document.querySelector("main#jobs");
				
				for(let i in jobList) {
					let newJob = new Job(jobList[i].TITULO, jobList[i].DESCRIPCION, jobList[i].FOTO, jobList[i].INFORMACION, jobList[i].EMPRESA, jobList[i].MODALIDAD);
					jobs.appendChild(newJob.getHTML());
				}
			}
		}
	}
}

Job.read();

let jobs = document.querySelector("main#jobs");

let jobList = {

	1:{

		title:"Java Developer",
		description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		img:"assets/img/posts/1.png"
	},
	2:{

		title:"Photographer",
		description:"Lorem iipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dpsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		img:"assets/img/posts/1.png"
	},
	3:{
		title:"Graphic Designer",
		description:"Lorem ipsum dolor sit amet, consectetur adipiscing",
		img:"assets/img/posts/1.png"
	}

};


