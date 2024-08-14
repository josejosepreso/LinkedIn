/**
 * 
 */

class Login {
	
	static send(email, password) {
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/login", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Login.processResponse.bind(xhr, email, password));
		xhr.send(Login.formData(email, password));
	}

	static processResponse(email, password) {
		
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