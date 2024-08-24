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
								
				// console.log(obj);
				
				let img = obj.FOTO_PERFIL;
				if(img === "null") img = "profile1.png";
				document.querySelector("img#userPhoto").src = `assets/img/${img}`;
				
				const userName = document.querySelector("a#userName")
				userName.innerText = obj.NOMBRE_USUARIO;
				userName.href="profile.jsp?id=" + obj.CODIGO_USUARIO;
				
				const messages = obj.content;
				
				const div = document.querySelector("div#messages");
				
				Object.keys(messages).forEach((i) => {
					
					let message = Conversation.message(messages[i].MENSAJE);
					
					if(messages[i].CODIGO_USUARIO_EMISOR == document.querySelector("div#myData").getAttribute("data-user-id")) {
						
						message.classList.add("justify-content-end");
					} else {
						
						message.classList.add("justify-content-start");
					}
					
					div.appendChild(message);
				});
			}
		}
	}
	
	static message(content) {
		
		let html = document.createElement("div");
		html.classList.add("d-flex", "my-2");
		
		html.innerHTML = `<span class="text-white rounded-3 small p-2" style="background-color:black">${content}</span>`;
		
		return html;
	}
	
	
	
	static send(sender, receiver, message) {

		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/send/message", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Conversation.processSendResponse.bind(xhr, message.value));
		xhr.send(`sender=${sender}&receiver=${receiver}&message=${message.value}`);
	}
	
	static processSendResponse(content) {
		if(this.readyState == 4) {
					
			if(this.status == 200) {
				
				let obj = JSON.parse(this.responseText);
												
				if(obj.status) {
					
					let message = Conversation.message(content);
					message.classList.add("justify-content-end");
					
					const messages = document.querySelector("div#messages");
					messages.appendChild(message);
					
					document.querySelector("input#message").value = "";
				}
			}
		}
	}
}

Conversation.load();