/**
 * 
 */

class Login {
	
	static send(email, password) {
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/login", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Login.processResponse.bind(xhr));
		xhr.send(Login.formData(email, password));
	}

	static processResponse() {
		
		if(this.readyState == 4) {
			
			if(this.status == 200) {
				
				
				let obj = JSON.parse(this.responseText);
				
				const answer = document.querySelector('div#answer');
				
				if(obj.status) {
					
					answer.classList.remove('text-danger');
					answer.classList.add('text-success');
				} else {
					
					answer.classList.remove('text-success');
					answer.classList.add('text-danger');
				}
				
				answer.innerHTML = `${obj.content}`;
				
				if(obj.status) window.location.replace("http://localhost:8080/LinkedIn/home.jsp");
			} else {
				
			}
		} else {
			
		}
	}

	static formData(email, password){
		
		let list = [];
		list.push(`email=${email.value}`);
		list.push(`password=${password.value}`);
		
		return list.join("&");
	}
}