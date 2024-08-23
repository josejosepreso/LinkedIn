class Connection {
	
	constructor(user) {
	
		this.user = user;
	}
	
	getHTML() {
		let html = document.createElement("div");
		html.style.borderRadius = "10px";
		html.style.width = "55vw";
		html.classList.add("bg-white", "mt-3", "p-3", "d-flex", "align-items-center");
		html.innerHTML = `
			<img class="main-profile-photo" src="assets/img/${this.user.img}">
			<p class="small mx-3">
				<a style="cursor:pointer;" class="h4 fw-bold" href="conversation.jsp?id=${this.user.id}">${this.user.name}</a>
			</p>
		`;

		// let jobTitle = html.children[0].children[0];
		// jobTitle.addEventListener("click", Job.showJobModal.bind(null, this.title, this.description, this.img, this.info, this.company, this.type));
		return html;
	}
	
	static load() {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/get/connections", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Connection.processResponse.bind(xhr));
		xhr.send();
	}
	
	static processResponse() {
		
		if(this.readyState == 4) {
			
			if(this.status == 200) {
				
				let connections = JSON.parse(this.responseText).content;
				
				console.log(connections);
				
				let conversations = document.querySelector("main#messages");
								
				for(let i in connections) {
					
					let img = connections[i].FOTO_PERFIL;
					if(img === "null") img = "profile1.png";
					
					let conversation = new Connection(new User(connections[i].CODIGO_USUARIO,connections[i].NOMBRE_USUARIO,img));
					conversations.appendChild(conversation.getHTML());
				}
			}
		}
	}
}

Connection.load();