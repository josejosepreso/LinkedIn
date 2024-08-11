/**
 * 
 */

class Register {
	
	static send(email, password) {
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/register", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Register.processResponse.bind(xhr, email, password));
		xhr.send(Register.formData(email, password));
	}
	
	static processResponse(email, password) {
		
		if(this.readyState == 4) {
			
			if(this.status == 200) {
				
				document.body.innerHTML = `<h1>${email.value}, ${password.value}</h1>`;
			}
		}
	}
	
	static formData(email, password){
		
		let list = [];
		list.push(`email=${email.value}`);
		list.push(`password=${password.value}`);
		
		return list.join("&");
	}
}