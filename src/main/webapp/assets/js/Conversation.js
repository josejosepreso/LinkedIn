/**
 * 
 */

class Conversation {
	
	constructor(sender, receiver) {
		
		this.sender = sender;
		this.receiver = receiver;
	}
	
	static load() {
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/get/conversation", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Conversation.processResponse.bind(xhr));
		xhr.send(`${window.location.search.replace("?", "")}`);
	}
	
	static processResponse() {
			
		if(this.readyState == 4) {
			
			if(this.status == 200) {
				
				let obj = JSON.parse(this.responseText);
								
				console.log(obj);
				
				let img = obj.FOTO_PERFIL;
				if(img === "null") img = "profile1.png";
				document.querySelector("img#userPhoto").src = `assets/img/${img}`;
				
				const userName = document.querySelector("a#userName")
				userName.innerText = obj.NOMBRE_USUARIO;
				userName.href="profile.jsp?id=" + obj.CODIGO_USUARIO;
			}
		}
	}
}

Conversation.load();